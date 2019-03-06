----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.02.2019 16:14:32
-- Design Name: 
-- Module Name: multiplexer - Behavioral
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

entity multiplexer is
    Port ( addin : in STD_LOGIC_VECTOR (7 downto 0);
           l1 : in STD_LOGIC_VECTOR (7 downto 0);
           l2 : in STD_LOGIC_VECTOR (7 downto 0);
           l3 : in STD_LOGIC_VECTOR (7 downto 0);
           sel : in std_logic_vector (1 downto 0);
           muxout : out STD_LOGIC_VECTOR (7 downto 0));
end multiplexer;

architecture Behavioral of multiplexer is

begin
process(addin,l1,l2,l3,sel)
    begin
        case sel is
            when "00" => muxout <= addin; 
            when "01" => muxout <= l1; 
            when "10" => muxout <= l2;
            when "11" => muxout <= l3; 
            when others => null;
        end case;  
   
    end process;


end Behavioral;
