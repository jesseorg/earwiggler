################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/delay.c \
../Core/Src/main.c \
../Core/Src/necsend.c \
../Core/Src/syscalls.c \
../Core/Src/sysmem.c 

OBJS += \
./Core/Src/delay.o \
./Core/Src/main.o \
./Core/Src/necsend.o \
./Core/Src/syscalls.o \
./Core/Src/sysmem.o 

C_DEPS += \
./Core/Src/delay.d \
./Core/Src/main.d \
./Core/Src/necsend.d \
./Core/Src/syscalls.d \
./Core/Src/sysmem.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/%.o: ../Core/Src/%.c Core/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DSTM32F103xB -c -I../Core/Inc -I"/Users/jesse.org/Documents/node/earwiggler/dev/ew202201051617/20220203WA_STM32F103C8/Drivers/FWlib0/inc" -I"/Users/jesse.org/Documents/node/earwiggler/dev/ew202201051617/20220203WA_STM32F103C8/Drivers/FWlib0/src" -I"/Users/jesse.org/Documents/node/earwiggler/dev/ew202201051617/20220203WA_STM32F103C8/Drivers/CMSIS/Include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Core-2f-Src

clean-Core-2f-Src:
	-$(RM) ./Core/Src/delay.d ./Core/Src/delay.o ./Core/Src/main.d ./Core/Src/main.o ./Core/Src/necsend.d ./Core/Src/necsend.o ./Core/Src/syscalls.d ./Core/Src/syscalls.o ./Core/Src/sysmem.d ./Core/Src/sysmem.o

.PHONY: clean-Core-2f-Src

