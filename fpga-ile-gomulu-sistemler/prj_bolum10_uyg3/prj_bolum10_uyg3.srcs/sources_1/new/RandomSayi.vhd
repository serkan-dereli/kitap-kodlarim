library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RandomSayi is
    Generic ( 
        n: integer := 8 );
    Port (
        clk: in std_logic;
        rst: in std_logic;
        rnd_gir: in std_logic_vector(n-1 downto 0);
        rnd_cik: out std_logic_vector(n-1 downto 0)
    );
end RandomSayi;

architecture Behavioral of RandomSayi is
    --signal yeni_rnd: std_logic_vector(n-1 downto 0) := (others => '0');    
    --signal sayici: integer := 0;
begin 
    process(clk)
        variable rnd_bit: std_logic;
        variable yeni_rnd: std_logic_vector(n-1 downto 0) := (others => '0');
    begin
        if rising_edge(clk) then            
            rnd_bit := rnd_gir(n-2) XNOR rnd_gir(n-5);
            yeni_rnd := rnd_gir(n-2 downto 0) & rnd_bit;
            rnd_cik <= yeni_rnd;
            --sayici <= sayici + 1;
        end if;
    end process;
end Behavioral;