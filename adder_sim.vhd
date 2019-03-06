----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.02.2019 13:31:56
-- Design Name: 
-- Module Name: adder_sim - Behavioral
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

entity adder_sim is
--  Port ( );
end adder_sim;

architecture Behavioral of adder_sim is

component adder
port(
ain: IN std_logic_vector(7 downto 0);
bin: IN std_logic_vector(7 downto 0);
carryin: IN std_logic; 
carryout: OUT std_logic; 
sumout: OUT std_logic_vector(7 downto 0) 
);
end component;
--Inputs
signal ain:std_logic_vector(7 downto 0):=(others=>'0');
signal bin:std_logic_vector(7 downto 0):=(others=>'0');
signal carryin:std_logic:='0';
--Outputs
signal carryout: std_logic; 
signal sumout:std_logic_vector(7 downto 0);

begin
uut: adder PORT MAP(
ain=>ain, bin=>bin, carryin=>carryin, carryout=>carryout,sumout=>sumout);


--<clock>_process :process
--begin
--<clock> <= '0';
--wait for <clock>_period/2;
--<clock> <= '1';
--wait for <clock>_period/2;
--end process;

--Stimulus Process
stim_proc:process
begin
    wait for 100ns; 
    --wait for <clock>_period*10; 
     ain<= "00001111";
     bin<= "01010101";
     carryin <= '0';
     wait for 100 ns;
     ain<= "00000000";
     bin<= "01010101";
     carryin <= '0';
     wait for 100 ns;
     ain<= "11110000";
     bin<= "01010101";
     carryin <= '0';
     wait for 100 ns;
     ain<= "00001111";
     bin<= "01010101";
     carryin <= '1';
     wait for 100 ns;
     wait;--wait forever
     end process;
     END;
