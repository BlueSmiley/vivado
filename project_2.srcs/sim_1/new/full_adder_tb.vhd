----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2018 11:06:30 AM
-- Design Name: 
-- Module Name: full_adder_tb - Behavioral
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

entity full_adder_tb is
--  Port ( );
end full_adder_tb;

architecture Behavioral of full_adder_tb is
component full_adder
 Port (
 A : in STD_LOGIC;
 B : in STD_LOGIC;
 Cin : in STD_LOGIC;
 S : out STD_LOGIC;
 Cout : out STD_LOGIC);
end component;

    signal A,B,Cin,S,Cout : STD_LOGIC;
begin
UUT: full_adder port map(
A => A,
 B => B,
 Cin => Cin,
 S => S,
 Cout => Cout
);

process
begin
 A <= '1';
B <= '0';
Cin <= '0';
wait for 10 ns;

A <= '0';
B <= '1';
Cin <= '0';
wait for 10 ns;

A <= '1';
B <= '1';
Cin <= '0';
wait for 10 ns;

A <= '0';
B <= '0';
Cin <= '1';
wait for 10 ns;

A <= '1';
B <= '0';
Cin <= '1';
wait for 10 ns;

A <= '0';
B <= '1';
Cin <= '1';
wait for 10 ns;

A <= '1';
B <= '1';
Cin <= '1';
wait for 10 ns;

end process;
end Behavioral;
