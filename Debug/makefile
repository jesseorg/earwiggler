################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include Drivers/FWlib0/src/subdir.mk
-include Drivers/CMSIS/Include/subdir.mk
-include Core/Startup/subdir.mk
-include Core/Src/subdir.mk
-include Core/Inc/subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

OPTIONAL_TOOL_DEPS := \
$(wildcard ../makefile.defs) \
$(wildcard ../makefile.init) \
$(wildcard ../makefile.targets) \


BUILD_ARTIFACT_NAME := 20220203WA_STM32F103C8
BUILD_ARTIFACT_EXTENSION := elf
BUILD_ARTIFACT_PREFIX :=
BUILD_ARTIFACT := $(BUILD_ARTIFACT_PREFIX)$(BUILD_ARTIFACT_NAME)$(if $(BUILD_ARTIFACT_EXTENSION),.$(BUILD_ARTIFACT_EXTENSION),)

# Add inputs and outputs from these tool invocations to the build variables 
EXECUTABLES += \
20220203WA_STM32F103C8.elf \

SIZE_OUTPUT += \
default.size.stdout \

OBJDUMP_LIST += \
20220203WA_STM32F103C8.list \

OBJCOPY_BIN += \
20220203WA_STM32F103C8.bin \


# All Target
all: main-build

# Main-build Target
main-build: 20220203WA_STM32F103C8.elf secondary-outputs

# Tool invocations
20220203WA_STM32F103C8.elf: $(OBJS) $(USER_OBJS) /Users/jesse.org/Documents/node/earwiggler/dev/ew202201051617/20220203WA_STM32F103C8/STM32F103C8TX_FLASH.ld makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-gcc -o "20220203WA_STM32F103C8.elf" @"objects.list" $(USER_OBJS) -Wl,--start-group $(LIBS) -Wl,--end-group -mcpu=cortex-m3 -T"/Users/jesse.org/Documents/node/earwiggler/dev/ew202201051617/20220203WA_STM32F103C8/STM32F103C8TX_FLASH.ld" --specs=nosys.specs -Wl,-Map="20220203WA_STM32F103C8.map" -Wl,--gc-sections -static -L/Users/jesse.org/Documents/node/earwiggler/dev/ew202201051617/20220203WA_STM32F103C8/Drivers/FWlib0/inc -L"/Users/jesse.org/Documents/node/earwiggler/dev/ew202201051617/20220203WA_STM32F103C8/Drivers/FWlib0/src" -L"/Users/jesse.org/Documents/node/earwiggler/dev/ew202201051617/20220203WA_STM32F103C8/Drivers/FWlib0/inc" -L"/Users/jesse.org/Documents/node/earwiggler/dev/ew202201051617/20220203WA_STM32F103C8/Drivers/CMSIS" -L"/Users/jesse.org/Documents/node/earwiggler/dev/ew202201051617/20220203WA_STM32F103C8/Drivers/CMSIS/Include" -L/Users/jesse.org/Documents/node/earwiggler/dev/ew202201051617/20220203WA_STM32F103C8/Drivers/CMSIS --specs=nano.specs -mfloat-abi=soft -mthumb -Wl,--start-group -lc -lm -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

default.size.stdout: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-size  $(EXECUTABLES)
	@echo 'Finished building: $@'
	@echo ' '

20220203WA_STM32F103C8.list: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objdump -h -S $(EXECUTABLES) > "20220203WA_STM32F103C8.list"
	@echo 'Finished building: $@'
	@echo ' '

20220203WA_STM32F103C8.bin: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objcopy  -O binary $(EXECUTABLES) "20220203WA_STM32F103C8.bin"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) 20220203WA_STM32F103C8.bin 20220203WA_STM32F103C8.elf 20220203WA_STM32F103C8.list default.size.stdout
	-@echo ' '

secondary-outputs: $(SIZE_OUTPUT) $(OBJDUMP_LIST) $(OBJCOPY_BIN)

fail-specified-linker-script-missing:
	@echo 'Error: Cannot find the specified linker script. Check the linker settings in the build configuration.'
	@exit 2

warn-no-linker-script-specified:
	@echo 'Warning: No linker script specified. Check the linker settings in the build configuration.'

.PHONY: all clean dependents main-build fail-specified-linker-script-missing warn-no-linker-script-specified

-include ../makefile.targets
