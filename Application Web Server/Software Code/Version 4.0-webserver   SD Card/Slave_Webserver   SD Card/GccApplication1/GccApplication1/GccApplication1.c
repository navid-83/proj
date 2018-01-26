/*********************************************
 * vim:sw=8:ts=8:si:et
 * To use the above modeline in vim you must have "set modeline" in your .vimrc
 Developed by: Navid
 Application Web Server for Fuel Cell Diagnostic Device
 *
 * http://tuxgraphics.org/electronics/
 * Chip type           : Atmega88/168/328/644 with ENC28J60
 *********************************************/
//========================================================================================
#define F_CPU 16000000UL		//freq 16 MHz

//INCLUDES
#include <avr/io.h>
#include <stdlib.h>
#include <string.h>
#include "ip_arp_udp_tcp.h"
#include "websrv_help_functions.h"
#include "enc28j60.h"
#include "timeout.h"
#include "i2c.h" //header file for I2C interface functions
#include "UART_routines.h" //header file for UART interface functions
#include "avr_compat.h" //header file for diverse 
#include "net.h" //header file for some defines
#include "sensirion_protocol.h"
//========for SD CARD
#include <avr/pgmspace.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include "SPI_routines.h" // header file for SPI interface
#include "SD_routines.h" // header file for SD functions
#include "FAT32.h" // header file for FAT32 functions
//=====================================================================
//FOR WEBSERVER
//SERVER and PACKET CONFIGURATIONS

#define MYWWWPORT 80 //// server listen port for www
#define MYUDPPORT 1200 // listen port for udp
// global packet buffer

#define BUFFER_SIZE 550 // buffer message size
//======================================================================
//I2C CONFIGURATIONS
#define LOCAL_ADDR 0x07 //I2C address of this uC, I2C slave
#define TARGET_ADDR 0xA0 //I2C address of target uC, I2C master
#define LEDOFF PORTB|=(1<<PORTB1)
//====================================================================

//===========================================================================================
//LED control defines
#define LED_GREEN_ON SETBIT(PORTA,0)
#define LED_GREEN_OFF CLEARBIT(PORTA,0)
#define LED_RED_ON SETBIT(PORTA,1)      // set output to GND, red LED on
#define LED_RED_OFF CLEARBIT(PORTA,1)   // set output to GND, red LED on
// set output to VCC, red LED off
#define LEDON PORTB&=~(1<<PORTB1)      //LED enc28j60
#define LEDISOFF PORTB&(1<<PORTB1)     //LED enc28j60
//=====================================
//For SD CARD
#define INTERVAL 1000 	//interval in milliseconds, between two measurements
//interval defined here is approximate only, as the overhead delays
//are not added, error is more for smaller values (i.e. <100ms)
//minimum: 10; maximum: 600000 (600 seconds)

#define GREEN_LED_ON	SETBIT(PORTA,0)
#define GREEN_LED_OFF	CLEARBIT(PORTA,0)
#define RED_LED_ON		SETBIT(PORTA,1)
#define RED_LED_OFF		CLEARBIT(PORTA,1)
//======================================================================
//=========================================================================================
//FOR WEB SERVER
//===========================================================================================
static uint8_t buf[BUFFER_SIZE+1];
static int nPingCount = 0, nAccessCount = 0; // Global counters
static char baseurl[]=" http://10.0.0.10/";
static char password[]="ovgu"; // the password string (only the first 5 char checked), (only a-z,0-9,_ characters):// it must not be longer than 9 char
unsigned char BUF123[50];
unsigned char receiveData[10];


//int hexNum = 0x303233;



uint16_t plen;
uint16_t dat_p;
u08 receiveDataLength;
int data; data = 0;
//=========================================================================================
//FOR SD CARD
unsigned char time[9]; 	//xx:xx:xx;
unsigned char date[11];	//xx/xx/xxxx;
unsigned char day;
unsigned char temperature[7];
unsigned char voltage[7];
unsigned char voltage2[7];
unsigned char current2[7];

unsigned char option, error, i, j, channel;   //inja "data" ro khodam bardashtam chon conflict dasht
unsigned char fileName[13];
unsigned int delay, k;


//====================================================================
// --- there should not be any need to changes things below this line ---


static uint8_t mymac[6] = {0x54,0x55,0x58,0x10,0x00,0x24};
static uint8_t myip[4] = {10,0,0,10}; // URL http://10.0.0.10/

// Default gateway. The ip address of your DSL router. It can be set to
// the same as the web server in the case where there is no default GW to access the
// web server (=web server is on the same lan as this host)

static uint8_t gwip[4] = {10,0,0,20};     //Gateway
//After that you initialize the web client:

//============================================================================================

//=============================================================================================
//STARTING OF VOIDS

//WEB SERVER
//FOR WEB SERVER
uint8_t verify_password(char *str)
{
	// the first characters of the received string are
	// a simple password/cookie:
	if (strncmp(password,str,5)==0)
	{
		return(1);
	}
	return(0);
}
// takes a string of the form password/commandNumber and analyse it
// return values: -1 invalid password, otherwise command number
//                -2 no command given but password valid
int8_t analyse_get_url(char *str)
{
	uint8_t i=0;
	if (verify_password(str)==0)
	{
		return(-1);
	}
	// find first "/"
	// passw not longer than 9 char:
	while(*str && i<10 && *str >',' && *str<'{')
		{
			if (*str=='/')
			{
				str++;
				break;
			}
			i++;
			str++;
		}
		if (*str < 0x3a && *str > 0x2f)
		{
			// is a ASCII number, return it
			return(*str-0x30);
		}
		return(-2);
	}
	
// slave operations
void i2cSlaveReceiveService(u08 receiveDataLength, u08* receiveData) // calls when message per I2C was received
{
	LED_RED_ON; //LED ON //sprintf(BUF,"slave received: %s (length %d)",receiveData,receiveDataLength);
	sprintf(BUF123,"%s",receiveData);
	usart_write_str(BUF123);TX_NEWLINE; //show received message in UART-software (Terminal)	//_delay_ms(1); //when needed, some delay
	LED_RED_OFF;  //LED off
}



//===============================================================================================
#define VERSIONSTRING "<br><hr>version 3.3\n"
// number of sensors (exmple: if you connect PD0 and PD1 then set to 2)
#define MAX_SENSORS 2
unsigned int gHumival_raw[MAX_SENSORS],gTempval_raw[MAX_SENSORS];
uint8_t gSensorErrors[MAX_SENSORS];
uint8_t gAllSensorsReadOnce=0;
//
static volatile uint8_t cnt2step=0;
static volatile uint8_t gSec=0;
//========================================================
// convert temperature to kelvin times 10
int c2f(int celsiustimes10){
	return((celsiustimes10 * 18 + 3200)/10);
}


uint16_t http200ok(void)
{
	return(fill_tcp_data_p(buf,0,PSTR("HTTP/1.0 200 OK\r\nContent-Type: text/html\r\nPragma: no-cache\r\n\r\n")));
	}

uint16_t print_webpage(uint8_t *buf)
{
	char temp_string[10];
	char current_string[10];
	char voltage_string[10];
	
	int i=0;
	uint16_t plen;
	//getcurrenttemp(temp_string); get temperature of the cell
	//getcurrenttemp(current_string); get current of the cell
	//getcurrenttemp(voltage_string); get voltage of the cell
	
	plen=http200ok();
  
	plen=fill_tcp_data_p(buf,plen,PSTR("<pre>"));
	plen=fill_tcp_data_p(buf,plen,PSTR("<center><p><h1> Web Server Application for Diagnostic Devices in Fuel Cell Systems V1.0 |LENA OVGU </h1></p></h2>         "));
	plen=fill_tcp_data_p(buf,plen,PSTR("<left><style>body{background-color:grey;font:10pt/12pt fantasy;</style><h2>"));
    
	plen=fill_tcp_data_p(buf,plen,PSTR("Sensors on Web </h2>   "));
		
	plen=fill_tcp_data_p(buf,plen,PSTR("<left><h2>Current Temperature is = 36 C </h2>   "));
	
	
		while(temp_string[i]){
			buf[TCP_CHECKSUM_L_P+3+plen]=temp_string[i+1];
			plen++;
		}
	
	plen=fill_tcp_data_p(buf,plen,PSTR("<left><h2>Current Density is = 4.15 A </h2>   "));
	plen=fill_tcp_data_p(buf,plen,PSTR("<left><h2>Voltage is = 45 V </h2>     "));
	plen=fill_tcp_data_p(buf,plen,PSTR("<hr><br></form> Developed by LENA-OVGU  \   version 1.0"));
	plen=fill_tcp_data_p(buf,plen,PSTR("<h2>"));
	plen=fill_tcp_data(buf,plen,baseurl);


	return(plen);
}




void adddecimalpoint(char *str){
	char c;
	if (*str == '-'){
		str++;
	}
	if (*(str+1) == '\0'){
		// just one digit
		c=*str;
		*str='0';
		*(str+1)='.';
		*(str+2)=c;
		*(str+3)='\0';
		return;
	}
	while(*str){
		c=*str;
		str++;
		if (!*str){
			// last char, insert a dot
			*(str-1)='.';
			*str=c;
			str++;
			*str='\0';
		}
	}
}


//======================================================================
//SD CARD
//===============================================================
void port_init(void)
{
	PORTA = 0x00;
	DDRA  = 0x03; //PA0 - LED GREEN, PA1 - LED RED
	//PORTB = 0x00; //pull-up on for pushbutton
	//DDRB  = 0xBF; //MISO line i/p, rest o/p
	PORTC = 0x00;
	DDRC  = 0x00;
	PORTD = 0x00;
	DDRD  = 0x00;
}

//call this routine to initialize all peripherals
void init_devices(void)
{
	cli();  //all interrupts disabled
	port_init(); //init Ports
	swspi_init(); //start SPI
	usart_init(9600); //start UART
	//all peripherals are now initialized
}

void blinkRedLED(void)
{
	while(1)  //blink red LED continuously, if error
	{
		RED_LED_ON;
		_delay_ms(200);
		RED_LED_OFF;
		_delay_ms(200);
	}
}


//******************************************************************
//Function to form time string for sending it to LCD & UART

unsigned char GetTime(void)
{
	time[8] = 0x00;	//NULL
	time[7] = '0';	//seconds(1's)
	time[6] = '0';	//seconds(10's)
	time[5] = ':';
	
	time[4] = '2';
	time[3] = '2';
	time[2] = ':';
	
	time[1] = '4';
	time[0] = '1';

	return 0;
}
//******************************************************************
//Function to form date string for sending it to LCD & UART
//****************************************************************** 
unsigned char GetDate(void)
{
  date[10] = 0x00;  //NULL
  date[9] = '4';
  date[8] = '1';
  date[7] = '0';
  date[6] = '2';
  date[5] = '/';
  date[4] = '8';
  date[3] = '0';
  date[2] = '/';
  date[1] = '8';
  date[0] = '1';
  
  return 0;
}
//********************************************************************
//Purpose : Read temperature from DS18b20 1wire
//Paramtr : void
//returns : None (modifies the global string 'temperature')
//********************************************************************
void GetTemperature(void)
{
	temperature[6] = 'C';  //centigrade
	temperature[5] = '0'; //ascii value for degree symbol
	temperature[4] = '0';
	temperature[3] = '.';
	temperature[2] = '6';
	temperature[1] = '3';
	temperature[0] = '+';
}

void Getvoltage2(void)
{
	voltage2[6] = 'V';  //centigrade
	voltage2[5] = '0'; //ascii value for degree symbol
	voltage2[4] = '0';
	voltage2[3] = '.';
	voltage2[2] = '5';
	voltage2[1] = '4';
	voltage2[0] = '+';
}

void Getcurrent2(void)
{
	current2[6] = 'A';  //centigrade
	current2[5] = '0'; //ascii value for degree symbol
	current2[4] = '5';
	current2[3] = '1';
	current2[2] = '.';
	current2[1] = '4';
	current2[0] = '+';
}





//=====================================================================

//===================================================================================================================
//PROGRAM MAIN
int main(void){
	
	//first for WEB SERVER
	//===================================================
	_delay_loop_1(0); // 60us
	DDRB|= (1<<DDB1); // LED, enable PB1, LED as output
	LEDOFF;           // related to ENC28j60
	//==============================================================================
	
	//initiliaze the UART// currently it is not needed
	usart_init(9600); /*initialize UART with baud rate 9600*/
	//some variables for udp-server
	uint8_t cmd_pos=0;
	char cmdval;
	char *p = NULL;
	int count_num;
	char str999[30];
	unsigned short data_num;
	char data_num_str[30];
	uint8_t payloadlen=0;
	char str[30];
	
	//===========================================================================
	//initialize the hardware driver for the enc28j60
	enc28j60Init(mymac);
	enc28j60clkout(2); // change clkout from 6.25MHz to 12.5MHz
	_delay_loop_1(0); // 60us
	enc28j60PhyWrite(PHLCON,0x476);
	init_udp_or_www_server(mymac,myip); //init the ethernet/ip layer:// or better to use init_ip_arp_udp_tcp(mymac,myip,MYWWWPORT);
	www_server_port(MYWWWPORT);  //this mywwport is previously defined to be 80
	//===========================================================================
	// initialize i2c function library
	void i2cInit(void);
	void i2cSetLocalDeviceAddr(u08 deviceAddr, u08 genCallEn);                    // set local device address and allow response to general call
	usart_write_str("*************OVGU TWI SLAVE RUNNING*************");TX_NEWLINE;    // string for out, to test running of UART and I2C
	void i2cSetSlaveReceiveHandler( i2cSlaveReceiveService );                     // start of interrupt for receiving of I2C messages
	//==============================================================================
//VOID for SD CARD

unsigned char option, error, i, j, data, channel; //inja data momkene conflict kone
unsigned char fileName[13];
unsigned int delay, k;

_delay_ms(100);  // delay for VCC stabilization

init_devices(); // init devices

GREEN_LED_ON;  // turn on green LED to indicate power on
//blinkGREENLED();
RED_LED_OFF; 	 // keep red LED off for now

// test UART
transmitString_F (PSTR("\n\r\n\r****************************************************"));
transmitString_F (PSTR("\n\r         microSD Datalogger - LENA OVGU "));
transmitString_F (PSTR("\n\r****************************************************\n\r"));

cardType = 0;

// try to init SD card
for (i=0; i<10; i++)
{
	error = SD_init();
	if(!error) break;
}

if(error)
{
	if(error == 1) transmitString_F(PSTR("SD card not detected.."));
	if(error == 2) transmitString_F(PSTR("Card Initialization failed.."));
	
	blinkRedLED();
}

switch (cardType)
{
	case 1:transmitString_F(PSTR("Standard Capacity Card (Ver 1.x) Detected!"));
	break;
	case 2:transmitString_F(PSTR("High Capacity Card Detected!"));
	break;
	case 3:transmitString_F(PSTR("Standard Capacity Card (Ver 2.x) Detected!"));
	break;
	default:transmitString_F(PSTR("Unknown SD Card Detected!"));
	break;
}

error = getBootSectorData (); //read boot sector and keep necessary data in global variables
if(error)
{
	transmitString_F (PSTR("\n\rFAT32 not found!"));  //FAT32 incompatible drive
	blinkRedLED();
}

//SPI_HIGH_SPEED;		//SCK - 8 MHz
_delay_ms(10);		//some delay for settling new spi speed


			        while(1)
			        {
				        					RED_LED_ON;  //turn on red LED to indicate that recording has started
				        					
				        					error = GetDate(); //get date
				        					if(error) blinkRedLED();

				        					j=0;
				        					//create filename from date
				        					for(i=0; i<8; i++)
				        					{
					        					fileName[i] = date[j++];
					        					if(j==2 || j==5) j++;	//excluding the '/' character from date in the fileName
				        					}
				        					//extension
				        					fileName[8] = '.';
				        					fileName[9] = 'C';
				        					fileName[10] = 'S';
				        					fileName[11] = 'V';

				        					error = GetTime(); //get time
				        					if(error) blinkRedLED();
				        					
				        					//From here onwards, gather data by appending strings in dataString
				        					//dataString is declared in FAT32.h
				        					//make sure dataString doesn't exceed its MAX_STRING_SIZE, defined in FAT32.h
				        					//Also, end the data string with '\r' & '\n' characters to maintain CSV format

				        					for(i=0; i<10; i++) dataString[i] = date[i];
				        					dataString[i++] = ';';

				        					for(j=0;j<8; j++)  dataString[i++] = time[j];
				        					dataString[i++] = ';';
				        					
				        					GetTemperature(); //read temperature
				        					for(j=0;j<7; j++)  dataString[i++] = temperature[j];
				        					dataString[i++] = '\r';	//always end the string with these two characters,
				        					dataString[i] = '\n';	//before calling the writeFile function
				        					
											Getvoltage2();
											for(j=0;j<7; j++)  dataString[i++] = voltage2[j];
											dataString[i++] = '\r';	//always end the string with these two characters,
											dataString[i] = '\n';	//before calling the writeFile function
																				
											Getcurrent2();
											for(j=0;j<7; j++)  dataString[i++] = current2[j];
											
											dataString[i++] = '\r';	//always end the string with these two characters,
											dataString[i] = '\n';	//before calling the writeFile function
											
																				
											error = writeFile(fileName); // write to file in SD card
				        					usart_write_str (dataString); // write to UART
				        					if(error) blinkRedLED();

				        					delay = INTERVAL / 10;
				        					for(k=0; k<delay; k++)
				        					{
					        					_delay_ms(10);  //10ms delay in each loop
					        					
					        					RED_LED_OFF;  //turn off red LED to indicate that recording has stopped
				        					}
						
						while (1)
						{
									
		 // read packet, handle ping and wait for a tcp packet:
		 dat_p=packetloop_arp_icmp_tcp(buf,enc28j60PacketReceive(BUFFER_SIZE, buf));
		 // dat_p will be unequal to zero if there is a valid  http get
		 if(dat_p==0){
			 // no http request
			 if (enc28j60linkup()){
				 LEDON;
				 }else{
				 LEDOFF;
			 }
			 continue;
		 }
		 // tcp port 80 begin
		 if (strncmp("GET ",(char *)&(buf[dat_p]),4)!=0){
			 // head, post and other methods:
			 dat_p=http200ok();
			
			 dat_p=fill_tcp_data_p(buf,dat_p,PSTR("<h1>200 OK</h1>"));
			 goto SENDTCP;
		 }
		 
		 
		 
		 

		 
		 
		 
		 
		 // just one web page in the "root directory" of the web server
		 if (strncmp("/ ",(char *)&(buf[dat_p+4]),2)==0){




			 dat_p=print_webpage(buf);
			 goto SENDTCP;
			 }else{
			 dat_p=fill_tcp_data_p(buf,0,PSTR("HTTP/1.0 401 Unauthorized\r\nContent-Type: text/html\r\n\r\n<h1>401 Unauthorized</h1>"));
			 goto SENDTCP;
		 }
							
						}
						
				        
				       
				        SENDTCP:
				        www_server_reply(buf,dat_p); // send web page data
				        // tcp port 80 end
						make_tcp_ack_from_any(buf);
						make_tcp_ack_with_data(buf,plen);
						continue;
						
						
	//2nd while for SD CARD

						
						
			        }
			        return (0);
					
					
		        }
					