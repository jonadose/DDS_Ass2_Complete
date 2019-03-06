
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu_8 is
 Port (
 Ain : in STD_LOGIC_VECTOR (7 downto 0);
 Bin : in STD_LOGIC_VECTOR (7 downto 0);
 Carryin : in STD_LOGIC;
 sel : in STD_LOGIC_VECTOR (1 downto 0);
 Aluout : out STD_LOGIC_VECTOR (7 downto 0);
 Carryout : out STD_LOGIC);
end alu_8;

architecture Structural of alu_8 is
COMPONENT adder
PORT(
 ain : IN std_logic_vector(7 downto 0);
 bin : IN std_logic_vector(7 downto 0);
 carryin : IN std_logic;
 carryout : OUT std_logic;
 sumout : OUT std_logic_vector(7 downto 0));
END COMPONENT;
COMPONENT multiplexer
PORT(
 addin : IN std_logic_vector(7 downto 0);
 l1 : IN std_logic_vector(7 downto 0);
 l2 : IN std_logic_vector(7 downto 0);
 l3 : IN std_logic_vector(7 downto 0);
 muxout : OUT std_logic_vector(7 downto 0);
 sel : IN std_logic_vector(1 downto 0));
END COMPONENT;
COMPONENT logic
Port(
 ain : in STD_LOGIC_VECTOR (7 downto 0);
 bin : in STD_LOGIC_VECTOR (7 downto 0);
 l1 : out STD_LOGIC_VECTOR (7 downto 0);
 l2 : out STD_LOGIC_VECTOR (7 downto 0);
 l3 : out STD_LOGIC_VECTOR (7 downto 0));
END COMPONENT;

signal adder_out_to_mux : STD_LOGIC_VECTOR (7 downto 0);
signal logicsc_out_to_mux : STD_LOGIC_VECTOR (7 downto 0);
signal logicsd_out_to_mux : STD_LOGIC_VECTOR (7 downto 0);
signal logicse_out_to_mux : STD_LOGIC_VECTOR (7 downto 0);

Begin
c1: adder PORT MAP
 (Ain => Ain, bin => Bin, carryin => Carryin, sumout => adder_out_to_mux, carryout => Carryout);
c2: logic PORT MAP
 (ain => Ain, bin => Bin, l1 => logicsc_out_to_mux, l2 => logicsd_out_to_mux, l3 => logicse_out_to_mux);
c3: multiplexer PORT MAP
 (addin => adder_out_to_mux, l1 => logicsc_out_to_mux, l2 => logicsd_out_to_mux, l3 => logicse_out_to_mux, muxout=> ALuout, sel => sel);
end Structural;