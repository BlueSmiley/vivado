----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/16/2018 10:33:12 AM
-- Design Name: 
-- Module Name: registerfiletb - Behavioral
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

entity registerfiletb is
--  Port ( );
end registerfiletb;

architecture Behavioral of registerfiletb is
    component Register_file
    Port ( src_s0 : in STD_LOGIC;
           src_s1 : in STD_LOGIC;
           src_s2 : in STD_LOGIC;
           des_A0 : in STD_LOGIC;
           des_A1 : in STD_LOGIC;
           des_A2 : in STD_LOGIC;
           Clk : in STD_LOGIC;
           data_src : in STD_LOGIC;
           data : in STD_LOGIC_VECTOR(15 downto 0);
           regout0 : out STD_LOGIC_VECTOR(15 downto 0);
           regout1 : out STD_LOGIC_VECTOR(15 downto 0);
           regout2 : out STD_LOGIC_VECTOR(15 downto 0);
           regout3 : out STD_LOGIC_VECTOR(15 downto 0);
           regout4 : out STD_LOGIC_VECTOR(15 downto 0);
           regout5 : out STD_LOGIC_VECTOR(15 downto 0);
           regout6 : out STD_LOGIC_VECTOR(15 downto 0);
           regout7 : out STD_LOGIC_VECTOR(15 downto 0)
         );
     end component;
     
     signal regout0,regout1,regout2,regout3,regout4,regout5,regout6,regout7 : std_logic_vector(15 downto 0);
     signal src_enable,des_enable : std_logic_vector(2 downto 0);
     signal data_src,Clk :std_logic;
     signal data:std_logic_vector(15 downto 0);    
begin
    UUT: Register_file port map(
    regout0 => regout0,
    regout1 => regout1,
    regout2 => regout2,
    regout3 => regout3,
    regout4 => regout4,
    regout5 => regout5,
    regout6 => regout6,
    regout7 => regout7,
    Clk => Clk,
    data_src => data_src,
    data => data,
    des_A0 => des_enable(0),
    des_A1 => des_enable(1),
    des_A2 => des_enable(2),
    src_s0 => src_enable(0),
    src_s1 => src_enable(1),
    src_s2 => src_enable(2)
    );
    
    process
    begin
        src_enable <= "000";
        des_enable <= "000";
        --both set to 0 at beginning
        data_src <= '0';
        --start with data transfer into every register
        data <= "0000000000000000";
        wait for 10 ns;
        des_enable <= "001";
        data <= "0000000000000001";
        wait for 10 ns;
        des_enable <= "010";
        data <= "0000000000000010";
        wait for 10 ns;
        des_enable <= "011";
        data <= "0000000000000011";
        wait for 10 ns;
        des_enable <= "100";
        data <= "0000000000000100";
        wait for 10 ns;
        des_enable <= "101";
        data <= "0000000000000101";
        wait for 10 ns;
        des_enable <= "110";
        data <= "0000000000000110";
        wait for 10 ns;
        des_enable <= "111";
        data <= "0000000000000111";        
        wait for 10 ns;
                
        data_src <= '1';
--now register transfer
        src_enable <= "001";
        des_enable <= "000";
        --transfer data from reg 1 to reg 0
        wait for 10 ns;
        src_enable <= "011";
        des_enable <= "010";
        --transfer data from reg 3 to reg 2
        wait for 10 ns;
        src_enable <= "101";
        des_enable <= "100";
        --transfer data from reg 5 to reg 4
        wait for 10 ns;        
    end process;
    
    process
        begin
        Clk <= '0';
        wait for 2 ns;
        Clk <= '1';
        wait for 2 ns;
    end process;
end Behavioral;
