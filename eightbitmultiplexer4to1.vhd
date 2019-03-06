----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.03.2019 14:06:22
-- Design Name: 
-- Module Name: eightbitmultiplexer4to1 - Behavioral
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

entity eightbitmultiplexer4to1 is
    Port ( InputA : in STD_LOGIC_Vector (7 downto 0);
           InputB : in STD_LOGIC_Vector (7 downto 0);
           InputC : in STD_LOGIC_Vector (7 downto 0);
           InputD : in STD_LOGIC_Vector (7 downto 0);
           Output : out STD_LOGIC_Vector (7 downto 0);
           SelectLine : in STD_LOGIC_Vector (1 downto 0));
end eightbitmultiplexer4to1;

architecture Behavioral of eightbitmultiplexer4to1 is

begin

process (SelectLine)
begin
   case SelectLine is
      when "00" => Output <= InputA;
      when "01" => Output <= InputB;
      when "10" => Output <= InputC;
      when "11" => Output <= InputD;
      when others => null;
   end case;
end process;

end Behavioral;
