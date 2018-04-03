----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/03/2018 07:35:24 PM
-- Design Name: 
-- Module Name: extendtb - Behavioral
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

entity extendtb is
--  Port ( );
end extendtb;

architecture Behavioral of extendtb is

COMPONENT Extend
    PORT(
         DR : IN  std_logic_vector(2 downto 0);
         SB : IN  std_logic_vector(2 downto 0);
         output : OUT  std_logic_vector(15 downto 0)
        );
END COMPONENT;
signal DR,SB : std_logic_vector(2 downto 0);
signal output : std_logic_vector(15 downto 0);
begin

uut: Extend PORT MAP (
          DR => DR,
          SB => SB,
          output => output
);

process
begin
DR <= "100";
SB <= "010";
wait for 100 ns; 
DR <= "001";
SB <= "110";
wait;
end process;
end Behavioral;
