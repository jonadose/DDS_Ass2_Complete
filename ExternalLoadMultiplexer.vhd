----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.03.2019 14:30:02
-- Design Name: 
-- Module Name: ExternalLoadMultiplexer - Behavioral
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

entity ExternalLoadMultiplexer is
    Port ( ExternalInput : in STD_LOGIC_Vector (7 downto 0);
           InputFromAlu : in STD_LOGIC_Vector (7 downto 0);
           EnableExternalLoad : in STD_LOGIC;
           DataToReg : out STD_LOGIC_Vector (7 downto 0));
end ExternalLoadMultiplexer;

architecture Behavioral of ExternalLoadMultiplexer is

begin

process (EnableExternalLoad)
begin
   case EnableExternalLoad is
      when '0' => DataToReg <= InputFromAlu;
      when '1' => DataToReg <= ExternalInput;
      when others => null;
   end case;
end process;

end Behavioral;
