----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2018 01:06:43 PM
-- Design Name: 
-- Module Name: decoder3to8tb2 - Behavioral
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

entity decoder3to8tb2 is
--  Port ( );
end decoder3to8tb2;

architecture Behavioral of decoder3to8tb2 is
    component decoder3to8
        Port ( 
           A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           Q0 : out STD_LOGIC;
           Q1 : out STD_LOGIC;
           Q2 : out STD_LOGIC;
           Q3 : out STD_LOGIC;
           Q4 : out STD_LOGIC;
           Q5 : out STD_LOGIC;
           Q6 : out STD_LOGIC;
           Q7 : out STD_LOGIC);
    end component;
    
     signal inputs : std_logic_vector (2 downto 0);
     signal Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7 : std_logic;
begin
     UUT: decoder3to8 port map (
     
     A2 => inputs(2),
     A1 => inputs(1),
     A0 => inputs(0),
     Q0 => Q0,
     Q1 => Q1,
     Q2 => Q2,
     Q3 => Q3,
     Q4 => Q4,
     Q5 => Q5,
     Q6 => Q6,
     Q7 => Q7
     );

   decoder_proc: process
    begin
        inputs <= "000";
        wait for 10 ns;
        inputs <= "001";
        wait for 10 ns;
        inputs <= "010";
        wait for 10 ns;
        inputs <= "011";
        wait for 10 ns;
        inputs <= "100";
        wait for 10 ns;
        inputs <= "101";
        wait for 10 ns;
        inputs <= "110";
        wait for 10 ns;
        inputs <= "111";
        wait;
    end process;
end Behavioral;
