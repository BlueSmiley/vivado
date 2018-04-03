----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/03/2018 04:41:41 PM
-- Design Name: 
-- Module Name: Datapath - Behavioral
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

entity Datapath is
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
end Datapath;

architecture Behavioral of Datapath is
component mux2to1
         PORT(
         In0 : IN std_logic_vector(15 downto 0);
         In1 : IN std_logic_vector(15 downto 0);
         S : IN std_logic;
         Z : OUT std_logic_vector(15 downto 0)
         );
end component;

component zero_fill
	 PORT(
			input : IN std_logic_vector(2 downto 0);
			output : out std_logic_vector(15 downto 0)
			);
END COMPONENT;

component mod_regfile2
Port ( 
        src_A : in STD_LOGIC_Vector(3 downto 0);
        src_B : in STD_LOGIC_Vector(3 downto 0);
        resA : out STD_LOGIC_VECTOR(15 downto 0);
        resB : out STD_LOGIC_VECTOR(15 downto 0);
        des_A : in STD_LOGIC_Vector(3 downto 0);
        RW:in STD_LOGIC;
        Clk : in STD_LOGIC;
        data_src : in STD_LOGIC;
        data : in STD_LOGIC_VECTOR(15 downto 0);
        src_reg: in STD_LOGIC_VECTOR(15 downto 0)         
      );
end component;

component functional_unit
  Port (
  A:in STD_LOGIC_VECTOR(15 downto 0);
  B:in STD_LOGIC_VECTOR(15 downto 0);
  FS:in STD_LOGIC_VECTOR(4 downto 0);
  V:out STD_LOGIC;
  C:out STD_LOGIC;
  N:out STD_LOGIC;
  Z:out STD_LOGIC;
  F:out STD_LOGIC_Vector(15 downto 0)
  );
end component;

signal SB_filled,Bin,busA,busB,busD :STD_LOGIC_VECTOR(15 downto 0);

begin

reg_file:mod_regfile2 port map(
src_A => AA,
src_B => BA,
resA => busA,
resB => Bin,
RW => RW,
des_A => DA,
Clk => Clk,
data_src => MD,
data => datain,
src_reg => busD
);

muxB:mux2to1 port map(
In0 => Bin,
In1 => SB_filled,
S => MB,
Z => busB
);

zero_filler: zero_fill port map(
input => SB,
output =>SB_filled
);

muxM:mux2to1 port map(
In0 => busA,
In1 => PC,
S => MM,
Z => addrout
);

dataout <= busB;

func_unit:functional_unit port map(
A => busA,
B => busB,
FS => FS,
V => V,
C => C,
N => N,
Z => Z,
F => busD
);

end Behavioral;
