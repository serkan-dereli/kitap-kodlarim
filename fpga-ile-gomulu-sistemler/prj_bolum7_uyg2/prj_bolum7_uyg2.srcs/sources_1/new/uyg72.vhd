----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity uyg72 is
    Port ( 
        clk : in std_logic;
        rst : in std_logic;
        motor : in std_logic; -- 1 ise çalýþýyor
        kapi : in std_logic; -- 1 ise kapalý
        emniyet : in std_logic; -- 1 ise takýlý
        ikaz : out std_logic -- 1 ise ikaz lambasý yanacak
    );
end uyg72;

architecture Behavioral of uyg72 is
    signal cik1, cik2, cik3, k1, e1 : std_logic;
begin
    process(clk,rst)
        --variable cik1, cik2 : std_logic;
    begin
        if rst='1' then
            ikaz <= '0';
        elsif rising_edge(clk) then            
            ikaz <= cik2 OR cik3;
            cik1 <= motor AND kapi ;
            cik2 <= motor AND k1;
            cik3 <= cik1 AND e1;
            k1 <= NOT(kapi);
            e1 <= NOT(emniyet);    
        end if;
    end process;
end Behavioral;
