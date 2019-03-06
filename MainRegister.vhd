----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.03.2019 12:53:14
-- Design Name: 
-- Module Name: MainRegister - Behavioral
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

entity MainRegister is
    Port ( OutputA : out STD_LOGIC_Vector (7 downto 0);
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
           SimOutputD :out STD_LOGIC_Vector (7 downto 0));
end MainRegister;

architecture structual of MainRegister is

component RegSelectDemux 
Port(
OutputA : out STD_LOGIC;
OutputB : out STD_LOGIC;
OutputC : out STD_LOGIC;
OutputD : out STD_LOGIC;
WriteEnable : in STD_Logic;
SelectWrite : in STD_LOGIC_Vector (1 downto 0)   
);
end component;

component eightbitmultiplexer4to1 
Port(
InputA : in STD_LOGIC_Vector (7 downto 0);
InputB : in STD_LOGIC_Vector (7 downto 0);
InputC : in STD_LOGIC_Vector (7 downto 0);
InputD : in STD_LOGIC_Vector (7 downto 0);
Output : out STD_LOGIC_Vector (7 downto 0);
SelectLine : in STD_LOGIC_Vector (1 downto 0)
);
end component;

component SRegister 
Port(
clk : in STD_LOGIC;
Reset : in STD_LOGIC;
Enable : in STD_LOGIC;
Input : in STD_Logic_Vector (7 downto 0);
Output : out STD_Logic_Vector (7 downto 0);
SimOutput : out STD_Logic_Vector (7 downto 0)
);
end component;

component ExternalLoadMultiplexer 
Port(
ExternalInput : in STD_LOGIC_Vector (7 downto 0);
InputFromAlu : in STD_LOGIC_Vector (7 downto 0);
EnableExternalLoad : in STD_LOGIC;
DataToReg : out STD_LOGIC_Vector (7 downto 0)
);
end component;

signal InputDataToReg : STD_LOGIC_Vector (7 downto 0);


signal RegSelectA : STD_LOGIC;
signal RegSelectB : STD_LOGIC;
signal RegSelectC : STD_LOGIC;
signal RegSelectD : STD_LOGIC;

signal RegOutA : STD_LOGIC_Vector (7 downto 0);
signal RegOutB : STD_LOGIC_Vector (7 downto 0);
signal RegOutC : STD_LOGIC_Vector (7 downto 0);
signal RegOutD : STD_LOGIC_Vector (7 downto 0);


begin
En : ExternalLoadMultiplexer Port Map
(ExternalInput => InputExternal, InputFromAlu => InputAlu,EnableExternalLoad => ExternalLoadEnable,DataToReg =>InputDataToReg);

RegA : SRegister Port Map
(clk =>clk,Reset => Reset, Enable => RegSelectA, Input => InputDataToReg, Output => RegOutA, SimOutput => SimOutputA);
RegB : SRegister Port Map
(clk =>clk,Reset => Reset, Enable => RegSelectB, Input => InputDataToReg, Output => RegOutB, SimOutput => SimOutputB);
RegC : SRegister Port Map
(clk =>clk,Reset => Reset, Enable => RegSelectC, Input => InputDataToReg, Output => RegOutC, SimOutput => SimOutputC);
RegD : SRegister Port Map
(clk =>clk,Reset => Reset, Enable => RegSelectD, Input => InputDataToReg, Output => RegOutD, SimOutput => SimOutputD);

RegSelecter : RegSelectDemux Port Map
(WriteEnable => WriteEnable,SelectWrite => RegSelect, OutputA => RegSelectA, OutputB => RegSelectB, OutputC => RegSelectC,OutputD => RegSelectD);

MuxA : eightbitmultiplexer4to1 Port Map
(SelectLine => OutputSelectA,InputA => RegOutA, InputB => RegOutB, InputC => RegOutC, InputD => RegOutD, Output => OutputA );
MuxB : eightbitmultiplexer4to1 Port Map
(SelectLine => OutputSelectB,InputA => RegOutA,InputB => RegOutB, InputC => RegOutC, InputD => RegOutD, Output => OutputB );
end structual;

