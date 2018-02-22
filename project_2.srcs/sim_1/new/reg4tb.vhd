----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2018 06:55:06 PM
-- Design Name: 
-- Module Name: reg4tb - Behavioral
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

entity reg4tb is
--  Port ( );
end reg4tb;

architecture Behavioral of reg4tb is
    component reg4
    port ( 
        D : in std_logic_vector(15 downto 0);
        load : in std_logic; 
        Clk : in std_logic;
        Q : out std_logic_vector(15 downto 0));
    end component;
    
    signal load,Clk : std_logic;
    signal D,Q : std_logic_vector(15 downto 0);
begin
    UUT: reg4 port map(
    load => load,
    Clk => Clk,
    D => D,
    Q => Q
    );
    
    process
    begin
    load <= '0';
    D <= "0000000000000000";
    wait for 10 ns;
    load <= '1';
    wait for 10 ns;
    load <= '0';
    wait for 10 ns;
    D <= "0000000000000001";
    wait for 10 ns;
    load <= '1';
    wait for 10 ns;
    --point is to show only transitions to d when load = one 
    end process;
    
    process
    begin
    Clk <= '0';
    wait for 2 ns;
    Clk <= '1';
    wait for 2 ns;
    end process;
    
end Behavioral;
