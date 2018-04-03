----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/03/2018 02:55:46 PM
-- Design Name: 
-- Module Name: IR - Behavioral
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

entity IR is
 Port (
        input : in  STD_LOGIC_VECTOR (15 downto 0);
        IL : in  STD_LOGIC;
        Clk : in STD_LOGIC;
        Opcode : out  STD_LOGIC_VECTOR (6 downto 0);
        DR : out  STD_LOGIC_VECTOR (2 downto 0);
        SA : out  STD_LOGIC_VECTOR (2 downto 0);
        SB : out STD_LOGIC_VECTOR (2 downto 0)
  );
end IR;

architecture Behavioral of IR is

signal out_signal : STD_LOGIC_VECTOR(15 downto 0);

component reg4
port(
    D : in std_logic_vector(15 downto 0);
    load : in std_logic; 
    Clk : in std_logic;
    Q : out std_logic_vector(15 downto 0)
);
end component;

begin
IR_reg:reg4 port map(
    D => input,
    load => IL,
    Clk => Clk,
    Q => out_signal
);

	Opcode<=out_signal(15 downto 9);
	DR<=out_signal(8 downto 6);
	SA<=out_signal(5 downto 3);
    SB<=out_signal(2 downto 0);

end Behavioral;
