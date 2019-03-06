----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.03.2019 20:48:31
-- Design Name: 
-- Module Name: AluRegStateMachineSim - Structural
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

entity AluRegStateMachineSim is
--  Port ( );
end AluRegStateMachineSim;

architecture Structural of AluRegStateMachineSim is

COMPONENT AluRegStateMachine 
Port ( ExternalInput : in STD_LOGIC_VECTOR (7 downto 0);
           Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Risc : in STD_LOGIC_VECTOR (3 downto 0);
           SimOutputA :out STD_LOGIC_Vector (7 downto 0);
           SimOutputB :out STD_LOGIC_Vector (7 downto 0);
           SimOutputC :out STD_LOGIC_Vector (7 downto 0);
           SimOutputD :out STD_LOGIC_Vector (7 downto 0)  ); 

END COMPONENT; 
--input
signal ExternalInput : STD_LOGIC_VECTOR (7 downto 0) := "00000000"  ;
signal Reset : STD_Logic := '0';
signal CLK : STD_LOGIC := '0'; 
Signal Risc : STD_LOGIC_VECTOR (3 downto 0) := "0000";


Signal SimOutputA:  STD_LOGIC_VECTOR (7 downto 0) := "00000000";
Signal SimOutputB:  STD_LOGIC_VECTOR (7 downto 0) := "00000000";
Signal SimOutputC:  STD_LOGIC_VECTOR (7 downto 0) := "00000000";
Signal SimOutputD:  STD_LOGIC_VECTOR (7 downto 0) := "00000000";

constant clk_period : time := 10ns; 

begin
uut: AluRegStateMachine Port Map (
ExternalInput=> ExternalInput, Reset => Reset, Clk => Clk, Risc => Risc, SimOutputA => SimoutputA, SimOutputB => SimoutputB, SimOutputC => SimoutputC,SimOutputD => SimoutputD);

clk_proc:process
begin
 clk<= '0';
 wait for clk_period/2;
 clk <= '1';
 wait for clk_period/2; 
 end process;
 
stim_proc:process
BEGIN
Wait for 100ns; 
Risc <= "0000";
Externalinput <= "00001111";
wait for 100ns; 
Risc <= "0001"; 
wait for 100Ns;


wait; 
end process;

end Structural;
