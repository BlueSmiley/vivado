----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2018 02:59:22 PM
-- Design Name: 
-- Module Name: alu_16bit - Behavioral
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

entity alu_16bit is
 Port (
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
end alu_16bit;

architecture Behavioral of alu_16bit is
    component onebit_alu
    Port(
     Cin :in STD_LOGIC;
     A: in STD_LOGIC;
     B: in STD_LOGIC;
     S0: in STD_LOGIC;
     S1: in STD_LOGIC;
     S2: in STD_LOGIC;
     Cout: out STD_LOGIC;
     G: out STD_LOGIC
     );
     end component;
     
     signal carry:STD_LOGIC_VECTOR(15 downto 0);
     signal overflow:STD_LOGIC;
     
begin
    alu0:onebit_alu port map(
    Cin => Cin,
    A => A(0),
    B => B(0),
    S0 => S0,
    S1 => S1,
    S2 => S2,
    Cout => carry(0),
    G => G(0)
    );
    
    alu1:onebit_alu port map(
    Cin => carry(0),
    A => A(1),
    B => B(1),
    S0 => S0,
    S1 => S1,
    S2 => S2,
    Cout => carry(1),
    G => G(1)
    );
    
    alu2:onebit_alu port map(
    Cin => carry(1),
    A => A(2),
    B => B(2),
    S0 => S0,
    S1 => S1,
    S2 => S2,
    Cout => carry(2),
    G => G(2)
    );
    
    alu3:onebit_alu port map(
    Cin => carry(2),
    A => A(3),
    B => B(3),
    S0 => S0,
    S1 => S1,
    S2 => S2,
    Cout => carry(3),
    G => G(3)
    );
    
    alu4:onebit_alu port map(
    Cin => carry(3),
    A => A(4),
    B => B(4),
    S0 => S0,
    S1 => S1,
    S2 => S2,
    Cout => carry(4),
    G => G(4)
    );
    
    alu5:onebit_alu port map(
    Cin => carry(4),
    A => A(5),
    B => B(5),
    S0 => S0,
    S1 => S1,
    S2 => S2,
    Cout => carry(5),
    G => G(5)
    );
    
    alu6:onebit_alu port map(
    Cin => carry(5),
    A => A(6),
    B => B(6),
    S0 => S0,
    S1 => S1,
    S2 => S2,
    Cout => carry(6),
    G => G(6)
    );
    
    alu7:onebit_alu port map(
    Cin => carry(6),
    A => A(7),
    B => B(7),
    S0 => S0,
    S1 => S1,
    S2 => S2,
    Cout => carry(7),
    G => G(7)
    );
    
    alu8:onebit_alu port map(
    Cin => carry(7),
    A => A(8),
    B => B(8),
    S0 => S0,
    S1 => S1,
    S2 => S2,
    Cout => carry(8),
    G => G(8)
    );
    
    alu9:onebit_alu port map(
    Cin => carry(8),
    A => A(9),
    B => B(9),
    S0 => S0,
    S1 => S1,
    S2 => S2,
    Cout => carry(9),
    G => G(9)
    );
    
    alu10:onebit_alu port map(
    Cin => carry(9),
    A => A(10),
    B => B(10),
    S0 => S0,
    S1 => S1,
    S2 => S2,
    Cout => carry(10),
    G => G(10)
    );
    
    alu11:onebit_alu port map(
    Cin => carry(10),
    A => A(11),
    B => B(11),
    S0 => S0,
    S1 => S1,
    S2 => S2,
    Cout => carry(11),
    G => G(11)
    );
    
    alu12:onebit_alu port map(
    Cin => carry(11),
    A => A(12),
    B => B(12),
    S0 => S0,
    S1 => S1,
    S2 => S2,
    Cout => carry(12),
    G => G(12)
    );
    
    alu13:onebit_alu port map(
    Cin => carry(12),
    A => A(13),
    B => B(13),
    S0 => S0,
    S1 => S1,
    S2 => S2,
    Cout => carry(13),
    G => G(13)
    );
    
    alu14:onebit_alu port map(
    Cin => carry(13),
    A => A(14),
    B => B(14),
    S0 => S0,
    S1 => S1,
    S2 => S2,
    Cout => carry(14),
    G => G(14)
    );
    
    alu15:onebit_alu port map(
    Cin => carry(14),
    A => A(15),
    B => B(15),
    S0 => S0,
    S1 => S1,
    S2 => S2,
    Cout => carry(15),
    G => G(15)
    );
    
    V <= carry(14) XOR carry(15) after 1 ns;
    Cout <= carry(15);
    

end Behavioral;
