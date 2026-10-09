----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity uyg71 is
    Port ( 
        clk : in std_logic;
        rst : in std_logic;
        motor : in std_logic; -- 1 ise çalýþýyor
        kapi : in std_logic; -- 1 ise kapalý
        emniyet : in std_logic; -- 1 ise takýlý
        ikaz : out std_logic -- 1 ise ikaz lambasý yanacak
    );
end uyg71;

architecture Behavioral of uyg71 is
    signal cik1, cik2 : std_logic;
begin
    cik1 <= (motor AND kapi) AND NOT(emniyet); 
	cik2 <= motor AND NOT(kapi); --basit sinyal atamasý
	
	ikaz <= '0' WHEN rst = '1' ELSE --koþullu sinyal atama
	        cik1 OR cik2;	
end Behavioral;
