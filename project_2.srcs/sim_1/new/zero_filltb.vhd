----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/03/2018 07:28:55 PM
-- Design Name: 
-- Module Name: zero_filltb - Behavioral
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

entity zero_filltb is
--  Port ( );
end zero_filltb;

architecture Behavioral of zero_filltb is

COMPONENT zero_fill
    PORT(
         input : IN  std_logic_vector(2 downto 0);
         output : OUT  std_logic_vector(15 downto 0)
        );
END COMPONENT;

    signal input : std_logic_vector(2 downto 0) ;
    signal output : std_logic_vector(15 downto 0);
begin

 uut: zero_fill PORT MAP (
          input => input,
          output => output
);

    process
    begin
    input <= "000";
    wait for 100 ns;

    input <= "001";
    wait for 100 ns;

    input <= "010";
    wait;
    end process;
end Behavioral;
