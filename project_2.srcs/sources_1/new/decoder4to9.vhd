----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/28/2018 12:01:12 PM
-- Design Name: 
-- Module Name: decoder4to9 - Behavioral
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

entity decoder4to9 is
Port ( A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           A3 : in STD_LOGIC;
           Q0 : out STD_LOGIC;
           Q1 : out STD_LOGIC;
           Q2 : out STD_LOGIC;
           Q3 : out STD_LOGIC;
           Q4 : out STD_LOGIC;
           Q5 : out STD_LOGIC;
           Q6 : out STD_LOGIC;
           Q7 : out STD_LOGIC;
           Q8 : out STD_LOGIC);
end decoder4to9;

architecture Behavioral of decoder4to9 is

begin
Q0 <= ((not A0) and (not A1) and (not A2) and (not A3)) after 5 ns;
Q1 <= (A0 and (not A1) and (not A2) and (not A3)) after 5 ns;
Q2 <= ((not A0) and A1 and (not A2) and (not A3)) after 5 ns;
Q3 <= (A0 and A1 and (not A2) and (not A3)) after 5 ns;
Q4 <= ((not A0) and (not A1) and A2 and (not A3)) after 5 ns;
Q5 <= (A0 and (not A1) and A2 and (not A3)) after 5 ns;
Q6 <= ((not A0) and A1 and A2 and (not A3)) after 5 ns;
Q7 <= (A0 and A1 and A2 and (not A3)) after 5 ns;
Q8 <= A3 after 5ns;

end Behavioral;
