----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.02.2019 09:54:45
-- Design Name: 
-- Module Name: logic - Behavioral
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

entity logic is
    Port ( ain : in STD_LOGIC_VECTOR (7 downto 0);
           bin : in STD_LOGIC_VECTOR (7 downto 0);
           l1 : out STD_LOGIC_VECTOR (7 downto 0);
           l2 : out STD_LOGIC_VECTOR (7 downto 0);
           l3 : out STD_LOGIC_VECTOR (7 downto 0));
end logic;

architecture Behavioral of logic is

begin

l1 <= ain and bin;
l2 <= ain or bin; 
l3 <= not ain;  


end Behavioral;
