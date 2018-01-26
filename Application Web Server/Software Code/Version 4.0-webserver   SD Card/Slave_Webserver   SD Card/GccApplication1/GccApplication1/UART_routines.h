/*----------------------------------------------------------------------------
 Copyright:      Radig Ulrich  mailto: mail@ulrichradig.de
 Author:         Radig Ulrich
 Remarks:        
 known Problems: none
 Version:        24.10.2007
 Description:    RS232 Routinen
------------------------------------------------------------------------------*/
//Die Quarzfrequenz auf dem Board
#ifndef F_CPU
		#define F_CPU 16000000UL
#endif //SYSCLK	

#ifndef _UART_ROUTINES_H_
#define _UART_ROUTINES_H_

#define CHAR 0
#define INT  1
#define LONG 2

	//----------------------------------------------------------------------------
	#include <stdlib.h>
	#include <stdarg.h>
	#include <ctype.h>
	#include <string.h>
	#include <avr/io.h>
	#include <avr/pgmspace.h>
	
	//----------------------------------------------------------------------------
	
	#define TX_NEWLINE usart_write_str("\r\n");
	
	#if defined (__AVR_ATmega32__)
		#define USR UCSRA
		#define UCR UCSRB
		#define UBRR UBRRL
		#define EICR EICRB
		#define USART_RX USART_RXC_vect  
	#endif
	
	//----------------------------------------------------------------------------
	
	void usart_init(unsigned long baudrate); 
	void usart_write_char(char c);
	void usart_write_str(char *str);
	
	void usart_write_P (const char *Buffer,...);
	#define usart_write(format, args...)   usart_write_P(PSTR(format) , ## args)
	
	void USART_Flush( void );
	unsigned char USART_Receive( void );
	
	//----------------------------------------------------------------------------
	//----------------------------Dharmani-functions------------------------------
	//----------------------------------------------------------------------------
	unsigned char receiveByte(void);
	void transmitByte(unsigned char);
	void transmitString_F(char*);
	void transmitString(unsigned char*);
	void transmitHex( unsigned char dataType, unsigned long data );
	//----------------------------------------------------------------------------
	//----------------------------------------------------------------------------
	//----------------------------------------------------------------------------

#endif //_UART_H
