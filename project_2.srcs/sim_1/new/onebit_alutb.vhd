----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/08/2018 04:15:07 PM
-- Design Name: 
-- Module Name: onebit_alutb - Behavioral
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

entity onebit_alutb is
--  Port ( );
end onebit_alutb;

architecture Behavioral of onebit_alutb is
component onebit_alu
port(
   Cin :in STD_LOGIC;
   A: in STD_LOGIC;
   B: in STD_LOGIC;
   S0: in STD_LOGIC;
   S1: in STD_LOGIC;
   S2: in STD_LOGIC;
   Cout: out STD_LOGIC;
   G: out STD_LOGIC
);
end component;

signal Cin,A,B,Cout,G : STD_LOGIC;
signal S : STD_LOGIC_VECTOR(2 downto 0);
begin
uut: onebit_alu port map(
Cin => Cin,
A => A,
B => B,
S0 => S(0),
S1 => S(1),
S2 => S(2),
Cout => Cout,
G => G
);

process
begin
Cin <= '1';
A <= '1';
B <= '0';
S <= "000";
wait for 10 ns;
S <= "100";
wait for 10 ns;
S <= "001";
wait for 10 ns;
S <= "101";
wait for 10 ns;
S <= "010";
wait for 10 ns;
S <= "110";
wait for 10 ns;
S <= "011";
wait for 10 ns;
S <= "111";
wait for 10 ns;
end process;


end Behavioral;
