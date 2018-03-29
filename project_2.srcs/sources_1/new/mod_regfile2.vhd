----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/28/2018 12:10:54 PM
-- Design Name: 
-- Module Name: mod_regfile2 - Behavioral
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

entity mod_regfile2 is
Port ( 
           src_A : in STD_LOGIC_Vector(3 downto 0);
           src_B : in STD_LOGIC_Vector(3 downto 0);
           resA : out STD_LOGIC_VECTOR(15 downto 0);
           resB : out STD_LOGIC_VECTOR(15 downto 0);
           des_A : in STD_LOGIC_Vector(3 downto 0);
           RW:in STD_LOGIC;
           Clk : in STD_LOGIC;
           data_src : in STD_LOGIC;
           data : in STD_LOGIC_VECTOR(15 downto 0);
           src_reg: in STD_LOGIC_VECTOR(15 downto 0)
           
         );
end mod_regfile2;

architecture Behavioral of mod_regfile2 is
    COMPONENT reg4
    PORT(
    D : IN std_logic_vector(15 downto 0);
    load : IN std_logic;
    Clk : IN std_logic;
    Q : OUT std_logic_vector(15 downto 0)
    );
    END COMPONENT;
    
    component decoder4to9
    Port ( A0 : in STD_LOGIC;
               A1 : in STD_LOGIC;
               A2 : in STD_LOGIC;
               A3 : in STD_LOGIC;
               Q0 : out STD_LOGIC;
               Q1 : out STD_LOGIC;
               Q2 : out STD_LOGIC;
               Q3 : out STD_LOGIC;
               Q4 : out STD_LOGIC;
               Q5 : out STD_LOGIC;
               Q6 : out STD_LOGIC;
               Q7 : out STD_LOGIC;
               Q8 : out STD_LOGIC);
    end component;
    
     -- 2 to 1 line multiplexer
       COMPONENT mux2to1
       PORT(
       In0 : IN std_logic_vector(15 downto 0);
       In1 : IN std_logic_vector(15 downto 0);
       S : IN std_logic;
       Z : OUT std_logic_vector(15 downto 0)
       );
       END COMPONENT;
       
       component mux9to1
       Port ( 
               In0 : in STD_LOGIC_VECTOR(15 downto 0);
               In1 : in STD_LOGIC_VECTOR(15 downto 0);
               In2 : in STD_LOGIC_VECTOR(15 downto 0);
               In3 : in STD_LOGIC_VECTOR(15 downto 0);
               In4 : in STD_LOGIC_VECTOR(15 downto 0);
               In5 : in STD_LOGIC_VECTOR(15 downto 0);
               In6 : in STD_LOGIC_VECTOR(15 downto 0);
               In7 : in STD_LOGIC_VECTOR(15 downto 0);
               In8 : in STD_LOGIC_VECTOR(15 downto 0);
               S0 : in STD_LOGIC;
               S1 : in STD_LOGIC;
               S2 : in STD_LOGIC;
               S3 : in STD_LOGIC;
               Z : out STD_LOGIC_VECTOR(15 downto 0));
       end component;
       
       signal load_reg0, load_reg1, load_reg2, load_reg3, load_reg4, load_reg5, load_reg6, load_reg7,load_reg8 : std_logic;
       signal load_reg0x, load_reg1x, load_reg2x, load_reg3x, load_reg4x, load_reg5x, load_reg6x, load_reg7x,load_reg8x : std_logic;
       signal reg0_q, reg1_q, reg2_q, reg3_q,reg4_q, reg5_q, reg6_q, reg7_q,reg8_q,data_src_mux_out : std_logic_vector(15 downto 0);
begin
    load_reg0 <= load_reg0x and RW;
    load_reg1 <= load_reg1x and RW;
    load_reg2 <= load_reg2x and RW;
    load_reg3 <= load_reg3x and RW;
    load_reg4 <= load_reg4x and RW;
    load_reg5 <= load_reg5x and RW;
    load_reg6 <= load_reg6x and RW;
    load_reg7 <= load_reg7x and RW;
    load_reg8 <= load_reg8x and RW;
    
    reg00: reg4 PORT MAP(
    D => data_src_mux_out,
    load => load_reg0,
    Clk => Clk,
    Q => reg0_q
    );
    
-- register 1
    reg01: reg4 PORT MAP(
    D => data_src_mux_out,
    load => load_reg1,
    Clk => Clk,
    Q => reg1_q
    );  

--register 2    
    reg02: reg4 PORT MAP(
    D => data_src_mux_out,
    load => load_reg2,
    Clk => Clk,
    Q => reg2_q
    );
-- register 3
    reg03: reg4 PORT MAP(
    D => data_src_mux_out,
    load => load_reg3,
    Clk => Clk,
    Q => reg3_q
    );
    
    reg04: reg4 PORT MAP(
    D => data_src_mux_out,
    load => load_reg4,
    Clk => Clk,
    Q => reg4_q
    );
    
-- register 5
    reg05: reg4 PORT MAP(
    D => data_src_mux_out,
    load => load_reg5,
    Clk => Clk,
    Q => reg5_q
    );  

--register 6   
    reg06: reg4 PORT MAP(
    D => data_src_mux_out,
    load => load_reg6,
    Clk => Clk,
    Q => reg6_q
    );
    
-- register 7
    reg07: reg4 PORT MAP(
    D => data_src_mux_out,
    load => load_reg7,
    Clk => Clk,
    Q => reg7_q
    );
    
-- register 8
    reg08: reg4 PORT MAP(
    D => data_src_mux_out,
    load => load_reg8,
    Clk => Clk,
    Q => reg8_q
   );
   
   -- Destination register decoder
       des_decoder_4to9: decoder4to9 PORT MAP(
       A0 => des_A(0),
       A1 => des_A(1),
       A2 => des_A(2),
       A3 => des_A(3),
       Q0 => load_reg0x,
       Q1 => load_reg1x,
       Q2 => load_reg2x,
       Q3 => load_reg3x,
       Q4 => load_reg4x,
       Q5 => load_reg5x,
       Q6 => load_reg6x,
       Q7 => load_reg7x,
       Q8 => load_reg8x
       );
       
-- 2 to 1 Data source multiplexer
       data_src_mux2to1: mux2to1 PORT MAP(
       In0 => data,
       In1 => src_reg,
       S => data_src,
       Z => data_src_mux_out
       ); 
       
-- 4 to 1 source register multiplexer
           Inst_mux9to1A: mux9to1 PORT MAP(
           In0 => reg0_q,
           In1 => reg1_q,
           In2 => reg2_q,
           In3 => reg3_q,
           In4 => reg4_q,
           In5 => reg5_q,
           In6 => reg6_q,
           In7 => reg7_q,
           In8 => reg8_q,
           S0 => src_A(0),
           S1 => src_A(1),
           S2 => src_A(2),
           S3 => src_A(3),
           Z => resA
           );
           
           Inst_mux9to1B: mux9to1 PORT MAP(
           In0 => reg0_q,
           In1 => reg1_q,
           In2 => reg2_q,
           In3 => reg3_q,
           In4 => reg4_q,
           In5 => reg5_q,
           In6 => reg6_q,
           In7 => reg7_q,
           In8 => reg8_q,
           S0 => src_B(0),
           S1 => src_B(1),
           S2 => src_B(2),
           S3 => src_B(3),
           Z => resB
           );
    

end Behavioral;
