----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2018 11:26:16 AM
-- Design Name: 
-- Module Name: onebit_au - Behavioral
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

entity onebit_au is
 Port ( 
    S0 :in STD_LOGIC;
    S1 :in STD_LOGIC;
    A: in STD_LOGIC;
    B: in STD_LOGIC;
    Cin: in STD_LOGIC;
    Cout: out STD_LOGIC;
    G: out STD_LOGIC
 );
end onebit_au;

architecture Behavioral of onebit_au is
    COMPONENT onebit_mux2to1
    PORT(
    In0 : IN std_logic;
    In1 : IN std_logic;
    S : IN std_logic;
    Z : OUT std_logic
    );
    END COMPONENT;
    
    component full_adder
     Port (
     A : in STD_LOGIC;
     B : in STD_LOGIC;
     Cin : in STD_LOGIC;
     S : out STD_LOGIC;
     Cout : out STD_LOGIC);
    end component;
    
    signal Y:STD_LOGIC;
begin
    in_mux:onebit_mux2to1 port map(
    In0 => S1,
    In1 => S0,
    S => B,
    Z => Y
    );
    
    adder:full_adder port map(
    A=>A,
    B=>Y,
    Cin => Cin,
    S => G,
    Cout => Cout
    );

end Behavioral;
