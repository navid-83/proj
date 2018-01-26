

//****************************************MULTI-CHANNEL DATA ACQUISITION AND LOGGER SYSTEM FOR CPV TECHNOLOGY******
// This code is written particularly for requirement of this project. This code is based on development of LABVIEW 
//as the GUI for display and logging of the data acquired from the sensors





//==================inckude=================================
#include<pic.h>
#include<pic16F877A.h>
#include<pic.h>

//===============configuration==============================
__CONFIG (0x3F32);

//===============define IO port=============================
#define _XTAL_FREQ 20000000
#define		lcd			PORTD 
#define		RS			RB4
#define		E			RB5
#define		CHANNEL0	0b10000001	// AN0
#define		CHANNEL1	0b10001001	// AN1
#define		CHANNEL2	0b10010001	// AN2
#define		CHANNEL3	0b10011001	// AN3
#define		buzzer		        RB0 // light 
#define		lamp		        RC0 // light 
#define		fan 		        RC1 // fan 
#define     button              RC7// press button
#define     button1             RC5//
#define     servo               RC4// servo motor

//==============FUNCTION PTOTOTYPE=========================
void e_pulse(void);
void delay(unsigned short i);
void pause (unsigned short e);
void send_char(unsigned char data);
void send_config(unsigned char data);
void lcd_goto(unsigned char data);
void lcd_clr(void);
void send_string(const char *s);
void dis_num(unsigned long data);   
void increment(unsigned long data); 
void read_adc(void);                // this function is for reading value of sensor ***adc reading***
unsigned short read_temp(void);     
unsigned char dummy;
void putch(unsigned char c);
void putchdec(unsigned char c);
void putchhex(unsigned char c);
void putst(register const char *str);
//====================MAIN================================
unsigned short result;
unsigned short temp,light,temperature, voltage, current, MPP, transfer; //introduce 5 variable for sensors 
unsigned short e;
unsigned char i;	
unsigned char c;	
void main(void)
{
	ADRESH=0;					//clear A/D result
	ADRESL=0;					//clear A/D result

	//setting ADCON1 Register
	ADCON1=0b11000000;			// A/D result right justified, it is modified to ALL AN channels as analoug input 				
								// configure RA2 and RA5 as digital I/O// have changed

	TRISA=0b11111111;			//configure PORTA as input 
	TRISB=0b00000000;			//configure PORTB as output
	TRISC=0b00000000;			//configure PORTC as output
    TRISD=0b00000000;           //configure PORTd as output
	PORTA=0;
	PORTB=0;
    PORTC=0;


    send_config(0b00000001);		//clear display at lcd
	send_config(0b00000010);		//Lcd Return to home 
	send_config(0b00000110);		//entry mode-cursor increase 1
	send_config(0b00001100);		//diplay on, cursor off and cursor blink off
	send_config(0b00111000);		//function set
		


   	/* Configure IO pins. */ 
   	
	TRISC6 = 1; 
   	TRISC7 = 1;    //TRISC7=1

   	/* Set baud rate. */ 
   	SPBRG = 129; 	//9600 at 20Mhz
   //	SPBRG = 129;	//9600 at 20MHz                      SPBRG = (Fosc / (16 x Baud rate)) - 1, BRGH = 1 High Speed
   	BRGH = 1;
   
   	/* Select asynchron mode. */ 
   	SYNC  = 0; 

   	/* Enable transmission.*/ 
   	TX9   = 0;         //8 bit transmission 
   	TXEN  = 1;           //tx enabled    //Enabling SPBRG

   	/* Enable reception.*/ 
   	RX9   = 0;         //8 recption 
   	CREN  = 1;           //rx enabled 

   	/* Enable UART module.*/ 
   	SPEN  = 1; 



	while(1)					
	{

	 

		lcd_goto(0);					//cursor start from beginning
		
		//display character on LCD

		send_char('L');
		send_char('I');
		send_char('G');
		send_char('H');
		send_char('T');
		send_char('=');	

		lcd_goto(20);					//cursor go to 2nd line of the LCD

		//display character on LCD
	
		send_char('T');
		send_char('E');
		send_char('M');
		send_char('P');
		send_char('=');	

		lcd_goto(-24);					//cursor go to 3rd line of the LCD

		//display character on LCD

		send_char('V');
		send_char('O');
		send_char('L');
		send_char('T');
		send_char('A');
		send_char('G');	
		send_char('E');
		send_char('=');		

		lcd_goto(40);					//cursor go to 4th line of the LCD

		//display character on LCD

		send_char('C');
		send_char('U');
		send_char('R');
		send_char('R');
		send_char('E');
		send_char('N');	
		send_char('T');
		send_char('=');	


		while(1)						//infinity loop
		{

//--------------------------Light Sensor LDR

		//sensor A //LDR
		ADCON0=CHANNEL0;				//CHANNEL1=0b10001001 //CHANNEL0 is for Light 
		lcd_goto(8);
		read_adc();                     //This function generates the average reading value of ADC
    	light=read_temp();               //This function stores the generated value by ADC into the variable "temp"
      	
		dis_num(light/10);               //show the value 
		send_char('.');                  //this line is to show . to seprate desimal value from double value
		dis_num(light%10);               //show the double value 

	
		putch(light/10);                  //Transmitting the data to UART
	


//--------------------------Temperature Sensor LM35

		//sensor B //LM35
		ADCON0=CHANNEL1;			         	//CHANNEL0=0b10000001	//it opens a new channel of data		
        lcd_goto(28);                    
		read_adc();
        temperature=read_temp();
        temperature = (temperature*0.48876);
        
		putch(temperature);

		dis_num(temperature);

		send_char(0b11011111);                 
    	send_char('C');
		send_char(' ');
		send_char(' ');

			if(temperature>40)                 // when the temperature goes above the 40 degree Celsius the LED is activate otherwise the fan is deactivated		
				{							
					RB0=1;			
				}	

			else  
				{							
					RB0=0;			   		
				}


			//delay(2000);

//--------------------------Voltage Sensor


		//sensor C //VOLTAGE
		ADCON0=CHANNEL2;			                                  	//CHANNEL1=0b10001001 //CHANNEL0 is for voltage
		lcd_goto(-16);
		read_adc();                                                  //This function generates the average reading value of ADC
    	voltage=read_temp();                                        //This function stores the generated value by ADC into the variable "temp"
      	
		voltage=(voltage*4.836587680029639272430897954192);
		

		putch(voltage);				

		dis_num(voltage/10);
		send_char('.');                                               //this line is to show . to seprate desimal value from double value
		dis_num(voltage%10);                                          //show the double value 
		send_char(' ');
		send_char('V');
		send_char(' ');
		//voltage=temp;

//--------------------------Current Sensor

		//sensor D //CURRENT
		ADCON0=CHANNEL3;				//CHANNEL1=0b10001001 //CHANNEL0 is for current
		lcd_goto(48);
		read_adc();                    							//This function generates the average reading value of ADC
    	current=read_temp();              						//This function stores the generated value by ADC into the variable "temp"
		
		current=current/3;
	

		putch(current);	

	    dis_num(current/10);                 //show the value 
		send_char('.');                     //this line is to show . to seprate desimal value from double value
		dis_num(current%10);               //show the double value 
		//current=temp;
		send_char(' ');
		send_char('A');
		send_char(' '); 


//=========================================

		
		
		lcd_goto(55);					//cursor go to 3rd line of the LCD

		//display character on LCD

		//send_char(' ');
		//send_char(' ');	
		send_char('P');
		send_char('=');
		
		
		MPP=voltage * current;
		MPP=MPP/10;
		putch(MPP);	
	    dis_num(MPP/10);               //show the value 
		send_char('.');                 //this line is to show . to seprate desimal value from double value
		dis_num(MPP%10);               //show the double value 
}                  

}
   	
}
	
//==================subroutine LCD setting ==========================

void send_config(unsigned char data)
{
 	RS=0;
	lcd=data;
	delay(500);
	e_pulse();
}

void e_pulse(void)
{
	E=1;
	delay(500);
	E=0;
	delay(500);
}

void send_char(unsigned char data)
{
 	RS=1;
	//lcd=data;
	lcd=data;
	lcd=data;
	lcd=data;
	delay(500);
	e_pulse();
}


void lcd_goto(unsigned char data)
{
 	if(data<16)
	{
	 	send_config(0x80+data);
	}
	else
	{
	 	data=data-20;
		send_config(0xc0+data);
	}
}


void lcd_clr(void)
{
	RS=0;
 	send_config(0x01);
	delay(600);	
}


void send_string(const char *s)			//send a string to display in the lcd
{          
	unsigned char i=0;
  	while (s && *s)send_char (*s++);

}



void dis_num(unsigned long data)
{
	unsigned char hundred_thousand;
	unsigned char ten_thousand;
	unsigned char thousand;
	unsigned char hundred;
	unsigned char tenth;

	hundred_thousand = data/100000;					
	data = data % 100000;
	ten_thousand = data/10000;
	data = data % 10000;
	thousand = data / 1000;
	data = data % 1000;
	hundred = data / 100;
	data = data % 100;
	tenth = data / 10;
	data = data % 10;

	if(hundred_thousand>0)
	{
		send_char(hundred_thousand + 0x30);	//0x30 added to become ASCII code
		send_char(ten_thousand + 0x30);
		send_char(thousand + 0x30);
		send_char(hundred + 0x30);
		send_char(tenth + 0x30);
		send_char(data + 0x30);
	}

	else if(ten_thousand>0) 
	{
		send_char(ten_thousand + 0x30);	//0x30 added to become ASCII code
		send_char(thousand + 0x30);
		send_char(hundred + 0x30);
		send_char(tenth + 0x30);
		send_char(data + 0x30);
	}
	else if(thousand>0)
	{
 		send_char(thousand + 0x30);	//0x30 added to become ASCII code
		send_char(hundred + 0x30);
		send_char(tenth + 0x30);
		send_char(data + 0x30);
	}
	else if(hundred>0)
	{
 		send_char(hundred + 0x30);	//0x30 added to become ASCII code
		send_char(tenth + 0x30);
		send_char(data + 0x30);
	}
	else if(tenth>0)
 	{
		send_char(tenth + 0x30);	//0x30 added to become ASCII code
		send_char(data + 0x30);
	}
	else send_char(data + 0x30);	//0x30 added to become ASCII code
}

void increment(unsigned long data)
{	
	unsigned short j;
	for(j=10;j>0;j--)
	{	lcd_goto(32);
		data=data+1;
		dis_num(data);
		delay(10000);
	}

}


//==================subroutine ADC=========================

void read_adc(void)                                                                 ////This function generates the average reading value of ADC
{
	unsigned short i;
	unsigned long result_temp=0;
	for(i=2000;i>0;i-=1)															//looping 2000 times for getting average value 
	
{

	    ADGO = 1;			  			//ADGO is the bit 2 of the ADCON0 register
		while(ADGO==1);					//ADC start, ADGO=0 after finish ADC progress
		result=ADRESH;
		result=result<<8;				//shift to left for 8 bit
		result=256*result|ADRESL;			//10 bit result from ADC
		result_temp+=result;

		}


	result = result_temp/2000;			//getting average value

}


unsigned short read_temp(void)                 ///This function stores the generated value by ADC into the variable "temp"

{

	unsigned short temp;
	temp=result;
	return temp;

}

//==================subroutine DELAY==========================

void delay(unsigned short i)

{	

	for(;i>0;i--);

}

//=================subrouting Pause===========================

void pause (unsigned short e)


{

for(e=0;e<45*5; e++);   // for 45 seconds

}

//====================Subroutine UART=========================

//writes a character to the serial port
void putch(unsigned char c)
{
	while(!TXIF)			//set when register is empty
	{

		CLRWDT();
	}
	TXREG=c;
	delay(60);
}



//Write in Decimal
/*
void putchdec(unsigned char c)
{
	unsigned char temp;

	temp=c;
	//hundreds
	if ((c/100)>0) putch((c/100)+'0');
	c-=(c/100)*100;

	//tens
	if (((temp/10)>0) || ((temp/100)>0)) putch((c/10)+'0');
	c-=(c/10)*10;

	//ones
	putch((c/1)+'0');
}
*/
/*
void putchhex(unsigned char c)
{
	unsigned char temp;

	// transmits in hex

	temp=c;

	c=(c >> 4);
	if (c<10) c+=48; else c+=55;
	putch(c);

	c=temp;

	c=(c & 0x0F);
	if (c<10) c+=48; else c+=55;
	putch(c);
}
*/
/*
void putst(register const char *str)
{
	while((*str)!=0)
	{
		putch(*str);
    if (*str==13) putch(10);
    if (*str==10) putch(13);
		str++;
	}
}
*/

