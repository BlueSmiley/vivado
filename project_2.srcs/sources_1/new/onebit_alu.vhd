----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2018 02:40:50 PM
-- Design Name: 
-- Module Name: onebit_alu - Behavioral
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

entity onebit_alu is
Port ( 
    Cin :in STD_LOGIC;
    A: in STD_LOGIC;
    B: in STD_LOGIC;
    S0: in STD_LOGIC;
    S1: in STD_LOGIC;
    S2: in STD_LOGIC;
    Cout: out STD_LOGIC;
    G: out STD_LOGIC
);
end onebit_alu;

architecture Behavioral of onebit_alu is
    component onebit_au
    Port ( 
        S0 :in STD_LOGIC;
        S1 :in STD_LOGIC;
        A: in STD_LOGIC;
        B: in STD_LOGIC;
        Cin: in STD_LOGIC;
        Cout: out STD_LOGIC;
        G: out STD_LOGIC
     );
     end component;
     
     component onebit_lu
      Port (
          S0 :in STD_LOGIC;
          S1 :in STD_LOGIC;
          A: in STD_LOGIC;
          B:in STD_LOGIC;
          G: out STD_LOGIC
      );
      end component;
      
       COMPONENT onebit_mux2to1
         PORT(
         In0 : IN std_logic;
         In1 : IN std_logic;
         S : IN std_logic;
         Z : OUT std_logic
         );
         END COMPONENT;
         
         signal auout,luout : STD_LOGIC;
begin
    aunit: onebit_au port map(
    S0 =>S0,
    S1 =>S1,
    A => A,
    B => B,
    Cin => Cin,
    Cout => Cout,
    G => auout
    );
    
    lunit: onebit_lu port map(
    S0 =>S0,
    S1 =>S1,
    A => A,
    B => B,
    G => luout
    );
     
    logic_selector: onebit_mux2to1 port map(
    S => S2,
    In0 => auout,
    In1 => luout,
    Z => G
    );
     
end Behavioral;
