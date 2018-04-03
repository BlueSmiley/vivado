----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/03/2018 02:35:49 PM
-- Design Name: 
-- Module Name: CAR - Behavioral
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

entity CAR is
  Port ( 
  control : in STD_LOGIC;
  input: in STD_LOGIC_VECTOR(7 downto 0);
  output : out STD_LOGIC_VECTOR(7 downto 0);
  reset : in STD_LOGIC;
  Clk  : in STD_LOGIC
  );
end CAR;

architecture Behavioral of CAR is
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

component mux2to1
port(
     In0 : in STD_LOGIC_VECTOR(15 downto 0);
    In1 : in STD_LOGIC_VECTOR(15 downto 0);
    S : in STD_LOGIC;
    Z : out STD_LOGIC_VECTOR(15 downto 0)
);
end component;

signal out_signal : STD_LOGIC_VECTOR(7 downto 0);
signal input_signal : STD_LOGIC_VECTOR(7 downto 0);
signal adder_result : STD_LOGIC_VECTOR(7 downto 0);
signal unused: STD_LOGIC_VECTOR(15 downto 8);
begin
CAR_reg:reg4 port map(
    D(7 downto 0) => input_signal,
    D(15 downto 8) => X"00",
    load => '1',
    Clk => Clk,
    Q(7 downto 0) => out_signal,
    Q(15 downto 8) => unused
);

adder:alu_16bit port map(
    A(7 downto 0) => out_signal,
    A (15 downto 8) => X"00",
    B => X"0000",
    Cin => '1',
    S0 => '0',
    S1 => '0',
    S2 => '0',
    G(7 downto 0) => adder_result,
    G(15 downto 8) => unused
);

mux:mux2to1 port map(
    In0(7 downto 0) => adder_result(7 downto 0),
    In0(15 downto 8) => X"00",
    In1(7 downto 0) => input(7 downto 0),
    In1(15 downto 8) => X"00",
    S => control,
    Z(7 downto 0) => input_signal,
    Z(15 downto 8) => unused
);

output <= X"00" when reset = '1' else input_signal;

end Behavioral;
