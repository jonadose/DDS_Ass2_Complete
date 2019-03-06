----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.03.2019 20:13:11
-- Design Name: 
-- Module Name: AluRegStatemachine - Behavioral
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

entity AluRegStatemachine is
    Port ( ExternalInput : in STD_LOGIC_VECTOR (7 downto 0);
           Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Risc : in STD_LOGIC_VECTOR (3 downto 0);
           SimOutputA :out STD_LOGIC_Vector (7 downto 0);
           SimOutputB :out STD_LOGIC_Vector (7 downto 0);
           SimOutputC :out STD_LOGIC_Vector (7 downto 0);
           SimOutputD :out STD_LOGIC_Vector (7 downto 0)  
);
end AluRegStatemachine;


architecture structural of AluRegStatemachine is

component Programasm
Port
(
Reset : in STD_LOGIC;
Clk : in STD_LOGIC;
SelectAluOperation : out STD_LOGIC_Vector (1 downto 0);
WriteEnable : out STD_LOGIC;
SelectReg : out STD_LOGIC_Vector (1 downto 0);
AluInputSelectA : out STD_LOGIC_Vector (1 downto 0);
AluInputSelectB : out STD_LOGIC_Vector (1 downto 0);
ExternalLoadEnable : out STD_LOGIC;
Risc : in STD_LOGIC_Vector ( 3 downto 0);
Carry : out STD_LOGIC -- output to control the carryin signal
           
--Stateout : out std_logic_vector(3 downto 0); -- state output for observation
--PC_extra : out STD_LOGIC_VECTOR(3 downto 0); -- extra output for observation in simulation
--ASM_input_extra : out STD_LOGIC_VECTOR(3 downto 0) -- extra output for observation in simulation
);
end component;

component alu_8
Port
(
Ain : in STD_LOGIC_VECTOR (7 downto 0);
Bin : in STD_LOGIC_VECTOR (7 downto 0);
Carryin : in STD_LOGIC;
sel : in STD_LOGIC_VECTOR (1 downto 0);
Aluout : out STD_LOGIC_VECTOR (7 downto 0);
Carryout : out STD_LOGIC
);
end component;

component MainRegister
Port
(
OutputA : out STD_LOGIC_Vector (7 downto 0);
OutputB : out STD_LOGIC_Vector (7 downto 0);
InputAlu : in STD_LOGIC_Vector (7 downto 0);
InputExternal : in STD_LOGIC_Vector (7 downto 0);
OutputSelectA : in STD_LOGIC_Vector (1 downto 0);
OutputSelectB : in STD_LOGIC_Vector (1 downto 0);
RegSelect : in STD_LOGIC_Vector (1 downto 0);
ExternalLoadEnable : in STD_LOGIC;
clk : in STD_LOGIC;
WriteEnable : in STD_Logic;
Reset : in STD_LOGIC;
SimOutputA :out STD_LOGIC_Vector (7 downto 0);
SimOutputB :out STD_LOGIC_Vector (7 downto 0);
SimOutputC :out STD_LOGIC_Vector (7 downto 0);
SimOutputD :out STD_LOGIC_Vector (7 downto 0)
);
end component;


signal AluOutput : STD_LOGIC_VECTOR (7 downto 0);
signal ExternalWriteEnable : STD_LOGIC;
signal WriteSelect : STD_LOGIC_VECTOR (1 downto 0);
signal WriteEnable : STD_LOGIC;
signal ReadSelectA : STD_LOGIC_VECTOR (1 downto 0);
signal ReadSelectB : STD_LOGIC_VECTOR (1 downto 0);
signal ReadOutputA : STD_LOGIC_VECTOR (7 downto 0);
signal ReadOutputB : STD_LOGIC_VECTOR (7 downto 0);

signal AluOperationSelect : STD_LOGIC_VECTOR (1 downto 0);
signal CarryIn : STD_LOGIC;


begin

Alu : alu_8 Port Map
(Ain => ReadOutputA, Bin => ReadOutputB, Carryin => CarryIn, sel => AluOperationSelect, Aluout => AluOutput);
DataPart : MainRegister Port Map
(InputAlu => AluOutput, InputExternal => ExternalInput, OutputSelectA => ReadSelectA, OutputSelectB => ReadSelectB, 
RegSelect => WriteSelect, ExternalLoadEnable => ExternalWriteEnable, clk => clk, WriteEnable => WriteEnable, Reset => Reset, OutputA => ReadOutputA, OutputB => ReadOutputB,
SimOutputA => SimOutputA, SimOutputB => SimOutputB, SimOutputC => SimOutputC, SimOutputD => SimOutputD);
StateMachine : Programasm Port Map
(Reset => Reset, Clk => Clk, SelectAluOperation => AluOperationSelect, WriteEnable => WriteEnable, SelectReg => WriteSelect, AluInputSelectA => ReadSelectA,
AluInputSelectB => ReadSelectB, ExternalLoadEnable => ExternalWriteEnable, Carry => CarryIn, Risc => Risc);

end structural;
