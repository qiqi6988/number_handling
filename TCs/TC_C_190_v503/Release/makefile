################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include subdir.mk
-include src/subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all: TC_C_190_v503

# Tool invocations
TC_C_190_v503: $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: MinGW C Linker'
	$(SS_LNK) -o  "TC_C_190_v503" $(OBJS) $(USER_OBJS) $(LIBS)  $(SS_LDFLAGS) $(SS_OS_SPECIFIC_LDFLAGS)
	@echo 'Finished building target: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(OBJS)$(C_DEPS)$(EXECUTABLES) TC_C_190_v503
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
