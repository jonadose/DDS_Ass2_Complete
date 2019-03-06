----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.02.2019 13:27:30
-- Design Name: 
-- Module Name: adder - Behavioral
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

entity adder is
     Port ( ain : in STD_LOGIC_VECTOR (7 downto 0);
           bin : in STD_LOGIC_VECTOR (7 downto 0);
           carryin : in STD_LOGIC;
           sumout : out STD_LOGIC_VECTOR (7 downto 0);
           carryout : out STD_LOGIC);
end adder;

architecture Behavioral of adder is

begin
process (ain,bin,carryin)
        variable vsum : STD_LOGIC_VECTOR (7 downto 0);
        variable carry : STD_LOGIC;
     begin 
        carry := carryin; 
        for i in 0 to 7 loop
            vsum(i) := (ain(i) xor bin(i)) xor carry;
            carry := (ain(i) and bin(i)) or (carry and (ain(i) or bin(i)));
         end loop;
     sumout <=vsum;
     carryout <= carry;
     end process; 
    
 end Behavioral;