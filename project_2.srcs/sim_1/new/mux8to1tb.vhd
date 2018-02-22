----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2018 06:19:50 PM
-- Design Name: 
-- Module Name: mux8to1tb - Behavioral
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

entity mux8to1tb is
--  Port ( );
end mux8to1tb;

architecture Behavioral of mux8to1tb is
    component mux8to1
        Port ( 
             In0 : in STD_LOGIC_VECTOR(15 downto 0);
             In1 : in STD_LOGIC_VECTOR(15 downto 0);
             In2 : in STD_LOGIC_VECTOR(15 downto 0);
             In3 : in STD_LOGIC_VECTOR(15 downto 0);
             In4 : in STD_LOGIC_VECTOR(15 downto 0);
             In5 : in STD_LOGIC_VECTOR(15 downto 0);
             In6 : in STD_LOGIC_VECTOR(15 downto 0);
             In7 : in STD_LOGIC_VECTOR(15 downto 0);
             S0 : in STD_LOGIC;
             S1 : in STD_LOGIC;
             S2 : in STD_LOGIC;
             Z : out STD_LOGIC_VECTOR(15 downto 0));
    end component;
    
    signal In0,In1,In2,In3,In4,In5,In6,In7,Z : std_logic_vector(15 downto 0);
    signal enable : std_logic_vector(2 downto 0);
begin
    UUT:mux8to1 port map(
    In0 => In0,
    In1 => In1,
    In2 => In2,
    In3 => In3,
    In4 => In4,
    In5 => In5,
    In6 => In6,
    In7 => In7,
    S0 => enable(0),
    S1 => enable(1),
    S2 => enable(2),
    Z => Z
    );
    
    process
    begin
        In0 <= "0000000000000001";
        In1 <= "0000000000000010";
        In2 <= "0000000000000011";
        In3 <= "0000000000000100";
        In4 <= "0000000000000101";
        In5 <= "0000000000000110";
        In6 <= "0000000000000111";
        In7 <= "0000000000001000";
        enable <= "000";
        wait for 10 ns;
        enable <= "000";
        wait for 10 ns;
        enable <= "001";
        wait for 10 ns;
        enable <= "010";
        wait for 10 ns; 
        enable <= "011";
        wait for 10 ns;
        enable <= "100";
        wait for 10 ns;
        enable <= "101";
        wait for 10 ns;
        enable <= "110";
        wait for 10 ns; 
        enable <= "111";
        wait for 10 ns;                              
    end process;

end Behavioral;
