----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/02/2018 10:57:44 PM
-- Design Name: 
-- Module Name: PC - Behavioral
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

entity PC is
  Port ( 
  input: in STD_LOGIC_VECTOR(15 downto 0);
  PI: in STD_LOGIC;
  PL: in STD_LOGIC;
  Clk : in std_logic;
  output: out STD_LOGIC_VECTOR(15 downto 0);
  reset: in STD_LOGIC
  );
end PC;

architecture Behavioral of PC is
component alu_16bit
Port(
    A : in STD_LOGIC_VECTOR(15 downto 0);
    B : in STD_LOGIC_VECTOR(15 downto 0);
    Cin : in STD_LOGIC;
    S0 : in STD_LOGIC;
    S1: in STD_LOGIC;
    S2: in STD_LOGIC;
    G : out STD_LOGIC_VECTOR(15 downto 0);
    V:out STD_LOGIC;
    Cout: out STD_LOGIC 
);
end component;

component reg4
port(
    D : in std_logic_vector(15 downto 0);
    load : in std_logic; 
    Clk : in std_logic;
    Q : out std_logic_vector(15 downto 0)
);
end component;

signal out_signal : STD_LOGIC_VECTOR(15 downto 0);
begin
pc_reg:reg4 port map(
D => input,
load => pl,
Clk => Clk,
Q => out_signal
);

adder:alu_16bit port map(
A => out_signal,
B => X"0000",
Cin => pi,
S0 => '0',
S1 => '0',
S2 => '0',
G => output
);

output <= X"0000" when reset = '1';

end Behavioral;
