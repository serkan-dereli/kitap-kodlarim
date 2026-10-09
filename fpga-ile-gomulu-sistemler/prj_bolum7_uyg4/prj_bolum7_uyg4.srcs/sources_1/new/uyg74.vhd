library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use std.textio.ALL;

entity uyg74 is
    Port ( 
        sec : in std_logic_vector(1 downto 0);
        g1  : in string(1 to 3); --TAM -> 00
        g2  : in string(1 to 3); --FAR -> 01
        g3  : in string(1 to 3); --HAM -> 10
        g4  : in string(1 to 3); --CUR -> 11
        cik : out string(1 to 3)
    );
end uyg74;

architecture Behavioral of uyg74 is
begin
    WITH sec SELECT
        cik <= g1 WHEN "00",
               g2 WHEN "01",
               g3 WHEN "10",
               g4 WHEN "11",
               "XXX" WHEN others;
end Behavioral;
