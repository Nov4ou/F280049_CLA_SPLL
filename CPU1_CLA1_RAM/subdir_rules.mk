################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
build-360453793: ../c2000.syscfg
	@echo 'Building file: "$<"'
	@echo 'Invoking: SysConfig'
	"/Applications/ti/ccs2011/ccs/utils/sysconfig_1.24.0/sysconfig_cli.sh" --script "/Users/nov4ou/workspace_ccstheia/F280049_CLA_ACAC/c2000.syscfg" -o "syscfg" -s "/Applications/ti/c2000/C2000Ware_5_04_00_00/.metadata/sdk.json" -d "F28004x" -p "F28004x_100PZ" -r "F28004x_100PZ" --compiler ccs
	@echo 'Finished building: "$<"'
	@echo ' '

syscfg/board.c: build-360453793 ../c2000.syscfg
syscfg/board.h: build-360453793
syscfg/board.cmd.genlibs: build-360453793
syscfg/board.opt: build-360453793
syscfg/board.json: build-360453793
syscfg/pinmux.csv: build-360453793
syscfg/epwm.dot: build-360453793
syscfg/adc.dot: build-360453793
syscfg/c2000ware_libraries.cmd.genlibs: build-360453793
syscfg/c2000ware_libraries.opt: build-360453793
syscfg/c2000ware_libraries.c: build-360453793
syscfg/c2000ware_libraries.h: build-360453793
syscfg/clocktree.h: build-360453793
syscfg: build-360453793

syscfg/%.obj: ./syscfg/%.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccs2011/ccs/tools/compiler/ti-cgt-c2000_22.6.1.LTS/bin/cl2000" -v28 -ml -mt --cla_support=cla2 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu0 -Ooff --include_path="/Users/nov4ou/workspace_ccstheia/F280049_CLA_ACAC" --include_path="/Applications/ti/c2000/C2000Ware_5_04_00_00" --include_path="/Users/nov4ou/workspace_ccstheia/F280049_CLA_ACAC/device" --include_path="/Applications/ti/c2000/C2000Ware_5_04_00_00/driverlib/f28004x/driverlib/" --include_path="/Applications/ti/ccs2011/ccs/tools/compiler/ti-cgt-c2000_22.6.1.LTS/include" --include_path="/Applications/ti/Solar_lib/float/include" --include_path="/Applications/ti/Solar_lib/CLA/include" --include_path="/Applications/ti/c2000/C2000Ware_5_04_00_00/libraries/math/CLAmath/c28/include" --define=DEBUG --diag_suppress=10063 --diag_warning=225 --diag_wrap=off --display_error_number --gen_func_subsections=on --abi=coffabi --preproc_with_compile --preproc_dependency="syscfg/$(basename $(<F)).d_raw" --include_path="/Users/nov4ou/workspace_ccstheia/F280049_CLA_ACAC/CPU1_CLA1_RAM/syscfg" --obj_directory="syscfg" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

%.obj: ../%.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccs2011/ccs/tools/compiler/ti-cgt-c2000_22.6.1.LTS/bin/cl2000" -v28 -ml -mt --cla_support=cla2 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu0 -Ooff --include_path="/Users/nov4ou/workspace_ccstheia/F280049_CLA_ACAC" --include_path="/Applications/ti/c2000/C2000Ware_5_04_00_00" --include_path="/Users/nov4ou/workspace_ccstheia/F280049_CLA_ACAC/device" --include_path="/Applications/ti/c2000/C2000Ware_5_04_00_00/driverlib/f28004x/driverlib/" --include_path="/Applications/ti/ccs2011/ccs/tools/compiler/ti-cgt-c2000_22.6.1.LTS/include" --include_path="/Applications/ti/Solar_lib/float/include" --include_path="/Applications/ti/Solar_lib/CLA/include" --include_path="/Applications/ti/c2000/C2000Ware_5_04_00_00/libraries/math/CLAmath/c28/include" --define=DEBUG --diag_suppress=10063 --diag_warning=225 --diag_wrap=off --display_error_number --gen_func_subsections=on --abi=coffabi --preproc_with_compile --preproc_dependency="$(basename $(<F)).d_raw" --include_path="/Users/nov4ou/workspace_ccstheia/F280049_CLA_ACAC/CPU1_CLA1_RAM/syscfg" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

%.obj: ../%.cla $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C2000 Compiler'
	"/Applications/ti/ccs2011/ccs/tools/compiler/ti-cgt-c2000_22.6.1.LTS/bin/cl2000" -v28 -ml -mt --cla_support=cla2 --float_support=fpu32 --tmu_support=tmu0 --vcu_support=vcu0 -Ooff --include_path="/Users/nov4ou/workspace_ccstheia/F280049_CLA_ACAC" --include_path="/Applications/ti/c2000/C2000Ware_5_04_00_00" --include_path="/Users/nov4ou/workspace_ccstheia/F280049_CLA_ACAC/device" --include_path="/Applications/ti/c2000/C2000Ware_5_04_00_00/driverlib/f28004x/driverlib/" --include_path="/Applications/ti/ccs2011/ccs/tools/compiler/ti-cgt-c2000_22.6.1.LTS/include" --include_path="/Applications/ti/Solar_lib/float/include" --include_path="/Applications/ti/Solar_lib/CLA/include" --include_path="/Applications/ti/c2000/C2000Ware_5_04_00_00/libraries/math/CLAmath/c28/include" --define=DEBUG --diag_suppress=10063 --diag_warning=225 --diag_wrap=off --display_error_number --gen_func_subsections=on --abi=coffabi --preproc_with_compile --preproc_dependency="$(basename $(<F)).d_raw" --include_path="/Users/nov4ou/workspace_ccstheia/F280049_CLA_ACAC/CPU1_CLA1_RAM/syscfg" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '


