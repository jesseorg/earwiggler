################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/CMSIS/Include/system_stm32f10x.c 

OBJS += \
./Drivers/CMSIS/Include/system_stm32f10x.o 

C_DEPS += \
./Drivers/CMSIS/Include/system_stm32f10x.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/CMSIS/Include/%.o: ../Drivers/CMSIS/Include/%.c Drivers/CMSIS/Include/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DSTM32F103xB -c -I../Core/Inc -I"/Users/jesse.org/Documents/node/earwiggler/dev/ew202201051617/20220203WA_STM32F103C8/Drivers/FWlib0/inc" -I"/Users/jesse.org/Documents/node/earwiggler/dev/ew202201051617/20220203WA_STM32F103C8/Drivers/FWlib0/src" -I"/Users/jesse.org/Documents/node/earwiggler/dev/ew202201051617/20220203WA_STM32F103C8/Drivers/CMSIS/Include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Drivers-2f-CMSIS-2f-Include

clean-Drivers-2f-CMSIS-2f-Include:
	-$(RM) ./Drivers/CMSIS/Include/system_stm32f10x.d ./Drivers/CMSIS/Include/system_stm32f10x.o

.PHONY: clean-Drivers-2f-CMSIS-2f-Include

