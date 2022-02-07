################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/FWlib0/src/stm32f10x_adc.c \
../Drivers/FWlib0/src/stm32f10x_bkp.c \
../Drivers/FWlib0/src/stm32f10x_can.c \
../Drivers/FWlib0/src/stm32f10x_cec.c \
../Drivers/FWlib0/src/stm32f10x_crc.c \
../Drivers/FWlib0/src/stm32f10x_dac.c \
../Drivers/FWlib0/src/stm32f10x_dbgmcu.c \
../Drivers/FWlib0/src/stm32f10x_dma.c \
../Drivers/FWlib0/src/stm32f10x_exti.c \
../Drivers/FWlib0/src/stm32f10x_flash.c \
../Drivers/FWlib0/src/stm32f10x_fsmc.c \
../Drivers/FWlib0/src/stm32f10x_gpio.c \
../Drivers/FWlib0/src/stm32f10x_i2c.c \
../Drivers/FWlib0/src/stm32f10x_iwdg.c \
../Drivers/FWlib0/src/stm32f10x_nvic.c \
../Drivers/FWlib0/src/stm32f10x_pwr.c \
../Drivers/FWlib0/src/stm32f10x_rcc.c \
../Drivers/FWlib0/src/stm32f10x_rtc.c \
../Drivers/FWlib0/src/stm32f10x_sdio.c \
../Drivers/FWlib0/src/stm32f10x_spi.c \
../Drivers/FWlib0/src/stm32f10x_tim.c \
../Drivers/FWlib0/src/stm32f10x_usart.c \
../Drivers/FWlib0/src/stm32f10x_wwdg.c 

OBJS += \
./Drivers/FWlib0/src/stm32f10x_adc.o \
./Drivers/FWlib0/src/stm32f10x_bkp.o \
./Drivers/FWlib0/src/stm32f10x_can.o \
./Drivers/FWlib0/src/stm32f10x_cec.o \
./Drivers/FWlib0/src/stm32f10x_crc.o \
./Drivers/FWlib0/src/stm32f10x_dac.o \
./Drivers/FWlib0/src/stm32f10x_dbgmcu.o \
./Drivers/FWlib0/src/stm32f10x_dma.o \
./Drivers/FWlib0/src/stm32f10x_exti.o \
./Drivers/FWlib0/src/stm32f10x_flash.o \
./Drivers/FWlib0/src/stm32f10x_fsmc.o \
./Drivers/FWlib0/src/stm32f10x_gpio.o \
./Drivers/FWlib0/src/stm32f10x_i2c.o \
./Drivers/FWlib0/src/stm32f10x_iwdg.o \
./Drivers/FWlib0/src/stm32f10x_nvic.o \
./Drivers/FWlib0/src/stm32f10x_pwr.o \
./Drivers/FWlib0/src/stm32f10x_rcc.o \
./Drivers/FWlib0/src/stm32f10x_rtc.o \
./Drivers/FWlib0/src/stm32f10x_sdio.o \
./Drivers/FWlib0/src/stm32f10x_spi.o \
./Drivers/FWlib0/src/stm32f10x_tim.o \
./Drivers/FWlib0/src/stm32f10x_usart.o \
./Drivers/FWlib0/src/stm32f10x_wwdg.o 

C_DEPS += \
./Drivers/FWlib0/src/stm32f10x_adc.d \
./Drivers/FWlib0/src/stm32f10x_bkp.d \
./Drivers/FWlib0/src/stm32f10x_can.d \
./Drivers/FWlib0/src/stm32f10x_cec.d \
./Drivers/FWlib0/src/stm32f10x_crc.d \
./Drivers/FWlib0/src/stm32f10x_dac.d \
./Drivers/FWlib0/src/stm32f10x_dbgmcu.d \
./Drivers/FWlib0/src/stm32f10x_dma.d \
./Drivers/FWlib0/src/stm32f10x_exti.d \
./Drivers/FWlib0/src/stm32f10x_flash.d \
./Drivers/FWlib0/src/stm32f10x_fsmc.d \
./Drivers/FWlib0/src/stm32f10x_gpio.d \
./Drivers/FWlib0/src/stm32f10x_i2c.d \
./Drivers/FWlib0/src/stm32f10x_iwdg.d \
./Drivers/FWlib0/src/stm32f10x_nvic.d \
./Drivers/FWlib0/src/stm32f10x_pwr.d \
./Drivers/FWlib0/src/stm32f10x_rcc.d \
./Drivers/FWlib0/src/stm32f10x_rtc.d \
./Drivers/FWlib0/src/stm32f10x_sdio.d \
./Drivers/FWlib0/src/stm32f10x_spi.d \
./Drivers/FWlib0/src/stm32f10x_tim.d \
./Drivers/FWlib0/src/stm32f10x_usart.d \
./Drivers/FWlib0/src/stm32f10x_wwdg.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/FWlib0/src/%.o: ../Drivers/FWlib0/src/%.c Drivers/FWlib0/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DSTM32F103xB -c -I../Core/Inc -I"/Users/jesse.org/Documents/node/earwiggler/dev/ew202201051617/20220203WA_STM32F103C8/Drivers/FWlib0/inc" -I"/Users/jesse.org/Documents/node/earwiggler/dev/ew202201051617/20220203WA_STM32F103C8/Drivers/FWlib0/src" -I"/Users/jesse.org/Documents/node/earwiggler/dev/ew202201051617/20220203WA_STM32F103C8/Drivers/CMSIS/Include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Drivers-2f-FWlib0-2f-src

clean-Drivers-2f-FWlib0-2f-src:
	-$(RM) ./Drivers/FWlib0/src/stm32f10x_adc.d ./Drivers/FWlib0/src/stm32f10x_adc.o ./Drivers/FWlib0/src/stm32f10x_bkp.d ./Drivers/FWlib0/src/stm32f10x_bkp.o ./Drivers/FWlib0/src/stm32f10x_can.d ./Drivers/FWlib0/src/stm32f10x_can.o ./Drivers/FWlib0/src/stm32f10x_cec.d ./Drivers/FWlib0/src/stm32f10x_cec.o ./Drivers/FWlib0/src/stm32f10x_crc.d ./Drivers/FWlib0/src/stm32f10x_crc.o ./Drivers/FWlib0/src/stm32f10x_dac.d ./Drivers/FWlib0/src/stm32f10x_dac.o ./Drivers/FWlib0/src/stm32f10x_dbgmcu.d ./Drivers/FWlib0/src/stm32f10x_dbgmcu.o ./Drivers/FWlib0/src/stm32f10x_dma.d ./Drivers/FWlib0/src/stm32f10x_dma.o ./Drivers/FWlib0/src/stm32f10x_exti.d ./Drivers/FWlib0/src/stm32f10x_exti.o ./Drivers/FWlib0/src/stm32f10x_flash.d ./Drivers/FWlib0/src/stm32f10x_flash.o ./Drivers/FWlib0/src/stm32f10x_fsmc.d ./Drivers/FWlib0/src/stm32f10x_fsmc.o ./Drivers/FWlib0/src/stm32f10x_gpio.d ./Drivers/FWlib0/src/stm32f10x_gpio.o ./Drivers/FWlib0/src/stm32f10x_i2c.d ./Drivers/FWlib0/src/stm32f10x_i2c.o ./Drivers/FWlib0/src/stm32f10x_iwdg.d ./Drivers/FWlib0/src/stm32f10x_iwdg.o ./Drivers/FWlib0/src/stm32f10x_nvic.d ./Drivers/FWlib0/src/stm32f10x_nvic.o ./Drivers/FWlib0/src/stm32f10x_pwr.d ./Drivers/FWlib0/src/stm32f10x_pwr.o ./Drivers/FWlib0/src/stm32f10x_rcc.d ./Drivers/FWlib0/src/stm32f10x_rcc.o ./Drivers/FWlib0/src/stm32f10x_rtc.d ./Drivers/FWlib0/src/stm32f10x_rtc.o ./Drivers/FWlib0/src/stm32f10x_sdio.d ./Drivers/FWlib0/src/stm32f10x_sdio.o ./Drivers/FWlib0/src/stm32f10x_spi.d ./Drivers/FWlib0/src/stm32f10x_spi.o ./Drivers/FWlib0/src/stm32f10x_tim.d ./Drivers/FWlib0/src/stm32f10x_tim.o ./Drivers/FWlib0/src/stm32f10x_usart.d ./Drivers/FWlib0/src/stm32f10x_usart.o ./Drivers/FWlib0/src/stm32f10x_wwdg.d ./Drivers/FWlib0/src/stm32f10x_wwdg.o

.PHONY: clean-Drivers-2f-FWlib0-2f-src

