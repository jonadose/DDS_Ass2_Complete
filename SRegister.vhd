----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.03.2019 13:16:56
-- Design Name: 
-- Module Name: SRegister - Behavioral
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

entity SRegister is
    Port ( clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Enable : in STD_LOGIC;
           Input : in STD_Logic_Vector (7 downto 0);
           Output : out STD_Logic_Vector (7 downto 0);
           SimOutput : out STD_Logic_Vector (7 downto 0));
end SRegister;

architecture Behavioral of SRegister is

begin
process (Reset,clk)
begin
   if clk'event and clk='1' then
      if Reset='1' then
         Output <= "00000000";
         SimOutput <= "00000000";
      else if Enable='1' then
         Output <= Input;
         SimOutput <= Input;
      end if;
      end if;
   end if;

end process;


end Behavioral;
