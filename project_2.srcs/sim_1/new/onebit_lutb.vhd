----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/08/2018 03:41:08 PM
-- Design Name: 
-- Module Name: onebit_lutb - Behavioral
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

entity onebit_lutb is
--  Port ( );
end onebit_lutb;

architecture Behavioral of onebit_lutb is
component onebit_lu
port(
    S0 :in STD_LOGIC;
    S1 :in STD_LOGIC;
    A: in STD_LOGIC;
    B:in STD_LOGIC;
    G: out STD_LOGIC
);
end component;
signal S: STD_LOGIC_VECTOR(1 downto 0);
signal A,B,G : STD_LOGIC;
begin
uut: onebit_lu port map(
S0 => S(0),
S1 => S(1),
A => A,
B => B,
G => G
);

process
begin
A <= '1';
B <= '0';
S <= "00";
wait for 10 ns;
S <= "01";
wait for 10 ns;
S <= "10";
wait for 10 ns;
S <= "11";
wait for 10 ns;

A <= '1';
B <= '1';
S <= "00";
wait for 10 ns;
S <= "01";
wait for 10 ns;
S <= "10";
wait for 10 ns;
S <= "11";
wait for 10 ns;

A <= '0';
B <= '0';
S <= "00";
wait for 10 ns;
S <= "01";
wait for 10 ns;
S <= "10";
wait for 10 ns;
S <= "11";
wait for 10 ns;

end process;
end Behavioral;


