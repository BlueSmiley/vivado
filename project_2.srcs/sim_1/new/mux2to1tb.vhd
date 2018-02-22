----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2018 06:02:13 PM
-- Design Name: 
-- Module Name: mux2to1tb - Behavioral
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

entity mux2to1tb is
--  Port ( );
end mux2to1tb;

architecture Behavioral of mux2to1tb is
    component mux2to1
        Port ( 
               In0 : in STD_LOGIC_VECTOR(15 downto 0);
               In1 : in STD_LOGIC_VECTOR(15 downto 0);
               S : in STD_LOGIC;
               Z : out STD_LOGIC_VECTOR(15 downto 0));
     end component;
     
     signal In0,In1,Z : std_logic_vector ( 15 downto 0);
     signal S: std_logic;

begin
    UUT:mux2to1 port map (
    In0 => In0,
    In1 => In1,
    S => S,
    Z => Z
    );
    
    process
    begin
        In0 <= "0000000000000001";
        In1 <= "0000000000000010";
        S <= '0';
        wait for 10 ns;
        S <= '1';
        wait for 10 ns;
        wait;
        
    end process;

end Behavioral;
