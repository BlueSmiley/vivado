----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/08/2018 01:11:19 PM
-- Design Name: 
-- Module Name: functional_unit - Behavioral
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

entity functional_unit is
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
end functional_unit;

architecture Behavioral of functional_unit is

component alu_16bit
Port (
    A : in STD_LOGIC_VECTOR(15 downto 0);
    B : in STD_LOGIC_VECTOR(15 downto 0);
    Cin : in STD_LOGIC;
    S0 : in STD_LOGIC;
    S1: in STD_LOGIC;
    S2: in STD_LOGIC;
    G : out STD_LOGIC_VECTOR(15 downto 0);
    V:out STD_LOGIC;
    Cout: out STD_LOGIC  
 );
 end component;
 
 component shifter_unit
 Port (
     IR:in STD_LOGIC;
     IL:in STD_LOGIC;
     S:in STD_LOGIC_VECTOR(1 downto 0);
     B: in STD_LOGIC_VECTOR(15 downto 0);
     H:out STD_LOGIC_VECTOR(15 downto 0)
 );
 end component;
 
 component mux2to1
          PORT(
          In0 : IN std_logic_vector(15 downto 0);
          In1 : IN std_logic_vector(15 downto 0);
          S : IN std_logic;
          Z : OUT std_logic_vector(15 downto 0)
          );
 end component;
 
 signal aluresult,shiftresult:STD_LOGIC_VECTOR(15 downto 0);
 
begin
alu:alu_16bit port map(
A => A,
B => B,
Cin => FS(0),
S0 => FS(1),
S1 => FS(2),
S2 => FS(3),
G => aluresult,
V => V,
Cout => C
);

shifter:shifter_unit port map(
IR => '0',
IL => '0',
S(0) => FS(2),
S(1) => FS(3),
B => B,
H => shiftresult
);

muxF:mux2to1 port map(
In0 => aluresult,
In1 => shiftresult,
S => FS(4),
Z => F
);

Z <= '1' after 1 ns when aluresult = "0" else
     '0' after 1 ns;
N <= '1' after 1 ns when aluresult(15) = '1' else
          '0' after 1 ns;

end Behavioral;
