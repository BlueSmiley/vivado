----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/03/2018 05:24:16 PM
-- Design Name: 
-- Module Name: CPU - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CPU is
  Port ( 
  Clk : in STD_LOGIC;
  reset : in STD_LOGIC
  );
end CPU;

architecture Behavioral of CPU is

component Microprogrammed_control
  Port ( 
  IRin : in STD_LOGIC_VECTOR(15 downto 0);
  V: in STD_LOGIC;
  N: in STD_LOGIC;
  C: in STD_LOGIC;
  Z: in STD_LOGIC;
  Reset: in STD_LOGIC;
  Clk : in STD_LOGIC;
  PCout : out STD_LOGIC_VECTOR(15 downto 0);
  DR : out  STD_LOGIC_VECTOR (2 downto 0);
  SA : out  STD_LOGIC_VECTOR (2 downto 0);
  SB : out  STD_LOGIC_VECTOR (2 downto 0);
  TD : out  STD_LOGIC;
  TA : out  STD_LOGIC;
  TB : out  STD_LOGIC;
  MB : out  STD_LOGIC;
  FS : out  STD_LOGIC_VECTOR (4 downto 0);
  MD : out  STD_LOGIC;
  RW : out  STD_LOGIC;
  MM : out  STD_LOGIC;
  MW : out STD_LOGIC
  );
end component;

component datapath
 Port ( 
 Clk : in STD_LOGIC;
 PC : in STD_LOGIC_VECTOR (15 downto 0);
 datain:in STD_LOGIC_VECTOR(15 downto 0);
 RW: in STD_LOGIC;
 MD: in STD_LOGIC;
 FS: in STD_LOGIC_VECTOR(4 downto 0);
 MB: in STD_LOGIC;
 MM : IN std_logic;
 BA: in STD_LOGIC_VECTOR(3 downto 0);
 AA:in STD_LOGIC_VECTOR(3 downto 0);
 DA:in STD_LOGIC_VECTOR(3 downto 0);
 SB: in STD_LOGIC_VECTOR(2 downto 0);
 V:out STD_LOGIC;
 C:out STD_LOGIC;
 N:out STD_LOGIC;
 Z:out STD_LOGIC;
 addrout:out STD_LOGIC_VECTOR(15 downto 0);
 dataout:out STD_LOGIC_VECTOR(15 downto 0)
);
end component;

component memory_module
Port ( 
    address : in std_logic_vector(15 downto 0);
    write_data : in std_logic_vector(15 downto 0);
    MemWrite : in std_logic;
    read_data : out std_logic_vector(15 downto 0)
    );
end component;

    signal memory_out : std_logic_vector(15 downto 0);
    signal V,C,N,Z, TD,TA,TB, MB,MD,RW,MM,MW : std_logic;
    signal PCout,datapath_addrout,datapath_dataout : STD_LOGIC_VECTOR(15 downto 0);
    signal DR,SA,SB : STD_LOGIC_VECTOR(2 downto 0);
    signal FS : STD_LOGIC_VECTOR(4 downto 0);
begin
micro: Microprogrammed_control port map(
    IRin => memory_out,
    reset => reset,
    V => V,
    Z => Z,
    N => N,
    C => C,
    CLK => Clk, 
    PCout => PCout,
    TD => TD,
    TA => TA,
    TB => Tb,
    MB => Mb,
    MD => MD,
    RW => RW,
    MM => MM,
    MW => MW,
    DR => DR,
    SA => SA,
    SB => SB,
    FS => FS  
);

dp: Datapath port map(
PC => PCout,
datain => memory_out,
DA(2 downto 0) => DR,
DA(3) => TD,
AA(2 downto 0) => SA,
AA(3) => TA,
BA(2 downto 0) => SB,
BA(3) => TB,
Clk => CLK,
RW => RW,
MD => MD,
FS => FS,
MB => MB,
MM => MM,
SB => SB,
addrout => datapath_addrout,
dataout => datapath_dataout,
V => V,
C => C,
N => N,
Z => Z
);

memory: memory_module port map(
address => datapath_addrout,
write_data => datapath_dataout,
MemWrite => MW,
read_data => memory_out
);

end Behavioral;
