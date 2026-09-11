-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
-- Tool Version: Vivado v.2026.1 (lin64) Build 6511674 Tue Jun 16 11:01:26 MDT 2026
-- Date        : Mon Aug 31 08:26:35 2026
-- Host        : localhost.localdomain running 64-bit AlmaLinux 9.8 (Olive Jaguar)
-- Command     : generate_target xvc_pynq_wrapper.bd
-- Design      : xvc_pynq_wrapper
-- Purpose     : IP block netlist
----------------------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;

library unisim;
  use unisim.vcomponents.all;

entity xvc_pynq_wrapper is
  port (
    DDR_ADDR          : inout std_logic_vector( 14 downto 0);
    DDR_BA            : inout std_logic_vector( 2 downto 0);
    DDR_CAS_n         : inout std_logic;
    DDR_CK_n          : inout std_logic;
    DDR_CK_p          : inout std_logic;
    DDR_CKE           : inout std_logic;
    DDR_CS_n          : inout std_logic;
    DDR_DM            : inout std_logic_vector( 3 downto 0);
    DDR_DQ            : inout std_logic_vector( 31 downto 0);
    DDR_DQS_n         : inout std_logic_vector( 3 downto 0);
    DDR_DQS_p         : inout std_logic_vector( 3 downto 0);
    DDR_ODT           : inout std_logic;
    DDR_RAS_n         : inout std_logic;
    DDR_RESET_n       : inout std_logic;
    DDR_WE_n          : inout std_logic;
    FIXED_IO_DDR_VRN  : inout std_logic;
    FIXED_IO_DDR_VRP  : inout std_logic;
    FIXED_IO_MIO      : inout std_logic_vector( 53 downto 0);
    FIXED_IO_PS_CLK   : inout std_logic;
    FIXED_IO_PS_PORB  : inout std_logic;
    FIXED_IO_PS_SRSTB : inout std_logic
  );
end entity xvc_pynq_wrapper;

architecture structure of xvc_pynq_wrapper is

  component xvc_pynq is
    port (
      DDR_CAS_n         : inout std_logic;
      DDR_CKE           : inout std_logic;
      DDR_CK_n          : inout std_logic;
      DDR_CK_p          : inout std_logic;
      DDR_CS_n          : inout std_logic;
      DDR_RESET_n       : inout std_logic;
      DDR_ODT           : inout std_logic;
      DDR_RAS_n         : inout std_logic;
      DDR_WE_n          : inout std_logic;
      DDR_BA            : inout std_logic_vector( 2 downto 0);
      DDR_ADDR          : inout std_logic_vector( 14 downto 0);
      DDR_DM            : inout std_logic_vector( 3 downto 0);
      DDR_DQ            : inout std_logic_vector( 31 downto 0);
      DDR_DQS_n         : inout std_logic_vector( 3 downto 0);
      DDR_DQS_p         : inout std_logic_vector( 3 downto 0);
      FIXED_IO_MIO      : inout std_logic_vector( 53 downto 0);
      FIXED_IO_DDR_VRN  : inout std_logic;
      FIXED_IO_DDR_VRP  : inout std_logic;
      FIXED_IO_PS_SRSTB : inout std_logic;
      FIXED_IO_PS_CLK   : inout std_logic;
      FIXED_IO_PS_PORB  : inout std_logic
    );
  end component xvc_pynq;

begin

  xvc_pynq_i : component xvc_pynq
    port map (
      DDR_ADDR(14 downto 0)     => DDR_ADDR(14 downto 0),
      DDR_BA(2 downto 0)        => DDR_BA(2 downto 0),
      DDR_CAS_N                 => DDR_CAS_n,
      DDR_CK_N                  => DDR_CK_n,
      DDR_CK_P                  => DDR_CK_p,
      DDR_CKE                   => DDR_CKE,
      DDR_CS_N                  => DDR_CS_n,
      DDR_DM(3 downto 0)        => DDR_DM(3 downto 0),
      DDR_DQ(31 downto 0)       => DDR_DQ(31 downto 0),
      DDR_DQS_N(3 downto 0)     => DDR_DQS_n(3 downto 0),
      DDR_DQS_P(3 downto 0)     => DDR_DQS_p(3 downto 0),
      DDR_ODT                   => DDR_ODT,
      DDR_RAS_N                 => DDR_RAS_n,
      DDR_RESET_N               => DDR_RESET_n,
      DDR_WE_N                  => DDR_WE_n,
      FIXED_IO_DDR_VRN          => FIXED_IO_DDR_VRN,
      FIXED_IO_DDR_VRP          => FIXED_IO_DDR_VRP,
      FIXED_IO_MIO(53 downto 0) => FIXED_IO_MIO(53 downto 0),
      FIXED_IO_PS_CLK           => FIXED_IO_PS_CLK,
      FIXED_IO_PS_PORB          => FIXED_IO_PS_PORB,
      FIXED_IO_PS_SRSTB         => FIXED_IO_PS_SRSTB
    );

end architecture structure;
