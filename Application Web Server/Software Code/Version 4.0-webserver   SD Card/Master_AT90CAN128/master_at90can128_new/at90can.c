/*******************************************************************
* CAN Test-APP
* - CAN functions definded for AT90CAN
*
* Compiler : avr-gcc 4.3.0 / avr-libc 1.6.2 / AVR Studio 4.14
* size     : 6,18KB
* by       : Thomas Fuchs, Wolfsburg, Germany
*            linux@cc-robotics.de
*
* License  : Copyright (c) 2009 Thomas Fuchs
*
* Tested with AT90CAN128
*******************************************************************/
#include <stdbool.h>
#include <avr/pgmspace.h>
#include "utils.h"
#include "at90can.h"
#include "i2c.h"
#include "avr_compat.h"

uint32_t idbuf;
uint8_t count18FF0360 = 0;

/* to enhance the readability:
 * - MOb = Message Object
 */

// returns the mob which has the message
// suchen des MOb in dem die Nachricht ist
uint8_t getmob( uint32_t bitmask) 
{
  uint8_t mob;

  if( bitmask==0) return NOMOB;

  for( mob=0; (bitmask & 0x01)==0; bitmask >>= 1, ++mob);

  //  security check
  if ( mob > 14 ) return NOMOB;
    else return mob;
}

// initializes CAN interface
// Funktion zum Initialisieren
bool initCAN( uint8_t bitrate )
{
  CAN_DDR |= _BV(CAN_TX);
  CAN_DDR &= ~_BV(CAN_RX);

  //  security check
  if (bitrate >= 8) return false;
  
  //  number of the MOb
  uint8_t mob;

  CANGCON |= (1<<SWRES);		// reset the CAN controller
  
  CANGCON = 0x00;				// reset the general control register (CONFIG mode)

  // reset the interrupt registers
  CANSIT2 = 0x00;
  CANSIT1 = 0x00;
  CANGIT  = 0x00;
  CANGIE  = 0x00;
  CANEN1  = 0x00;
  CANEN2  = 0x00;
  CANIE1  = 0x00;
  CANIE2  = 0x00;

  // set auto inc to Data Buffer Index (DBI)
  CANPAGE &= ~(1<<AINC);

  // set all MObs to 0
  for (mob = 0; mob < NR_MOBS; mob++)
  {
    CANPAGE  = (mob << 4);
	CANIDT1 = 0x00;  //  reset ID-Tag
	CANIDT2 = 0x00;
	CANIDT3 = 0x00;
	CANIDT4 = 0x00;

	CANIDM1 = 0x00;  //  reset ID-Mask
	CANIDM2 = 0x00;
	CANIDM3 = 0x00;
	CANIDM4 = 0x00;

    CANSTMOB = 0x00;  //  reset MOb status
    CANCDMOB = 0x00;  //  disable MOb
  }

  // set CAN Bit Timing,(see datasheet page 260)
  CANBT1 = pgm_read_byte(&_at90can_cnf[bitrate][0]);
  CANBT2 = pgm_read_byte(&_at90can_cnf[bitrate][1]);
  CANBT3 = pgm_read_byte(&_at90can_cnf[bitrate][2]);
	
  // set config to MObs 1 and 2
  // MOb 1 soll empfangen
  // MOb 2 soll senden
  for (mob = 1; mob < 3; mob++)
  {
    CANPAGE  = (mob << 4);
	CANSTMOB = 0x00;  //  reset MOb status
	switch (mob)
	{
      case 1:
	    CANCDMOB = 0x80;  //  RX
	  	CANIDT1  = 0x00;  //  set ID-Tag
	    CANIDT2  = 0x00;
		CANIDT3  = 0x00;
		CANIDT4  = 0x00;

	    CANIDM1  = 0x00;  //  set ID-Mask, receive all
	    CANIDM2  = 0x00;
		CANIDM3  = 0x00;
		CANIDM4  = 0x00;
        break;

	  case 2:
	  	CANIDT1  = 0x00;  //  set ID-Tag
	    CANIDT2  = 0x00;
		CANIDT3  = 0x00;
		CANIDT4  = 0x00;
        break;

	  default:
	    return false;
	}
  }

  //  Enable all required interrupts
  CANGIE  = 0xB0;  // ENIT, ENRX, ENTX
  CANIE2  = 0x06;  // MOb 1, MOb 2 aktivieren
    
  //  switch CAN on   
  CANGCON |= (1<<ENASTB);
  	
  //  wait for EnableFlag
  while (!(CANGSTA & (1<<ENFG))); 
  
  return true;
}

// sends CANmsg
void can_tx (CAN_messageType msg)
{
  uint8_t i, mob;

  //  MOb Sender is Nr 2
  mob = 2;

  //  enable MOb number mob
  CANPAGE = (mob<<4);

//  set ID ------------------
  //  set IDE bit, max length = 8
  if (isExtendet) //extendet
  {
	CANCDMOB = (1<<IDE)|(msg.length);		//ide = 1: extendet, ide = 0: normal
	  
	CANIDM4 = (unsigned char) ((msg.id<<3)&0xF8);
	CANIDM3 = (unsigned char) (msg.id>>5);
	CANIDM2 = (unsigned char) (msg.id>>13);
	CANIDM1 = (unsigned char) (msg.id>>21);
  }
  else //normal	ID 11 Bit
  {
	CANCDMOB = (0<<IDE) | (msg.length);		//ide = 0: normal
	
	CANIDT2 = (unsigned char) ((msg.id<<5)&0xE0);
	CANIDT1 = (unsigned char) (msg.id>>3);
  }
//  set ID -----------------
  
  //  write data to MOb
  for (i=0; i<8; i++)							
  CANMSG = msg.data[i];
	
  //  wait for txbsy
  while (CANGSTA & (1<<TXBSY));
	
  //  send message
  CANCDMOB |= (1<<CONMOB0);
}

// define the IDTags to get only one ID (Filter)
// define the IDMasks to activate the Tags (Maske)
// 1 means filter, 0 means uncared
void CANIDsetTM ()
{
	uint32_t recMsgID  = 0x18FF0060;
	uint32_t recIDMask = 0x1FFFF0FF; //0x1FFFFFFF;
	//////////////////
	CANIDT4 = (unsigned char) ((recMsgID<<3)&0xFD); //&0xF8
	CANIDT3 = (unsigned char) (recMsgID>>5);
	CANIDT2 = (unsigned char) (recMsgID>>13);
	CANIDT1 = (unsigned char) (recMsgID>>21);
	//////////////////
	CANIDM4 = (unsigned char) ((recIDMask<<3)|0xFF); //|0xFD //filter on, compare to IDTags
	CANIDM3 = (unsigned char) (recIDMask>>5);
	CANIDM2 = (unsigned char) (recIDMask>>13);
	CANIDM1 = (unsigned char) (recIDMask>>21);
	/////////////////
	/*CANIDT4 = 0;		//all id's, don't care
	CANIDT3 = 0;	
	CANIDT2 = 0;
	CANIDT1 = 0;
	//////////////////
	CANIDM1  = 0x00;	//filter off, don't care
	CANIDM2  = 0x00;
	CANIDM3  = 0x00;
	CANIDM4  = 0x00;
	/////////////////*/
}

uint32_t CAN_getID()
{
	uint32_t	id;

	id = 0;
	id |= ((uint32_t) CANIDT1<<24);
	id |= ((uint32_t) CANIDT2<<16);
	id |= ((uint32_t) CANIDT3<<8);
	id |= (CANIDT4&0xF8);
	id >>= 3;

	return id;
}

// config the receive mob
void configRX()
{	
  uint8_t mob;

  // receive in this MOb
  mob = 1;

  CANPAGE = (mob<<4);  // rotate 4 bits left	

  CANIDsetTM (); //Filters (Tags), Masks
  
  //  activate receiving messages
  CANCDMOB = (1<<CONMOB1)|(1<<IDE);	// --- with 29 bit id´s
  //CANCDMOB = (1<<CONMOB1);		   --- with 11 bit id´s
}


// interrupt service for CAN
SIGNAL(SIG_CAN_INTERRUPT1)
{
  // CAN_messageType recMsg; this is a global variable
  uint8_t save_canpage = CANPAGE;		//  actual CANPAGE
  uint8_t mob;
  uint8_t i;
  uint8_t readmodwrite;

  // check in which MOb the INT was initiated
  mob = getmob(CANSIT2 | (CANSIT1 << 8));
	if( mob == NOMOB )   return;
	
  // select concerned MOb page
  CANPAGE = (mob << 4);	

  // send was successfully
  if (CANSTMOB & (1<<TXOK))
  {
    readmodwrite = CANSTMOB;	 	
    readmodwrite &= ~(1<<TXOK);	//  reset INT reason
	CANSTMOB = readmodwrite;			
  }
  // message was successfully receipt
  else if (CANSTMOB & (1<<RXOK))
  {
	recMsg.id = CAN_getID(); // get id of selected MOb
	
    recMsg.length = (CANCDMOB&0x0F); // get length of selected MOb

    // clear memory
	for (i=0; i<8; i++)	
	{	
	  recMsg.data[i] = 0;
	}

    // get data of selected MOb
	for (i=0; i<recMsg.length; i++)	
	{	
	  recMsg.data[i] = CANMSG;
	}
	
	///////////////////////////
	//save data from CAN-messages to CAN_messageType structures recMsg18FF0060 - recMsg18FF0360
	if (recMsg.id == 0x18FF0060)
	{
		recMsg18FF0060.id = recMsg.id;
		recMsg18FF0060.length = recMsg.length;
		
		// clear memory
		for (i=0; i<8; i++)	
		{	
		  recMsg18FF0060.data[i] = 0;
		}

		// get data of selected MOb
		for (i=0; i<recMsg.length; i++)	
		{	
			recMsg18FF0060.data[i] = recMsg.data[i];
		}
	}

	if (recMsg.id == 0x18FF0160)
	{
		recMsg18FF0160.id = recMsg.id;
		recMsg18FF0160.length = recMsg.length;
		
		// clear memory
		for (i=0; i<8; i++)	
		{	
		  recMsg18FF0160.data[i] = 0;
		}

		// get data of selected MOb
		for (i=0; i<recMsg.length; i++)	
		{	
			recMsg18FF0160.data[i] = recMsg.data[i];
		}
	}
	
	if (recMsg.id == 0x18FF0260)
	{
		recMsg18FF0260.id = recMsg.id;
		recMsg18FF0260.length = recMsg.length;
		
		// clear memory
		for (i=0; i<8; i++)	
		{	
		  recMsg18FF0260.data[i] = 0;
		}

		// get data of selected MOb
		for (i=0; i<recMsg.length; i++)	
		{	
			recMsg18FF0260.data[i] = recMsg.data[i];
		}
	}	
	if (recMsg.id == 0x18FF0360) 
	// when last message comes, we are sending data from all 4 CAN-messages with 1 I2C packet to another uC
	{
		count18FF0360++; //counter for limitation of I2C messages for sent
		if (count18FF0360 > 4) //we are sending each 5th CAN-messages from fuel cell  
		{
			CLEARBIT(PORTF,1); // LED ON
			unsigned char reve18FF0060[70] = {0};
			unsigned char reve18FF0160[70] = {0};
			unsigned char reve18FF0260[70] = {0};
			unsigned char reve18FF0360[70] = {0};
			unsigned char reve18FF[200] = {0};
			unsigned char reve1[20] = {0};
			//sprintf(reve,"%lX %X",recMsg.id,recMsg.length);
		
			sprintf(reve18FF0060,"%d",recMsg18FF0060.data[0]); //creating a message, that should be send with I2C
			for (i=1; i<recMsg18FF0060.length; i++)	
			{
				sprintf(reve1,"%d",recMsg18FF0060.data[i]);
				sprintf(reve18FF0060,"%s %s",reve18FF0060,reve1);
			}
		
			sprintf(reve18FF0160,"%d",recMsg18FF0160.data[0]);
			for (i=1; i<recMsg18FF0160.length; i++)	
			{
				sprintf(reve1,"%d",recMsg18FF0160.data[i]);
				sprintf(reve18FF0160,"%s %s",reve18FF0160,reve1);
			}
		
			sprintf(reve18FF0260,"%d",recMsg18FF0260.data[0]);
			for (i=1; i<recMsg18FF0260.length; i++)	
			{
				sprintf(reve1,"%d",recMsg18FF0260.data[i]);
				sprintf(reve18FF0260,"%s %s",reve18FF0260,reve1);
			}
		
			sprintf(reve18FF0360,"%d",recMsg.data[0]);
			for (i=1; i<recMsg.length; i++)	
			{
				sprintf(reve1,"%d",recMsg.data[i]);
				sprintf(reve18FF0360,"%s %s",reve18FF0360,reve1);
			}
			sprintf(reve18FF,"%s %s %s %s",reve18FF0060,reve18FF0160,reve18FF0260,reve18FF0360); //message created
			i2cMasterSend(TARGET_ADDR,strlen(reve18FF)+1,&reve18FF);/*send of I2C message, takes some time*/
			_delay_ms(1); //delay for visibility of LED blinking
			SETBIT(PORTF,1); // LED oFF
			count18FF0360 = 0; //counter =0
		}
	}

    // hier kann etwas getan werden oder auch nicht
	// z.B. zum Test eine LED anschalten
	// ansonsten benutzt man die Nachricht aus recMsg dauerhaft in der main
	// und lässt sie durch den INT automatisch aktualisieren

    readmodwrite = CANSTMOB;
    readmodwrite &= ~(1<<RXOK);  //  reset interrupt 	
    CANSTMOB = readmodwrite;
	CANCDMOB = (1<<CONMOB1)|(1<<IDE);  //  stay tuned!
	
	CANIDsetTM (); //Filters (Tags), Masks
  }

  CANPAGE = save_canpage;  //  restore CANPAGEs
}
