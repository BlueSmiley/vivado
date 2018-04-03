----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/28/2018 02:41:13 PM
-- Design Name: 
-- Module Name: extend - Behavioral
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

entity extend is
 Port ( 
    DR: in STD_LOGIC_VECTOR(2 downto 0);
    SB: in STD_LOGIC_VECTOR(2 downto 0);
    output: out STD_LOGIC_VECTOR(15 downto 0)
 );
end extend;

architecture Behavioral of extend is

begin
    output(5 downto 3) <= DR;
	output(2 downto 0) <= SB;
	output(15 downto 6) <= "0000000000" when DR(2) = '0' else "1111111111";


end Behavioral;
