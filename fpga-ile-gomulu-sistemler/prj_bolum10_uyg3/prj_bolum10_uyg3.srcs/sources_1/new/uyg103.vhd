----------------------------------------------------------------------------------
-- 13.08.2019, salı, 14:17, kurban bayramının 3. günü 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity uyg103 is
    Port (
        clk: in std_logic;
        rst: in std_logic
    );
end uyg103;

architecture Behavioral of uyg103 is
    component RandomSayi
        Generic ( n: integer );
        Port(
            clk: in std_logic;
            rst: in std_logic;
            rnd_gir: in std_logic_vector(n-1 downto 0);
            rnd_cik: out std_logic_vector(n-1 downto 0)
        );
    end component;
    
    signal rnd8b: std_logic_vector(7 downto 0);
    signal rnd8b_tmp: std_logic_vector(7 downto 0):= x"36";
        
    signal rnd16b: std_logic_vector(15 downto 0);
    signal rnd16b_tmp: std_logic_vector(15 downto 0) := x"0041";
begin
    RND_FOR: for i in 0 to 1 generate
        KOSUL0: if i=0 generate
            RASGELE: RandomSayi
            Generic map (n => 8)
            Port map(
                clk => clk,
                rst => rst,
                rnd_gir => rnd8b_tmp,
                rnd_cik => rnd8b
            );
            rnd8b_tmp <= rnd8b when clk = '1';
        end generate;
        
        KOSUL1: if i=1 generate
            RASGELE: RandomSayi
            Generic map (n => 16)
            Port map(
                clk => clk,
                rst => rst,
                rnd_gir => rnd16b_tmp,
                rnd_cik => rnd16b
            );
            rnd16b_tmp <= rnd16b when clk = '1';
        end generate;             
    end generate;
end Behavioral;
