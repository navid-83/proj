//**************************************************************
// ****** FUNCTIONS FOR SPI COMMUNICATION *******
//**************************************************************
//Controller		: ATmega32 (Clock: 8 Mhz-internal)
//Compiler			: AVR-GCC (winAVR with AVRStudio-4)
//Project Version	: DL_1.0
//Author			: CC Dharmani, Chennai (India)
//			  		  www.dharmanitech.com
//Date				: 10 May 2011
//**************************************************************

#ifndef _SPI_ROUTINES_H_
#define _SPI_ROUTINES_H_

//#define SPI_SD             SPCR = 0x52
//#define SPI_HIGH_SPEED     SPCR = 0x50; SPSR |= (1<<SPI2X)

#define SETBIT(ADDRESS,BIT) (ADDRESS |= (1<<BIT)) 
#define CLEARBIT(ADDRESS,BIT) (ADDRESS &= ~(1<<BIT)) 
#define CHECKBIT(ADDRESS,BIT) (ADDRESS & (1<<BIT))

#define MMC_Write			PORTB	//Port an der die MMC/SD-Karte angeschlossen ist also des SPI 
#define MMC_Read			PINB
#define MMC_Direction_REG	DDRB	

#define SPI_DI				1		//Port Pin an dem Data Output der MMC/SD-Karte angeschlossen ist 
#define SPI_DO				3		//Port Pin an dem Data Input der MMC/SD-Karte angeschlossen ist
#define SPI_Clock			2		//Port Pin an dem die Clock der MMC/SD-Karte angeschlossen ist (clk)
#define MMC_Chip_Select		0		//Port Pin an dem Chip Select der MMC/SD-Karte angeschlossen ist
//#define SPI_SS				4		//Nicht Benutz muß aber definiert werden

void spi_init(void);
void swspi_init(void);
unsigned char SPI_transmit(unsigned char);
unsigned char SPI_receive(void);

#endif
