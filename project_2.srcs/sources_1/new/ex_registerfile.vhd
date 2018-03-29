----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/08/2018 01:49:53 PM
-- Design Name: 
-- Module Name: ex_registerfile - Behavioral
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

entity ex_registerfile is
 Port ( 
 Clk : in STD_LOGIC;
 constantin:in STD_LOGIC_VECTOR(15 downto 0);
 RW: in STD_LOGIC;
 MD: in STD_LOGIC;
 FS: in STD_LOGIC_VECTOR(4 downto 0);
 MB: in STD_LOGIC;
 BA: in STD_LOGIC_VECTOR(2 downto 0);
 AA:in STD_LOGIC_VECTOR(2 downto 0);
 DA:in STD_LOGIC_VECTOR(2 downto 0);
 V:out STD_LOGIC;
 C:out STD_LOGIC;
 N:out STD_LOGIC;
 Z:out STD_LOGIC;
 addrout:out STD_LOGIC_VECTOR(15 downto 0);
 dataout:out STD_LOGIC_VECTOR(15 downto 0)
 );
 end ex_registerfile;

architecture Behavioral of ex_registerfile is
component mux2to1
         PORT(
         In0 : IN std_logic_vector(15 downto 0);
         In1 : IN std_logic_vector(15 downto 0);
         S : IN std_logic;
         Z : OUT std_logic_vector(15 downto 0)
         );
end component;

component mod_regfile
Port ( 
           src_A : in STD_LOGIC_Vector(2 downto 0);
           src_B : in STD_LOGIC_Vector(2 downto 0);
           resA : out STD_LOGIC_VECTOR(15 downto 0);
           resB : out STD_LOGIC_VECTOR(15 downto 0);
           des_A : in STD_LOGIC_Vector(2 downto 0);
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

signal Bin,busA,busB,busD :STD_LOGIC_VECTOR(15 downto 0);
begin
reg_file:mod_regfile port map(
src_A => AA,
src_B => BA,
resA => busA,
resB => Bin,
RW => RW,
des_A => DA,
Clk => Clk,
data_src => MD,
data => busD,
src_reg => busD
);

muxB:mux2to1 port map(
In0 => Bin,
In1 => constantin,
S => MB,
Z => busB
);

addrout <= busA;
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
