----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/08/2018 04:41:39 PM
-- Design Name: 
-- Module Name: alu_16bittb - Behavioral
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

entity alu_16bittb is
--  Port ( );
end alu_16bittb;

architecture Behavioral of alu_16bittb is
component alu_16bit
Port (
    A : in STD_LOGIC_VECTOR(15 downto 0);
    B : in STD_LOGIC_VECTOR(15 downto 0);
    Cin : in STD_LOGIC;
    S0 : in STD_LOGIC;
    S1: in STD_LOGIC;
    S2: in STD_LOGIC;
    G : out STD_LOGIC_VECTOR(15 downto 0);
    Cout: out STD_LOGIC  
 );
end component;

signal A,B,G:std_logic_vector(15 downto 0);
signal S:STD_LOGIC_VECTOR(2 downto 0);
signal Cout,Cin:STD_LOGIC;
begin
uut:alu_16bit port map(
A => A,
B => B,
Cin => Cin,
S0 => S(0),
S1 => S(1),
S2 => S(2),
G => G,
Cout => Cout
);

process
begin
A <= "0000000000011000";
B <= "0000000000001100";
Cin <= '0';
S <= "000";
wait for 100 ns;
S <= "001";
wait for 100 ns;
S <= "010";
wait for 100 ns;
S <= "011";
wait for 100 ns;
S <= "100";
wait for 100 ns;
S <= "101";
wait for 100 ns;
S <= "110";
wait for 100 ns;
S <= "111";
wait for 100 ns;
end process;
end Behavioral;
