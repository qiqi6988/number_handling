################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../testData/exam.c 

OBJS += \
./testData/exam.o 

C_DEPS += \
./testData/exam.d 


# Each subdirectory must supply rules for building sources it contributes
testData/%.o: ../testData/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	$(SS_CC) -O3 -Wall -c  $(SS_CFLAGS) $(SS_OS_SPECIFIC_CFLAGS) -fmessage-length=0 -std=c99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


