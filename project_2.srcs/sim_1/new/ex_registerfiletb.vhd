----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/13/2018 11:12:07 AM
-- Design Name: 
-- Module Name: ex_registerfiletb - Behavioral
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

entity ex_registerfiletb is
--  Port ( );
end ex_registerfiletb;

architecture Behavioral of ex_registerfiletb is
component ex_registerfile is
 Port ( 
 Clk : in STD_LOGIC;
 constantin:in STD_LOGIC_VECTOR(15 downto 0);
 RW: in STD_LOGIC;
 MD: in STD_LOGIC;
 FS: in STD_LOGIC_VECTOR(4 downto 0);
 MB: in STD_LOGIC;
 BA: in STD_LOGIC_VECTOR(2 downto 0);
 AA:in STD_LOGIC_VECTOR(2 downto 0);
 DA:in STD_LOGIC_VECTOR(2 downto 0);
 V:out STD_LOGIC;
 C:out STD_LOGIC;
 N:out STD_LOGIC;
 Z:out STD_LOGIC;
 addrout:out STD_LOGIC_VECTOR(15 downto 0);
 dataout:out STD_LOGIC_VECTOR(15 downto 0)
 );
 end component;
 signal control:STD_LOGIC_VECTOR(16 downto 0);
 signal V,C,N,Z,Clk: STD_LOGIC;
 signal constantin,addrout,dataout: STD_LOGIC_VECTOR(15 downto 0);
 
begin

UUT: ex_registerfile port map(
Clk => Clk,
Z => Z,
C => C,
N => N,
V => V,
addrout => addrout,
dataout => dataout,
constantin => constantin,
Rw => control(0),
MD => control(1),
FS => control(6 downto 2),
MB => control(7),
BA => control(10 downto 8),
AA => control(13 downto 11),
DA => control(16 downto 14)
);

process
begin
constantin <= "0000001000001010";
control <= "01000100010000001";
wait for 50 ns;
end process;

    process
        begin
        Clk <= '0';
        wait for 2 ns;
        Clk <= '1';
        wait for 2 ns;
    end process;
end Behavioral;
