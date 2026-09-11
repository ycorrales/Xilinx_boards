--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2026.1 (lin64) Build 6511674 Tue Jun 16 11:01:26 MDT 2026
--Date        : Fri Sep 11 19:53:44 2026
--Host        : localhost.localdomain running 64-bit AlmaLinux 9.8 (Olive Jaguar)
--Command     : generate_target xvc_MPSoC_wrapper.bd
--Design      : xvc_MPSoC_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity xvc_MPSoC_wrapper is
end xvc_MPSoC_wrapper;

architecture STRUCTURE of xvc_MPSoC_wrapper is
  component xvc_MPSoC is
  end component xvc_MPSoC;
begin
xvc_MPSoC_i: component xvc_MPSoC
 ;
end STRUCTURE;
