set_global_assignment -entity "ADC" -library "lib_ADC" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "ADC" -library "lib_ADC" -name IP_TOOL_VERSION "15.1"
set_global_assignment -entity "ADC" -library "lib_ADC" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_ADC" -name SPD_FILE [file join $::quartus(sip_path) "../ADC.spd"]
set_global_assignment -library "lib_ADC" -name MISC_FILE [file join $::quartus(sip_path) "../../ADC.qsys"]

set_global_assignment -library "lib_ADC" -name MISC_FILE [file join $::quartus(sip_path) "ADC.vhd"]
set_global_assignment -library "lib_ADC" -name MISC_FILE [file join $::quartus(sip_path) "submodules/mentor/altera_reset_controller.v"]
set_global_assignment -library "lib_ADC" -name MISC_FILE [file join $::quartus(sip_path) "submodules/mentor/altera_reset_synchronizer.v"]
set_global_assignment -library "lib_ADC" -name MISC_FILE [file join $::quartus(sip_path) "submodules/aldec/altera_reset_controller.v"]
set_global_assignment -library "lib_ADC" -name MISC_FILE [file join $::quartus(sip_path) "submodules/aldec/altera_reset_synchronizer.v"]
set_global_assignment -library "lib_ADC" -name MISC_FILE [file join $::quartus(sip_path) "submodules/ADC_modular_adc_0.vhd"]
set_global_assignment -library "lib_ADC" -name MISC_FILE [file join $::quartus(sip_path) "submodules/ADC_altpll_0.vho"]
