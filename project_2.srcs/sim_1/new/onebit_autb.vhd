----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/08/2018 03:06:49 PM
-- Design Name: 
-- Module Name: onebit_autb - Behavioral
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

entity onebit_autb is
--  Port ( );
end onebit_autb;

architecture Behavioral of onebit_autb is
component onebit_au
Port ( 
    S0 :in STD_LOGIC;
    S1 :in STD_LOGIC;
    A: in STD_LOGIC;
    B: in STD_LOGIC;
    Cin: in STD_LOGIC;
    Cout: out STD_LOGIC;
    G: out STD_LOGIC
 );
end component;

signal S:STD_LOGIC_VECTOR(1 downto 0);
signal A,B,Cin,Cout,G:STD_LOGIC;
begin
UUT:onebit_au port map(
S0 => S(0),
S1 => S(1),
A => A,
B => B,
Cin => Cin,
Cout => Cout,
G => G
);

process
begin
S <= "00";
A <= '0';
B <= '1';
Cin <= '0';
wait for 10 ns;
Cin <= '1';
wait for 10 ns;
S <= "01";
Cin <= '0';
wait for 10 ns;
Cin <= '1';
wait for 10 ns;
S <= "10";
Cin <= '0';
wait for 10 ns;
Cin <= '1';
wait for 10 ns;
S <= "11";
Cin <= '0';
wait for 10 ns;
Cin <= '1';
wait for 10 ns;
end process;
end Behavioral;
