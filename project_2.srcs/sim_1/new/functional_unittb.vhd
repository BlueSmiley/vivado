----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/09/2018 09:15:05 AM
-- Design Name: 
-- Module Name: functional_unittb - Behavioral
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

entity functional_unittb is
--  Port ( );
end functional_unittb;

architecture Behavioral of functional_unittb is
component functional_unit
port(
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

signal A,B,F : STD_LOGIC_VECTOR(15 downto 0);
signal FS: STD_LOGIC_VECTOR(4 downto 0);
signal V,C,N,Z : STD_LOGIC;
begin
uut:functional_unit port map(
A => A,
B => B,
FS => FS,
V => V,
C => C,
N => N,
Z => Z,
F => F
);

process
begin
A <= "0000000000011000";
B <= "0000000000001100";
FS <= "00000"; 
wait for 50 ns;
FS <= "00001"; 
wait for 50 ns;
FS <= "00010"; 
wait for 50 ns;
FS <= "00011"; 
wait for 50 ns;
FS <= "00100"; 
wait for 50 ns;
FS <= "00101"; 
wait for 50 ns;
FS <= "00110"; 
wait for 50 ns;
FS <= "00111"; 
wait for 50 ns;
FS <= "01000"; 
wait for 50 ns;
FS <= "01010"; 
wait for 50 ns;
FS <= "01100"; 
wait for 50 ns;
FS <= "01110"; 
wait for 50 ns;
FS <= "10000"; 
wait for 50 ns;
FS <= "10100"; 
wait for 50 ns;
FS <= "11000"; 
wait for 50 ns;
end process;
end Behavioral;
