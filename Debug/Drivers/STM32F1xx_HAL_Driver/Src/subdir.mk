################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_exti.c \
../Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_gpio.c \
../Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_pwr.c \
../Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_rcc.c \
../Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_utils.c 

OBJS += \
./Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_exti.o \
./Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_gpio.o \
./Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_pwr.o \
./Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_rcc.o \
./Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_utils.o 

C_DEPS += \
./Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_exti.d \
./Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_gpio.d \
./Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_pwr.d \
./Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_rcc.d \
./Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_utils.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/STM32F1xx_HAL_Driver/Src/%.o: ../Drivers/STM32F1xx_HAL_Driver/Src/%.c Drivers/STM32F1xx_HAL_Driver/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DSTM32F103xB -c -I../Core/Inc -I"/Users/jesse.org/Documents/node/earwiggler/dev/ew202201051617/20220203WA_STM32F103C8/Drivers/FWlib0/inc" -I"/Users/jesse.org/Documents/node/earwiggler/dev/ew202201051617/20220203WA_STM32F103C8/Drivers/FWlib0/src" -I"/Users/jesse.org/Documents/node/earwiggler/dev/ew202201051617/20220203WA_STM32F103C8/Drivers/CMSIS" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Drivers-2f-STM32F1xx_HAL_Driver-2f-Src

clean-Drivers-2f-STM32F1xx_HAL_Driver-2f-Src:
	-$(RM) ./Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_exti.d ./Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_exti.o ./Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_gpio.d ./Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_gpio.o ./Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_pwr.d ./Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_pwr.o ./Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_rcc.d ./Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_rcc.o ./Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_utils.d ./Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_utils.o

.PHONY: clean-Drivers-2f-STM32F1xx_HAL_Driver-2f-Src

