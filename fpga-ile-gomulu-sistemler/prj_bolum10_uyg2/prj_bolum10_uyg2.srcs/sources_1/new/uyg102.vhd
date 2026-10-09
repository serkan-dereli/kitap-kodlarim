----------------------------------------------------------------------------------
-- 13.08.2019, salý, 04:42, kurban bayramýnýn 3.günü
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity uyg102 is
    Generic ( 
        n: integer := 8;
        SAAT_DARBESI: time := 100 ns );
    Port (
        --clk: in std_logic;
        --rst: in std_logic;
        rnd: out std_logic_vector(n-1 downto 0)
    );
end uyg102;

architecture Behavioral of uyg102 is
    signal son_rnd: std_logic_vector(n-1 downto 0) := x"41";
    signal clk: std_logic := '0';
    signal rst: std_logic := '0';
    signal sayici: integer := 0;
begin
    -- saat darbesi üreteci (osilatör)
    process
    begin
        clk <= '1';
        wait for SAAT_DARBESI/2;
        clk <= '0';
        wait for SAAT_DARBESI/2;
    end process;
    
    process(clk)
        variable rnd_bit: std_logic;
    begin
        if rising_edge(clk) then            
            rnd_bit := son_rnd(n-2) XNOR son_rnd(n-5);
            son_rnd <= son_rnd(n-2 downto 0) & rnd_bit;
            rnd <= son_rnd;
            sayici <= sayici + 1;
        end if;
    end process;
end Behavioral;
