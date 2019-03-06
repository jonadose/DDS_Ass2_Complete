----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.02.2019 15:47:04
-- Design Name: 
-- Module Name: alu_sim - Structural
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

entity alu_sim is
--  Port ( );
end alu_sim;

architecture Structural of alu_sim is
Component alu_8
Port(
Ain : in STD_LOGIC_VECTOR (7 downto 0);
 Bin : in STD_LOGIC_VECTOR (7 downto 0);
 Carryin : in STD_LOGIC;
 sel : in STD_LOGIC_VECTOR (1 downto 0);
 Aluout : out STD_LOGIC_VECTOR (7 downto 0);
 Carryout : out STD_LOGIC);
 end component;
 
 --Inuts
 signal Ain:std_logic_vector(7 downto 0):=(others=>'0');
 signal Bin:std_logic_vector(7 downto 0):=(others=>'0');
 signal Carryin:std_logic:='0';
 signal sel:std_logic_vector(1 downto 0);
 --Outputs
 signal Aluout: std_logic_vector(7 downto 0):=(others=>'0');
 signal carryout:std_logic:='0';

begin
uut: alu_8 PORT MAP(
Ain=>Ain, Bin=>Bin, Carryin=>Carryin, sel=>sel, Aluout=>Aluout, Carryout=>Carryout); 

stim_process: process 
begin 

sel <= "00"; 
wait for 100ns; 
ain <= "10101010";
bin <= "00001111";
carryin <= '0';

wait for 100ns; 

sel <= "01"; 

wait for 100ns; 

sel <= "10"; 

wait for 100ns; 

sel <= "11"; 

wait for 100ns; 

carryin <= '1'; 

wait for 100ns; 

end process; 

 


end Structural;
