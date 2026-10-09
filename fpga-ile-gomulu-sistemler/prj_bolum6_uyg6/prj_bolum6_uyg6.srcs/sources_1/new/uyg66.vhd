----------------------------------------------------------------------------------
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity uyg66 is
    Port (
        clk : in std_logic;
        rst : in std_logic;
        gir : in bit_vector(7 downto 0);
        cik_sll : out bit_vector(7 downto 0);        
        cik_sla : out bit_vector(7 downto 0)
    );
end uyg66;

architecture Behavioral of uyg66 is
    signal sayi1 : bit_vector(7 downto 0);
    signal sayi2 : bit_vector(7 downto 0);
begin
    process(clk,rst)
    begin
        if (rst = '1') then
            sayi1 <= gir;
            sayi2 <= gir;
        elsif rising_edge(clk) then
            sayi1 <= sayi1 sll 1;
            sayi2 <= sayi2 sla 1;
        end if;
    end process;
    cik_sll <= sayi1;
    cik_sla <= sayi2;
end Behavioral;
