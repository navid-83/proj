/*****************************************************************************
*
* CAN Test APP
* - header file of at90can.c
*
* Compiler : avr-gcc 4.3.0 / avr-libc 1.6.2 / AVR Studio 4.14
* size     : 2,02KB
* by       : Thomas Fuchs, Wolfsburg, Germany
*            linux@cc-robotics.de
*
* License  : Copyright (c) 2009 Thomas Fuchs
*
* Tested with AT90CAN128
****************************************************************************/
//  CPU speed
#define F_CPU 16000000UL

#define CAN_DDR DDRD
#define CAN_RX 6
#define CAN_TX 5

//  message objects
#define NR_MOBS 15		// number of message objects
#define NOMOB   0xff
typedef char PROGMEM prog_char;  //ino khodam ezafe kardam vagarna error miomad prog_char

extern unsigned char isExtendet = 0;	// 0 - standard CAN 2.0 A
										// 1 - extended CAN 2.0 B

/**/
//  global structs and variables
typedef struct
	{	
		uint32_t id;			//  MSG ID 29 Bit                  
		uint32_t msk;        	//  Mask for ID 29 Bit      
		uint8_t length;   		//  DLC length
		uint8_t data[8];  		//  Data field 8 Byte
	}CAN_messageType;           //  CAN 2.0 B message 29 Bit

// globale Varaiabe für empfangene CAN-Botschaft
CAN_messageType recMsg;

//////////////////////////////////////
CAN_messageType recMsg18FF0060;
CAN_messageType recMsg18FF0160;
CAN_messageType recMsg18FF0260;
CAN_messageType recMsg18FF0360;
//////////////////////////////////////

//CAN speed-settings for 16MHz
const prog_char _at90can_cnf[8][3] = {
	// 10 kbps
	{	0x7E,
		0x6E,
		0x7F
	},
	// 20 kbps
	{	0x62,
		0x0C,
		0x37
	},
	// 50 kbps
	{	0x26,
		0x0C,
		0x37
	},
	// 100 kbps
	{	0x12,
		0x0C,
		0x37
	},
	// 125 kbps
	{	0x0E,
		0x0C,
		0x37
	},
	// 250 kbps
	{	0x06,
		0x0C,
		0x37
	},
	// 500 kbps
	{	0x02,
		0x0C,
		0x37
	},
	// 1 Mbps
	{	0x00,
		0x0C,
		0x37
	}
};

//  external functions
extern void delay_ms(uint16_t period);	 //delay routine (milliseconds)
