----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.03.2019 14:20:47
-- Design Name: 
-- Module Name: RegSelectDemux - Behavioral
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

entity RegSelectDemux is
    Port ( OutputA : out STD_LOGIC;
           OutputB : out STD_LOGIC;
           OutputC : out STD_LOGIC;
           OutputD : out STD_LOGIC;
           WriteEnable : in STD_Logic;
           SelectWrite : in STD_LOGIC_Vector (1 downto 0));
end RegSelectDemux;

architecture Behavioral of RegSelectDemux is

begin

process (SelectWrite)
begin
   OutputA <= '0';
   OutputB <= '0';
   OutputC <= '0';
   OutputD <= '0';
   if WriteEnable = '1' then
   case SelectWrite is
      when "00" => OutputA <= '1';
      when "01" => OutputB <= '1';
      when "10" => OutputC <= '1';
      when "11" => OutputD <= '1';
      when others => null;
   end case;
   end if;
end process;


end Behavioral;
