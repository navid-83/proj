/*
 Developed by: Navid
 Application Web Server for Fuel Cell Diagnostic Device
*/

#define F_CPU 16000000UL //Quartz clock frequency 16 MHz
#include <string.h> //Libs
#include <avr/io.h>
#include <util/delay.h>
#include <avr/pgmspace.h>
#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <avr/interrupt.h>
#include "avr_compat.h" //header file for diverse uC reductions/simplifications
#include "i2c.h" //header file for i2c interface
#include "utils.h" //header file for some simplifications

unsigned char mBuf[10];
unsigned char rev[10];
int counter1 = 0;

/***************************************************************************/
// CAN
//-----
//  bitrates
#define	_10KBPS		0	// untested
#define	_20KBPS		1	// untested
#define	_50KBPS		2	// untested
#define	_100KBPS    3	
#define	_125KBPS    4	
#define	_250KBPS    5	
#define	_500KBPS    6
#define	_1MBPS		7	// untested

//  global structs and variables
//  Struktur der CAN-Botschaft

typedef struct
{	
	uint32_t id;			//  MSG ID 29 Bit                  
	uint32_t msk;        	//  Mask for ID 29 Bit          
	uint8_t length;   		//  DLC length
	uint8_t data[8];  		//  Data field 8 Byte
}CAN_messageType;           //  CAN 2.0 A message 29 Bit

CAN_messageType msg;
extern CAN_messageType recMsg;
extern isExtendet;

////////////////////////creating of CAN messages
extern CAN_messageType recMsg18FF0060;
extern CAN_messageType recMsg18FF0160;
extern CAN_messageType recMsg18FF0260;
extern CAN_messageType recMsg18FF0360;
////////////////////////

//  external functions
extern bool initCAN(uint8_t bitrate);
extern void can_tx(CAN_messageType msg);
extern void configRX();
int counter=0;
/***************************************************************************/

//delay routine (milliseconds)
//Funktion um x Millisekunden zu warten
void delay_ms(uint16_t period)	 
{
	for(unsigned int i=0; i<=period; i++)
		_delay_ms(1);
}

// initializes all recommended interfaces
// Initialisierung
static bool initialize()
{
	// Init CAN interface
	// Init-Funktion für CAN aufrufen mit 250KBPS
	// mit Sicherheitsabfrage ob erfolgreich
	if(initCAN(_250KBPS));
		else return false;

	// config receipt
	configRX();

	// alle globalen Interrupts nach der Initialisierung einschalten
	sei();	//activate global interrups

	return true;
}


// This function works when interrupt has occurred
// The Global Interrupt Enable bit must be set for the interrupts to be enabled
ISR (TIMER0_OVF_vect)
{
	counter++;
	if (counter >= 60) //each second send a massage with data, for testing of sending messages
	{
		isExtendet = 1;
		
		msg.length = 8;
		for (int i=4; i<8; i++)	{ msg.data[i] = 0; }
		msg.id = 0xfffff;
		if (CHECKBIT(PORTF,0)) msg.data[0] = 0xff; else msg.data[0] = 0x00;
		if (CHECKBIT(PORTF,1)) msg.data[1] = 0xff; else msg.data[1] = 0x00;
		if (CHECKBIT(PORTF,2)) msg.data[2] = 0xff; else msg.data[2] = 0x00;
		if (CHECKBIT(PORTF,3)) msg.data[3] = 0xff; else msg.data[3] = 0x00;

		// send of message, that was created
		can_tx(msg);
		
		counter = 0;
	}	
}

int main(void)
{
	_delay_ms(100); //some delay for VCC stabilize
	
	//settings for LED pins initialize
	SETBIT(DDRF,0);SETBIT(DDRF,1);SETBIT(DDRF,2);SETBIT(DDRF,3);
	CLEARBIT(PORTF,0);CLEARBIT(PORTF,1);CLEARBIT(PORTF,2);CLEARBIT(PORTF,3);
	
	//Timer 0
	//we don't need to send messages from uC Board during usual time
	//to test sending messages, uncomment this timer settings
	/*
	TCCR0A |= _BV(CS02) | _BV(CS00); //clk/1024 (prescaler)
	TIMSK0 |= _BV(TOIE0); // Timer/Counter0 Overflow Interrupt Enable
	sei (); //activate global interrups
	*/
	
	//  initialize
	while(!(initialize()));

	// initialize i2c function library 
  	i2cInit(); 
  	// set local device address and allow response to general call 
	i2cSetLocalDeviceAddr(LOCAL_ADDR, TRUE);
	
	isExtendet = 1;
	
	//  Test message for sent
	/*
	msg.length = 7;
	msg.id = 0xf1;
	msg.data[0] = 0x54;
	msg.data[1] = 0x65;
	msg.data[2] = 0x73;
	msg.data[3] = 0x74;
	msg.data[4] = 0x20;
	msg.data[5] = 0x4F;
	msg.data[6] = 0x4B;
	// can_tx(msg); // Funktion for sendimg of message
	*/
	
    while(1)
    {
        // wait for CAN-messages per Interrupt...
		// wait for Timer0 overflow per Interrupt...
    }
}