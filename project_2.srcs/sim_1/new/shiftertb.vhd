----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/08/2018 05:39:19 PM
-- Design Name: 
-- Module Name: shiftertb - Behavioral
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

entity shiftertb is
--  Port ( );
end shiftertb;

architecture Behavioral of shiftertb is
component shifter_unit
Port (
    IR:in STD_LOGIC;
    IL:in STD_LOGIC;
    S:in STD_LOGIC_VECTOR(1 downto 0);
    B: in STD_LOGIC_VECTOR(15 downto 0);
    H:out STD_LOGIC_VECTOR(15 downto 0)
);
end component;

signal IR,IL: STD_LOGIC;
signal s : STD_LOGIC_VECTOR(1 downto 0);
signal B,H : STD_LOGIC_VECTOR(15 downto 0);
begin
uut:shifter_unit port map(
IR => IR,
IL => IL,
S => S,
B => B,
H => H
);

process
begin
IR <= '0';
IL <= '0';
S <= "00";
B <= "0000000000011000";
wait for 10 ns;
S <= "01";
wait for 10 ns;
S <= "10";
wait for 10 ns;
end process;
end Behavioral;
