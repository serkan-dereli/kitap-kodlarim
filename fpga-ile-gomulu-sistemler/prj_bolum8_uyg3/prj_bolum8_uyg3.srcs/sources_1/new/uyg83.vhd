----------------------------------------------------------------------------------
-- 02/8/2019, çarþamba. 11:01 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity uyg83 is
    Port ( 
        clk : in std_logic;
        rst : in std_logic;
        motor : in std_logic; -- 1 ise çalýþýyor
        kapi : in std_logic; -- 1 ise kapalý
        emniyet : in std_logic; -- 1 ise takýlý
        ikaz : out std_logic -- 1 ise ikaz lambasý yanacak
    );
end uyg83;

architecture Behavioral of uyg83 is
    signal cik : std_logic;
begin
    process(clk,rst)
    Begin
        if rst='1' then
            cik <= '0';
        elsif rising_edge(clk) then
            if motor = '1' then
                if kapi = '0' or emniyet='0' then
                    cik <= '1';
                else
                    cik <= '0';
                end if;
            else
                cik <= '0';
            end if;                
        end if;
        ikaz <= cik;
    end process;

end Behavioral;
