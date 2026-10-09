----------------------------------------------------------------------------------
-- 14.08.2019, çarþamba, 14:04, kurban bayramýnýn 3. günü
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.fixed_float_types.all;
use work.math_utility_pkg.all;
use work.float_pkg.all;
use work.fixed_pkg.all;

entity uyg111 is
    Port (
        clk: in std_logic;
        rst: in std_logic;
        a: in std_logic_vector(31 downto 0);
        b: in std_logic_vector(31 downto 0);
        c: in std_logic_vector(31 downto 0);
        kok: out std_logic;
        x1: out std_logic_vector(31 downto 0);
        x2: out std_logic_vector(31 downto 0)
    );
end uyg111;

architecture Behavioral of uyg111 is
    signal delta: float(8 downto -23);
    signal ax,bx,cx: float(8 downto -23);
    signal kok1,kok2: float(8 downto -23);
begin
    process(clk,rst)
    begin
        if rising_edge(clk) then
            ax <= to_float(a);
            bx <= to_float(b);
            cx <= to_float(c);
            delta <= bx * bx - 4 * ax * cx;
            if delta < 0 then
                kok <= '0';
            else
                kok <= '1';
                kok1 <= ((-1) * bx + sqrt(delta)) / 2;
                kok2 <= ((-1) * bx - sqrt(delta)) / 2;                
            end if;            
        end if;
        x1 <= std_logic_vector(kok1);
        x2 <= std_logic_vector(kok2);
    end process;
end Behavioral;
