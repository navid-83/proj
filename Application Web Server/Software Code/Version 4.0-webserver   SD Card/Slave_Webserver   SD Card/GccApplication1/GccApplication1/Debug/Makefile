################################################################################
# Automatically-generated file. Do not edit!
################################################################################

SHELL := cmd.exe
RM := rm -rf

USER_OBJS :=

LIBS := 
PROJ := 

O_SRCS := 
C_SRCS := 
S_SRCS := 
S_UPPER_SRCS := 
OBJ_SRCS := 
ASM_SRCS := 
PREPROCESSING_SRCS := 
OBJS := 
OBJS_AS_ARGS := 
C_DEPS := 
C_DEPS_AS_ARGS := 
EXECUTABLES := 
OUTPUT_FILE_PATH :=
OUTPUT_FILE_PATH_AS_ARGS :=
AVR_APP_PATH :=$$$AVR_APP_PATH$$$
QUOTE := "
ADDITIONAL_DEPENDENCIES:=
OUTPUT_FILE_DEP:=
LIB_DEP:=

# Every subdirectory with source files must be described here
SUBDIRS := 


# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS +=  \
../dhcp_client.c \
../dnslkup.c \
../enc28j60.c \
../FAT32.c \
../GccApplication1.c \
../i2c.c \
../ip_arp_udp_tcp.c \
../SD_routines.c \
../sensirion_protocol.c \
../SPI_routines.c \
../therm_ds18b20.c \
../UART_routines.c \
../websrv_help_functions.c


PREPROCESSING_SRCS += 


ASM_SRCS += 


OBJS +=  \
dhcp_client.o \
dnslkup.o \
enc28j60.o \
FAT32.o \
GccApplication1.o \
i2c.o \
ip_arp_udp_tcp.o \
SD_routines.o \
sensirion_protocol.o \
SPI_routines.o \
therm_ds18b20.o \
UART_routines.o \
websrv_help_functions.o

OBJS_AS_ARGS +=  \
dhcp_client.o \
dnslkup.o \
enc28j60.o \
FAT32.o \
GccApplication1.o \
i2c.o \
ip_arp_udp_tcp.o \
SD_routines.o \
sensirion_protocol.o \
SPI_routines.o \
therm_ds18b20.o \
UART_routines.o \
websrv_help_functions.o

C_DEPS +=  \
dhcp_client.d \
dnslkup.d \
enc28j60.d \
FAT32.d \
GccApplication1.d \
i2c.d \
ip_arp_udp_tcp.d \
SD_routines.d \
sensirion_protocol.d \
SPI_routines.d \
therm_ds18b20.d \
UART_routines.d \
websrv_help_functions.d

C_DEPS_AS_ARGS +=  \
dhcp_client.d \
dnslkup.d \
enc28j60.d \
FAT32.d \
GccApplication1.d \
i2c.d \
ip_arp_udp_tcp.d \
SD_routines.d \
sensirion_protocol.d \
SPI_routines.d \
therm_ds18b20.d \
UART_routines.d \
websrv_help_functions.d

OUTPUT_FILE_PATH +=GccApplication1.elf

OUTPUT_FILE_PATH_AS_ARGS +=GccApplication1.elf

ADDITIONAL_DEPENDENCIES:=

OUTPUT_FILE_DEP:= ./makedep.mk

LIB_DEP+= 

# AVR32/GNU C Compiler



























./%.o: .././%.c
	@echo Building file: $<
	@echo Invoking: AVR/GNU C Compiler : 3.4.2
	$(QUOTE)C:\Program Files\Atmel\Atmel Toolchain\AVR8 GCC\Native\3.4.2.1002\avr8-gnu-toolchain\bin\avr-gcc.exe$(QUOTE)  -funsigned-char -funsigned-bitfields -DDEBUG  -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -g2 -Wall -mmcu=atmega32 -c -std=gnu99 -MD -MP -MF "$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)"   -o "$@" "$<"
	@echo Finished building: $<
	



# AVR32/GNU Preprocessing Assembler



# AVR32/GNU Assembler




ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all: $(OUTPUT_FILE_PATH) $(ADDITIONAL_DEPENDENCIES)

$(OUTPUT_FILE_PATH): $(OBJS) $(USER_OBJS) $(OUTPUT_FILE_DEP) $(LIB_DEP)
	@echo Building target: $@
	@echo Invoking: AVR/GNU Linker : 3.4.2
	$(QUOTE)C:\Program Files\Atmel\Atmel Toolchain\AVR8 GCC\Native\3.4.2.1002\avr8-gnu-toolchain\bin\avr-gcc.exe$(QUOTE) -o$(OUTPUT_FILE_PATH_AS_ARGS) $(OBJS_AS_ARGS) $(USER_OBJS) $(LIBS) -Wl,-Map="GccApplication1.map" -Wl,--start-group -Wl,-lm  -Wl,--end-group -Wl,--gc-sections -mmcu=atmega32 
	@echo Finished building target: $@
	"C:\Program Files\Atmel\Atmel Toolchain\AVR8 GCC\Native\3.4.2.1002\avr8-gnu-toolchain\bin\avr-objcopy.exe" -O ihex -R .eeprom -R .fuse -R .lock -R .signature  "GccApplication1.elf" "GccApplication1.hex"
	"C:\Program Files\Atmel\Atmel Toolchain\AVR8 GCC\Native\3.4.2.1002\avr8-gnu-toolchain\bin\avr-objcopy.exe" -j .eeprom  --set-section-flags=.eeprom=alloc,load --change-section-lma .eeprom=0  --no-change-warnings -O ihex "GccApplication1.elf" "GccApplication1.eep" || exit 0
	"C:\Program Files\Atmel\Atmel Toolchain\AVR8 GCC\Native\3.4.2.1002\avr8-gnu-toolchain\bin\avr-objdump.exe" -h -S "GccApplication1.elf" > "GccApplication1.lss"
	"C:\Program Files\Atmel\Atmel Toolchain\AVR8 GCC\Native\3.4.2.1002\avr8-gnu-toolchain\bin\avr-objcopy.exe" -O srec -R .eeprom -R .fuse -R .lock -R .signature  "GccApplication1.elf" "GccApplication1.srec"
	"C:\Program Files\Atmel\Atmel Toolchain\AVR8 GCC\Native\3.4.2.1002\avr8-gnu-toolchain\bin\avr-size.exe" "GccApplication1.elf"
	
	





# Other Targets
clean:
	-$(RM) $(OBJS_AS_ARGS) $(EXECUTABLES)  
	-$(RM) $(C_DEPS_AS_ARGS)   
	rm -rf "GccApplication1.elf" "GccApplication1.a" "GccApplication1.hex" "GccApplication1.lss" "GccApplication1.eep" "GccApplication1.map" "GccApplication1.srec"
	