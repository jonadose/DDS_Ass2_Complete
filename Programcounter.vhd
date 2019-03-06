
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;



entity Programasm is
    Port ( Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           SelectAluOperation : out STD_LOGIC_Vector (1 downto 0);
           WriteEnable : out STD_LOGIC;
           SelectReg : out STD_LOGIC_Vector (1 downto 0);
           AluInputSelectA : out STD_LOGIC_Vector (1 downto 0);
           AluInputSelectB : out STD_LOGIC_Vector (1 downto 0);
           ExternalLoadEnable : out STD_LOGIC;
           Carry : out STD_LOGIC; -- output to control the carryin signal
           Risc : in STD_LOGIC_Vector ( 3 downto 0)
           --Stateout : out std_logic_vector(3 downto 0) -- state output for observation
           --PC_extra : out STD_LOGIC_VECTOR(3 downto 0); -- extra output for observation in simulation
           --ASM_input_extra : out STD_LOGIC_VECTOR(3 downto 0)
           ); -- extra output for observation in simulation
end Programasm;

architecture Behavioral of Programasm is
type state_type is (st1_Reset, st2_DecodeAndExecute, st3_Wait, st4_Execute, st5_Wait);
   signal state, next_state : state_type;   
   signal ASM_input : std_logic_vector(3 downto 0); --intern data fra programrom
   signal PC : std_logic_vector(3 downto 0); -- intern program counter
   signal Increment_PC : std_logic; -- message to increment PC
begin
--ASM_input <= Risc;
 SYNC_PROC: process (clk)
   begin
      if (falling_edge(clk)) then
         if (reset = '1') then
            state <= st1_reset;
         else
            state <= next_state;
         end if;
      end if;
   end process;

   OUTPUT_DECODE: process (state, ASM_input)
   begin
      
      if (state = st1_reset) then
                  SelectAluOperation <= "00";
                  WriteEnable <= '0';
                  SelectReg <= "00";
                  AluInputSelectA <= "00";
                  AluInputSelectB <= "00";
                  ExternalLoadEnable <= '0';
                  Carry <= '0';
                  
                  Increment_PC <= '0';
                  --stateout <= "0001";
      end if;
      
      if (state = st2_DecodeAndExecute) then
         case ASM_input is -- decode the instruction
            when "0000" => -- Load A
                        WriteEnable <= '1';
                        SelectReg <= "00";
                        ExternalLoadEnable <= '1';
                        
                        AluInputSelectA <= "00";
                        AluInputSelectB <= "00";
                        SelectAluOperation <= "00";
                        Carry <= '0';
                        
                        Increment_PC <= '1'; -- increment PC
                        --stateout <= "0010";
            when "0001" =>
                        WriteEnable <= '1';
                        SelectReg <= "01";
                        ExternalLoadEnable <= '1';
                        
                        AluInputSelectA <= "00";
                        AluInputSelectB <= "00";
                        SelectAluOperation <= "00";
                        Carry <= '0';  
                        Increment_PC <= '1'; -- increment PC
                        --stateout <= "0011";
            when "0010" => -- Load C
                        WriteEnable <= '1';
                        SelectReg <= "10";
                        ExternalLoadEnable <= '1';
                        
                        AluInputSelectA <= "00";
                        AluInputSelectB <= "00";
                        SelectAluOperation <= "00";
                        Carry <= '0';  
                        Increment_PC <= '1'; -- increment PC
                        --stateout <= "0100";
            when "0011" => -- Load D
                        WriteEnable <= '1';
                        SelectReg <= "11";
                        ExternalLoadEnable <= '1';
                        
                        AluInputSelectA <= "00";
                        AluInputSelectB <= "00";
                        SelectAluOperation <= "00";
                        Carry <= '0';  
                        Increment_PC <= '1'; -- increment PC
                        --stateout <= "0101";
            
            when "0100" => -- A=A+A
                        WriteEnable <= '1';
                        SelectReg <= "00";
                        ExternalLoadEnable <= '0';
                        
                        AluInputSelectA <= "00";
                        AluInputSelectB <= "00";
                        SelectAluOperation <= "00";
                        Carry <= '0';  
                        Increment_PC <= '1'; -- increment PC
                        --stateout <= "0110";
            when "0101" => -- A = B + C
                        WriteEnable <= '1';
                        SelectReg <= "00";
                        ExternalLoadEnable <= '0';
                        
                        AluInputSelectA <= "01";
                        AluInputSelectB <= "10";
                        SelectAluOperation <= "00";
                        Carry <= '0';  
                        Increment_PC <= '1'; -- increment 
                        --stateout <= "0111";  
            when "0110" => --A = A+B
                        WriteEnable <= '1';
                        SelectReg <= "00";
                        ExternalLoadEnable <= '0';
                        
                        AluInputSelectA <= "00";
                        AluInputSelectB <= "01";
                        SelectAluOperation <= "00";
                        Carry <= '0';  
                        Increment_PC <= '1'; -- increment PC
                        --stateout <= "1000";
            when "0111" => --C=C and D
                        WriteEnable <= '1';
                        SelectReg <= "10";
                        ExternalLoadEnable <= '0';
                        
                        AluInputSelectA <= "10";
                        AluInputSelectB <= "11";
                        SelectAluOperation <= "01";
                        Carry <= '0';  
                        Increment_PC <= '1'; -- increment PC
                        --stateout <= "1001"; 
            when "1000" => --C=C or D
                        WriteEnable <= '1';
                        SelectReg <= "10";
                        ExternalLoadEnable <= '0';
                        
                        AluInputSelectA <= "10";
                        AluInputSelectB <= "11";
                        SelectAluOperation <= "10";
                        Carry <= '0';  
                        Increment_PC <= '1'; -- increment PC
                       -- stateout <= "1010"; 
            when "1001" => --A = Not A
                        WriteEnable <= '1';
                        SelectReg <= "00";
                        ExternalLoadEnable <= '0';
                        
                        AluInputSelectA <= "00";
                        AluInputSelectB <= "00";
                        SelectAluOperation <= "11";
                        Carry <= '0';  
                        Increment_PC <= '1'; -- increment PC
                        --stateout <= "1011"; 
            when "1010" => --C = not C
                        WriteEnable <= '1';
                        SelectReg <= "10";
                        ExternalLoadEnable <= '0';
                        
                        AluInputSelectA <= "10";
                        AluInputSelectB <= "10";
                        SelectAluOperation <= "11";
                        Carry <= '0';  
                        Increment_PC <= '1'; -- increment PC
                        --stateout <= "1100";                                
            when "1101" => -- Halt
                         WriteEnable <= '0';
                         SelectReg <= "00";
                         ExternalLoadEnable <= '0';
                        
                         AluInputSelectA <= "00";
                         AluInputSelectB <= "00";
                         SelectAluOperation <= "00";
                         Carry <= '0';  
                          
                         Increment_PC <= '0'; -- Do not increment PC
                         --stateout <= "1101";
              when "1110" => -- A = B - C: (A = B + (-C))
                         WriteEnable <= '1';
                         SelectReg <= "10";
                         ExternalLoadEnable <= '0';
                        
                         AluInputSelectA <= "10";
                         AluInputSelectB <= "00";
                         SelectAluOperation <= "11";
                         Carry <= '0';  
                         
                         Increment_PC <= '1'; -- increment 
                         --stateout <= "1110";
                                   
            when others => null; 
        end case;                    
      end if;  
      
        if (state = st3_Wait) then
         
         WriteEnable <= '0';
         SelectReg <= "00";
         ExternalLoadEnable <= '0';
                        
         AluInputSelectA <= "00";
         AluInputSelectB <= "00";
         SelectAluOperation <= "00";

         Carry <= '0';
         Increment_PC <= '0'; --wait state - for correct timing.
         end if;    
        
        if (state = st4_Execute) then
          if (ASM_Input = "1110") then -- second part of the sub instruction
              
              WriteEnable <= '1';
              SelectReg <= "00";
              ExternalLoadEnable <= '0';
                        
              AluInputSelectA <= "01";
              AluInputSelectB <= "10";
              SelectAluOperation <= "00";

              Carry <= '1'; 
              Increment_PC <= '1'; -- Increment PC
              --stateout <= "1110";
            end if;
        end if;
                   
        if (state = st5_Wait) then
         
         WriteEnable <= '0';
         SelectReg <= "00";
         ExternalLoadEnable <= '0';
                        
         AluInputSelectA <= "00";
         AluInputSelectB <= "00";
         SelectAluOperation <= "00";
         
         Carry <= '0';
         Increment_PC <= '0'; -- Do not increment PC
         --stateout <= "1011";
        end if; 
                          
   end process;

   NEXT_STATE_DECODE: process (state, ASM_input)
   begin
      next_state <= state;  
      case (state) is
         when st1_Reset =>
             next_state <= st2_decodeAndExecute;
             
         when st2_DecodeAndExecute =>
           if(ASM_input = "1110") then
              next_state <= st5_Wait;
           else      
              next_state <= st3_Wait;
           end if; 
                   
         when st3_Wait =>
              next_state <= st2_DecodeAndExecute;
           
         when st4_Execute =>
            next_state <= st3_Wait;
            
         when st5_wait =>
             next_state <= st4_Execute;
             
         when others => next_state <= st1_Reset;
      end case;
   end process;
   
   Program_Mem : process (Clk)
   type rom_type is array (0 to 15) of std_logic_vector (3 downto 0);                 
       variable ROM : rom_type:= (X"0", X"1", X"2", X"3", X"5", X"E", X"D", X"D",
                                  X"0", X"0", X"0", X"0", X"0", X"0", X"0", X"0");          
   Begin
   if (rising_edge(clk)) then
   if(state = st1_reset) then
        PC <= "0000";
   else
        Asm_input <= ROM(conv_integer(PC));
            if( Increment_PC = '1') then 
                PC <= PC+1;
            end if;
   end if;
   end if; 
   end process;
   
   
-- Extra outputs for observation in simulations
--PC_extra <= PC;
--ASM_input_extra <= ASM_input;

end Behavioral;
