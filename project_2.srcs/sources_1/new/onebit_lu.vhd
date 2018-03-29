----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2018 02:18:40 PM
-- Design Name: 
-- Module Name: onebit_lu - Behavioral
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

entity onebit_lu is
  Port (
      S0 :in STD_LOGIC;
      S1 :in STD_LOGIC;
      A: in STD_LOGIC;
      B:in STD_LOGIC;
      G: out STD_LOGIC
  );
end onebit_lu;

architecture Behavioral of onebit_lu is
    COMPONENT onebit_4to1mux
    PORT(
           In0 : in STD_LOGIC;
           In1 : in STD_LOGIC;
           In2 : in STD_LOGIC;
           In3 : in STD_LOGIC;
           S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           Z : out STD_LOGIC
    );
    END COMPONENT;
    
    signal In0,In1,In2,In3 : STD_LOGIC;
    
begin
    In0 <= A AND B after 1 ns;
    In1 <= A OR B after 1 ns;
    In2 <= A XOR B after 1 ns;
    In3 <= NOT A after 1 ns;
    
    mux_logic:onebit_4to1mux port map(
    In0 => In0,
    In1 => In1,
    In2 => In2,
    In3 => In3,
    S0 => S0,
    S1 => S1,
    Z => G
    );

end Behavioral;
