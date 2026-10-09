
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use std.textio.ALL;

entity uyg73 is
    Port (         
        sec : in std_logic_vector(1 downto 0);
        cik : out string(1 to 3)
    );
end uyg73;

architecture Behavioral of uyg73 is
begin
    cik <= "TAM" WHEN sec = "00" ELSE
           "FAR" WHEN sec = "01" ELSE
           "HAM" WHEN sec = "10" ELSE
           "CUR" WHEN sec = "11" ELSE
           "XXX";
end Behavioral;
