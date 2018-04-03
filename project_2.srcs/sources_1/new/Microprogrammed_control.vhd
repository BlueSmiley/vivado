----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/03/2018 03:39:27 PM
-- Design Name: 
-- Module Name: Microprogrammed_control - Behavioral
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

entity Microprogrammed_control is
  Port ( 
  IRin : in STD_LOGIC_VECTOR(15 downto 0);
  V: in STD_LOGIC;
  N: in STD_LOGIC;
  C: in STD_LOGIC;
  Z: in STD_LOGIC;
  Reset: in STD_LOGIC;
  Clk : in STD_LOGIC;
  PCout : out STD_LOGIC_VECTOR(15 downto 0);
  DR : out  STD_LOGIC_VECTOR (2 downto 0);
  SA : out  STD_LOGIC_VECTOR (2 downto 0);
  SB : out  STD_LOGIC_VECTOR (2 downto 0);
  TD : out  STD_LOGIC;
  TA : out  STD_LOGIC;
  TB : out  STD_LOGIC;
  MB : out  STD_LOGIC;
  FS : out  STD_LOGIC_VECTOR (4 downto 0);
  MD : out  STD_LOGIC;
  RW : out  STD_LOGIC;
  MM : out  STD_LOGIC;
  MW : out STD_LOGIC
  );
end Microprogrammed_control;

architecture Behavioral of Microprogrammed_control is
component CAR
port(
  control : in STD_LOGIC;
  input: in STD_LOGIC_VECTOR(7 downto 0);
  output : out STD_LOGIC_VECTOR(7 downto 0);
  reset : in STD_LOGIC;
  Clk  : in STD_LOGIC
);
end component;

component PC
port(
  input: in STD_LOGIC_VECTOR(15 downto 0);
  PI: in STD_LOGIC;
  PL: in STD_LOGIC;
  Clk : in std_logic;
  output: out STD_LOGIC_VECTOR(15 downto 0);
  reset: in STD_LOGIC
);
end component;

component IR
port(
   input : in  STD_LOGIC_VECTOR (15 downto 0);
   IL : in  STD_LOGIC;
   Clk : in STD_LOGIC;
   Opcode : out  STD_LOGIC_VECTOR (6 downto 0);
   DR : out  STD_LOGIC_VECTOR (2 downto 0);
   SA : out  STD_LOGIC_VECTOR (2 downto 0);
   SB : out STD_LOGIC_VECTOR (2 downto 0)
);
end component;

component control_memory
port(
    MW : out std_logic;
    MM : out std_logic;
    RW : out std_logic;
    MD : out std_logic;
    FS : out std_logic_vector(4 downto 0);
    MB : out std_logic;
    TB : out std_logic;
    TA : out std_logic;
    TD : out std_logic;
    PL : out std_logic;
    PI : out std_logic;
    IL : out std_logic;
    MC : out std_logic;
    MS : out std_logic_vector(2 downto 0);
    NA : out std_logic_vector(7 downto 0);
    input : in std_logic_vector(7 downto 0)
);
end component;

component extend
port(
    DR: in STD_LOGIC_VECTOR(2 downto 0);
    SB: in STD_LOGIC_VECTOR(2 downto 0);
    output: out STD_LOGIC_VECTOR(15 downto 0)
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

component mux8to1
--  Port ( );
    Port ( 
         In0 : in STD_LOGIC_VECTOR(15 downto 0);
         In1 : in STD_LOGIC_VECTOR(15 downto 0);
         In2 : in STD_LOGIC_VECTOR(15 downto 0);
         In3 : in STD_LOGIC_VECTOR(15 downto 0);
         In4 : in STD_LOGIC_VECTOR(15 downto 0);
         In5 : in STD_LOGIC_VECTOR(15 downto 0);
         In6 : in STD_LOGIC_VECTOR(15 downto 0);
         In7 : in STD_LOGIC_VECTOR(15 downto 0);
         S0 : in STD_LOGIC;
         S1 : in STD_LOGIC;
         S2 : in STD_LOGIC;
         Z : out STD_LOGIC_VECTOR(15 downto 0)
         );
end component;

signal DR_in,SB_in,SA_in,MS : std_logic_vector(2 downto 0);
signal extend_out : std_logic_vector(15 downto 0);
signal PI,PL,notC,notZ,muxSout,IL,MC : std_logic;
signal opcode : std_logic_vector(6 downto 0);
signal NA,muxCout,CARout : std_logic_vector(7 downto 0);
begin
DR <= DR_in;
SB <= SB_in;
SA <= SA_in; 
notC <= not C;
notZ <= not Z;

bit_extend: extend port map(
DR => DR_in,
SB => SB_in,
output => extend_out
);

program_counter: pc port map(
input => extend_out,
reset => reset,
Clk => Clk,
PI => PI,
PL => PL,
output => PCout
);

muxS: mux8to1 port map(
In0(0) => '0',
In0(15 downto 1) => "000000000000000",
In1(0) => '1',
In1(15 downto 1) => "000000000000000",
In2(0) => C,
In2(15 downto 1) => "000000000000000",
In3(0) => V,
In3(15 downto 1) => "000000000000000",
In4(0) => Z,
In4(15 downto 1) => "000000000000000",
In5(0) => N,
In5(15 downto 1) => "000000000000000",
In6(0) => notC,
In6(15 downto 1) => "000000000000000",
In7(0) => notZ,
In7(15 downto 1) => "000000000000000",
S0 =>  MS(0),
S1 => MS(1),
S2 => MS(2),
Z(0) => muxSout,
Z(15 downto 1) => "000000000000000"
);

instruction_register: IR port map(
input => IRin,
IL => IL,
CLk => CLK,
opcode => opcode,
DR => DR_in,
SA => SA_in,
SB => SB_in
);

muxC: mux2to1 port map(
In0(7 downto 0) => NA,
In0(15 downto 8) => "00000000",
In1(6 downto 0) => opcode,
In1(7) => '0',
In1(15 downto 8) => "00000000",
S => MC,
Z(7 downto 0) => muxCout,
Z(15 downto 8) => "00000000"
);

control_address_register: CAR port map(
input => muxCout,
reset => reset,
Clk => Clk,
control => muxSout,
output => CARout
);

memory: control_memory port map(
MW => MW,
MM => MM,
RW => RW,
MD => MD,
FS => FS,
MB => MB,
TB => TB,
TA => TA,
TD => TD,
PL => PL,
PI => PI,
IL => IL,
MC => MC,
MS => MS,
NA => NA,
input => CARout
);

end Behavioral;
