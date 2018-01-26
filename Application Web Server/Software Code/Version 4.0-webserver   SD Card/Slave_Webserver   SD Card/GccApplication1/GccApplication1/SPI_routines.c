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

#include <avr/io.h>
#include "SPI_routines.h"

//SPI initialize for SD card
//clock rate: 125Khz
void spi_init(void)
{
	//Konfiguration des Ports an der die MMC/SD-Karte angeschlossen wurde
	MMC_Direction_REG &= ~(1<<SPI_DI);			//Setzen von Pin MMC_DI auf Input
	MMC_Direction_REG |= (1<<SPI_Clock);		//Setzen von Pin MMC_Clock auf Output
	MMC_Direction_REG |= (1<<SPI_DO);			//Setzen von Pin MMC_DO auf Output
	MMC_Direction_REG |= (1<<MMC_Chip_Select);	//Setzen von Pin MMC_Chip_Select auf Output
	//MMC_Direction_REG |= (1<<SPI_SS);	
	MMC_Write |= (1<<MMC_Chip_Select);			//Setzt den Pin MMC_Chip_Select auf High Pegel

	//Aktiviren des SPI - Bus, Clock = Idel LOW
	//SPI Clock teilen durch 128
	SPCR |= (1<<SPE)|(1<<MSTR)|(1<<SPR0)|(1<<SPR1); //Enable SPI, SPI in Master Mode	
	SPSR &= ~(1<<SPI2X);
	
	/*SPCR = 0x52; //setup SPI: Master mode, MSB first, SCK phase low, SCK idle low
	SPSR = 0x00;*/
}

void swspi_init(void)
{
	MMC_Write |= (1<<MMC_Chip_Select)|(1<<SPI_DO)|(1<<SPI_DI); 			//Init ports
	MMC_Direction_REG |= (1<<MMC_Chip_Select)|(1<<SPI_DI)|(1<<SPI_Clock);
}	

unsigned char SPI_transmit(unsigned char data)
{
	unsigned char i;

	for (i=0;i<8;i++)
	{
		if ((data&0x80)==0x00) MMC_Write &= ~(1<<SPI_DI);	//Set data bit
		else MMC_Write |= (1<<SPI_DI);
		data=data<<1; 
		MMC_Write |= (1<<SPI_Clock);						//Strobe
		asm("nop"); 
		MMC_Write &= ~(1<<SPI_Clock);
	}
	return(0);
}

unsigned char SPI_receive(void)
{
	unsigned char i, res=0;

	for (i=0;i<8;i++)
	{
		MMC_Write |= (1<<SPI_Clock);					//Start strobe
		res=res<<1;
		if ((MMC_Read&_BV(SPI_DO))!=0x00) res=res|0x01;	//Get data bit
		MMC_Write &= ~(1<<SPI_Clock);					//End strobe
		asm("nop");
	}
	return res;
}

//******** END ****** www.dharmanitech.com *****
