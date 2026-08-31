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

begin

end architecture rtl;
