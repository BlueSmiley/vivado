----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2018 05:25:32 PM
-- Design Name: 
-- Module Name: shifter_unit - Behavioral
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

entity shifter_unit is
Port (
    IR:in STD_LOGIC;
    IL:in STD_LOGIC;
    S:in STD_LOGIC_VECTOR(1 downto 0);
    B: in STD_LOGIC_VECTOR(15 downto 0);
    H:out STD_LOGIC_VECTOR(15 downto 0)
);
end shifter_unit;

architecture Behavioral of shifter_unit is

    component onebit_mux3to1
    port(
     In0 : in STD_LOGIC;
     In1 : in STD_LOGIC;
     In2 : in STD_LOGIC;
     S0 : in STD_LOGIC;
     S1:in STD_LOGIC;
     Z : out STD_LOGIC
   );
   end component;
   
begin
    mux0:onebit_mux3to1 port map(
    In0 => B(0),
    In1 => B(1),
    In2 => IL,
    S0 => s(0),
    S1 => S(1),
    Z => H(0)
    );

    mux1:onebit_mux3to1 port map(
    In0 => B(1),
    In1 => B(2),
    In2 => B(0),
    S0 => s(0),
    S1 => S(1),
    Z => H(1)
    );

    mux2:onebit_mux3to1 port map(
    In0 => B(2),
    In1 => B(3),
    In2 => B(1),
    S0 => s(0),
    S1 => S(1),
    Z => H(2)
    );

    mux3:onebit_mux3to1 port map(
    In0 => B(3),
    In1 => B(4),
    In2 => B(2),
    S0 => s(0),
    S1 => S(1),
    Z => H(3)
    );

    mux4:onebit_mux3to1 port map(
    In0 => B(4),
    In1 => B(5),
    In2 => B(3),
    S0 => s(0),
    S1 => S(1),
    Z => H(4)
    );

    mux5:onebit_mux3to1 port map(
    In0 => B(5),
    In1 => B(6),
    In2 => B(4),
    S0 => s(0),
    S1 => S(1),
    Z => H(5)
    );

    mux6:onebit_mux3to1 port map(
    In0 => B(6),
    In1 => B(7),
    In2 => B(5),
    S0 => s(0),
    S1 => S(1),
    Z => H(6)
    );

    mux7:onebit_mux3to1 port map(
    In0 => B(7),
    In1 => B(8),
    In2 => B(6),
    S0 => s(0),
    S1 => S(1),
    Z => H(7)
    );

    mux8:onebit_mux3to1 port map(
    In0 => B(8),
    In1 => B(9),
    In2 => B(7),
    S0 => s(0),
    S1 => S(1),
    Z => H(8)
    );

    mux9:onebit_mux3to1 port map(
    In0 => B(9),
    In1 => B(10),
    In2 => B(8),
    S0 => s(0),
    S1 => S(1),
    Z => H(9)
    );

    mux10:onebit_mux3to1 port map(
    In0 => B(10),
    In1 => B(11),
    In2 => B(9),
    S0 => s(0),
    S1 => S(1),
    Z => H(10)
    );

    mux11:onebit_mux3to1 port map(
    In0 => B(11),
    In1 => B(12),
    In2 => B(10),
    S0 => s(0),
    S1 => S(1),
    Z => H(11)
    );

    mux12:onebit_mux3to1 port map(
    In0 => B(12),
    In1 => B(13),
    In2 => B(11),
    S0 => s(0),
    S1 => S(1),
    Z => H(12)
    );

    mux13:onebit_mux3to1 port map(
    In0 => B(13),
    In1 => B(14),
    In2 => B(12),
    S0 => s(0),
    S1 => S(1),
    Z => H(13)
    );

    mux14:onebit_mux3to1 port map(
    In0 => B(14),
    In1 => B(15),
    In2 => B(13),
    S0 => s(0),
    S1 => S(1),
    Z => H(14)
    );

    mux15:onebit_mux3to1 port map(
    In0 => B(15),
    In1 => IR,
    In2 => B(14),
    S0 => s(0),
    S1 => S(1),
    Z => H(15)
    );

end Behavioral;
