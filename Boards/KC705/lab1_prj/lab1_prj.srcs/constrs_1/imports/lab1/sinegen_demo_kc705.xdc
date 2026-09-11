#--------------------------------------------------------------
#-- (C) Copyright 2010-2011 Xilinx, Inc. All Rights Reserved.
#--
#-- XILINX, the Xilinx logo, the Brand Window and other
#-- designated brands included herein are trademarks of Xilinx,
#-- Inc. All other trademarks are the property of their
#-- respective owners.
#--
#-- NOTICE OF DISCLAIMER: The information disclosed to you
#-- hereunder (the "Information") is provided "AS-IS" with no
#-- warranty of any kind, express or implied. Xilinx does not
#-- assume any liability arising from your use of the
#-- Information. You are responsible for obtaining any rights
#-- you may require for your use of this Information. Xilinx
#-- reserves the right to make changes, at any time, to the
#-- Information without notice and at its sole discretion.
#-- Xilinx assumes no obligation to correct any errors contained
#-- in the Information or to advise you of any corrections or
#-- updates. Xilinx expressly disclaims any liability in
#-- connection with technical support or assistance that may be
#-- provided to you in connection with the Information. XILINX
#-- MAKES NO OTHER WARRANTIES, WHETHER EXPRESS, IMPLIED, OR
#-- STATUTORY, REGARDING THE INFORMATION, INCLUDING ANY
#-- WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
#-- PURPOSE, OR NONINFRINGEMENT OF THIRD-PARTY RIGHTS.
#--------------------------------------------------------------

###############################################
## KC705 Development Board (XC7K325TFFG900-2)
###############################################
#
#  Clock period
#  200 MHz oscillator
create_clock -period 5.000 -name CLK_P [get_ports CLK_P]
create_clock -period 5.000 -name CLK_N [get_ports CLK_N]
create_clock -period 5.000 -name clk [get_nets clk]

# Pin locs

set_property PACKAGE_PIN AD12 [get_ports CLK_P]
set_property PACKAGE_PIN AD11 [get_ports CLK_N]
set_property IOSTANDARD LVDS [get_ports CLK_P]
set_property IOSTANDARD LVDS [get_ports CLK_N]

set_property PACKAGE_PIN AA12 [get_ports {GPIO_BUTTONS[0]}]
set_property PACKAGE_PIN AG5 [get_ports {GPIO_BUTTONS[1]}]
set_property PACKAGE_PIN Y28 [get_ports GPIO_SWITCH]
set_property IOSTANDARD LVCMOS15 [get_ports {GPIO_BUTTONS[0]}]
set_property IOSTANDARD LVCMOS15 [get_ports {GPIO_BUTTONS[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports GPIO_SWITCH]

set_property PACKAGE_PIN AB8 [get_ports {LEDS_n[0]}]
set_property PACKAGE_PIN AA8 [get_ports {LEDS_n[1]}]
set_property PACKAGE_PIN AC9 [get_ports {LEDS_n[2]}]
set_property PACKAGE_PIN AB9 [get_ports {LEDS_n[3]}]
set_property IOSTANDARD LVCMOS15 [get_ports {LEDS_n[0]}]
set_property IOSTANDARD LVCMOS15 [get_ports {LEDS_n[1]}]
set_property IOSTANDARD LVCMOS15 [get_ports {LEDS_n[2]}]
set_property IOSTANDARD LVCMOS15 [get_ports {LEDS_n[3]}]



set_property MARK_DEBUG false [get_nets DONT_EAT0]

set_property MARK_DEBUG true [get_nets {GPIO_BUTTONS_IBUF[0]}]
set_property MARK_DEBUG true [get_nets {GPIO_BUTTONS_IBUF[1]}]
set_property MARK_DEBUG true [get_nets {U_SINEGEN/sel[0]}]
set_property MARK_DEBUG true [get_nets {U_SINEGEN/sel[1]}]
set_property MARK_DEBUG true [get_nets {U_SINEGEN/sine[16]}]
set_property MARK_DEBUG true [get_nets {U_SINEGEN/sine[15]}]
set_property MARK_DEBUG true [get_nets {U_SINEGEN/sine[10]}]
set_property MARK_DEBUG true [get_nets {U_SINEGEN/sine[5]}]
set_property MARK_DEBUG true [get_nets {U_SINEGEN/sine[2]}]
set_property MARK_DEBUG true [get_nets {U_SINEGEN/sine[14]}]
set_property MARK_DEBUG true [get_nets {U_SINEGEN/sine[9]}]
set_property MARK_DEBUG true [get_nets {U_SINEGEN/sine[8]}]
set_property MARK_DEBUG true [get_nets {U_SINEGEN/sine[3]}]
set_property MARK_DEBUG true [get_nets {U_SINEGEN/sine[1]}]
set_property MARK_DEBUG true [get_nets {U_SINEGEN/sine[0]}]
set_property MARK_DEBUG true [get_nets {U_SINEGEN/sine[18]}]
set_property MARK_DEBUG true [get_nets {U_SINEGEN/sine[13]}]
set_property MARK_DEBUG true [get_nets {U_SINEGEN/sine[7]}]
set_property MARK_DEBUG true [get_nets {U_SINEGEN/sine[17]}]
set_property MARK_DEBUG true [get_nets {U_SINEGEN/sine[6]}]
set_property MARK_DEBUG true [get_nets {U_SINEGEN/sine[12]}]
set_property MARK_DEBUG true [get_nets {U_SINEGEN/sine[4]}]
set_property MARK_DEBUG true [get_nets {U_SINEGEN/sine[11]}]
set_property MARK_DEBUG true [get_nets {U_SINEGEN/sine[19]}]
create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 4 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER true [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list clk]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 2 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {U_SINEGEN/sel[0]} {U_SINEGEN/sel[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 2 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {GPIO_BUTTONS_dly[0]} {GPIO_BUTTONS_dly[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 2 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {GPIO_BUTTONS_db[0]} {GPIO_BUTTONS_db[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 2 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {GPIO_BUTTONS_IBUF[0]} {GPIO_BUTTONS_IBUF[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 2 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {GPIO_BUTTONS_re[0]} {GPIO_BUTTONS_re[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 20 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {U_SINEGEN/sine[0]} {U_SINEGEN/sine[1]} {U_SINEGEN/sine[2]} {U_SINEGEN/sine[3]} {U_SINEGEN/sine[4]} {U_SINEGEN/sine[5]} {U_SINEGEN/sine[6]} {U_SINEGEN/sine[7]} {U_SINEGEN/sine[8]} {U_SINEGEN/sine[9]} {U_SINEGEN/sine[10]} {U_SINEGEN/sine[11]} {U_SINEGEN/sine[12]} {U_SINEGEN/sine[13]} {U_SINEGEN/sine[14]} {U_SINEGEN/sine[15]} {U_SINEGEN/sine[16]} {U_SINEGEN/sine[17]} {U_SINEGEN/sine[18]} {U_SINEGEN/sine[19]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list DONT_EAT]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk]
