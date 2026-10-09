----------------------------------------------------------------------------------
-- 03.08.2019, ctesi, 12:11.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;

entity uyg85 is
    Generic ( n: natural := 32 );
    Port (
        clk : in std_logic;
        rst : in std_logic;
        gir : in std_logic_vector(n-1 downto 0);
        cik : out std_logic_vector(7 downto 0)
    );
end uyg85;

architecture Behavioral of uyg85 is

begin
    process(clk,rst)
        variable say: integer;
    begin
        if rst = '1' then
            say := 0;          
        elsif rising_edge(clk) then
            for i in 0 to n-1 loop
                if gir(i) = '1' then
                    say := say + 1;
                end if;
            end loop;            
        end if;
        cik <= conv_std_logic_vector(say, cik'length);            
    end process;
end Behavioral;
