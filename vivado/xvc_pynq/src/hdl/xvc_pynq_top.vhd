library ieee;
  use ieee.std_logic_1164.all;

entity xvc_pynq_top is
  port (
    DDR_ADDR          : inout std_logic_vector(14 downto 0);
    DDR_BA            : inout std_logic_vector(2 downto 0);
    DDR_CAS_n         : inout std_logic;
    DDR_CK_n          : inout std_logic;
    DDR_CK_p          : inout std_logic;
    DDR_CKE           : inout std_logic;
    DDR_CS_n          : inout std_logic;
    DDR_DM            : inout std_logic_vector(3 downto 0);
    DDR_DQ            : inout std_logic_vector(31 downto 0);
    DDR_DQS_n         : inout std_logic_vector(3 downto 0);
    DDR_DQS_p         : inout std_logic_vector(3 downto 0);
    DDR_ODT           : inout std_logic;
    DDR_RAS_n         : inout std_logic;
    DDR_RESET_n       : inout std_logic;
    DDR_WE_n          : inout std_logic;
    FIXED_IO_DDR_VRN  : inout std_logic;
    FIXED_IO_DDR_VRP  : inout std_logic;
    FIXED_IO_MIO      : inout std_logic_vector(53 downto 0);
    FIXED_IO_PS_CLK   : inout std_logic;
    FIXED_IO_PS_PORB  : inout std_logic;
    FIXED_IO_PS_SRSTB : inout std_logic
  );
end entity xvc_pynq_top;

architecture rtl of xvc_pynq_top is

  component xvc_pynq_wrapper is
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
  end component xvc_pynq_wrapper;

begin

  xvc_pynq_wrapper_inst : component xvc_pynq_wrapper
    port map (
      DDR_ADDR          => DDR_ADDR,
      DDR_BA            => DDR_BA,
      DDR_CAS_N         => DDR_CAS_n,
      DDR_CK_N          => DDR_CK_n,
      DDR_CK_P          => DDR_CK_p,
      DDR_CKE           => DDR_CKE,
      DDR_CS_N          => DDR_CS_n,
      DDR_DM            => DDR_DM,
      DDR_DQ            => DDR_DQ,
      DDR_DQS_N         => DDR_DQS_n,
      DDR_DQS_P         => DDR_DQS_p,
      DDR_ODT           => DDR_ODT,
      DDR_RAS_N         => DDR_RAS_n,
      DDR_RESET_N       => DDR_RESET_n,
      DDR_WE_N          => DDR_WE_n,
      FIXED_IO_DDR_VRN  => FIXED_IO_DDR_VRN,
      FIXED_IO_DDR_VRP  => FIXED_IO_DDR_VRP,
      FIXED_IO_MIO      => FIXED_IO_MIO,
      FIXED_IO_PS_CLK   => FIXED_IO_PS_CLK,
      FIXED_IO_PS_PORB  => FIXED_IO_PS_PORB,
      FIXED_IO_PS_SRSTB => FIXED_IO_PS_SRSTB
    );

end architecture rtl;
