----------------------------------------------------------------------------------
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;

entity uyg58 is
    Port ( 
        clk : in std_logic;
        rst : in std_logic        
    );
end uyg58;

architecture Behavioral of uyg58 is
    type D is (BASLA, GORUNTU_AL, FILTRE, MORFOLOJI, TEMIZLE, BITIR);
    --signal D : FSM_Durum;
    
    signal D_Pos : integer;
    signal D_Val,D_Leftof,D_Rightof,D_Succ,D_Pred : D;
begin
    process(clk,rst)
    begin
        if rising_edge(clk) then
            D_Pos <= D'Pos(FILTRE);
            D_Val <= D'Val(1);
            D_Leftof <= D'Leftof(TEMIZLE);
            D_Rightof <= D'Rightof(TEMIZLE);
            D_Succ <= D'Succ(FILTRE);
            D_Pred <= D'Pred(BITIR);
        end if; 
    end process;
end Behavioral;
