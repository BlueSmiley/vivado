----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/03/2018 07:43:34 PM
-- Design Name: 
-- Module Name: CARtb - Behavioral
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

entity CARtb is
--  Port ( );
end CARtb;

architecture Behavioral of CARtb is
component CAR is
  Port ( 
  control : in STD_LOGIC;
  input: in STD_LOGIC_VECTOR(7 downto 0);
  output : out STD_LOGIC_VECTOR(7 downto 0);
  reset : in STD_LOGIC;
  Clk  : in STD_LOGIC
  );
end component;

signal control,reset,CLK : STD_LOGIC;
signal input,output : STD_LOGIC_VECTOR(7 downto 0);
begin
uut: CAR PORT MAP (
     input => input,
     reset => reset,
	 Clk => Clk,
     Control => Control,
     output => output
);

process
begin
     Clk <= '0';
     wait for 2ns;
     Clk <= '1';
     wait for 2ns;
end process;


process
begin
input <= "00000001";
Control <= '1';
reset <= '0';
wait for 50 ns;

input <= "00000001";
Control <= '0';
wait;
end process;

end Behavioral;
