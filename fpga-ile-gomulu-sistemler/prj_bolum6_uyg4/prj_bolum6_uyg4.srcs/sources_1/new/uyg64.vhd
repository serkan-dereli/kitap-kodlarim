----------------------------------------------------------------------------------
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity uyg64 is
    Port (
        clk : in std_logic;
        rst : in std_logic;
        gir1 : in std_logic_vector(3 downto 0);
        gir2 : in std_logic_vector(3 downto 0);
        cik_8bit : out std_logic_vector(7 downto 0);
        cik_4bit : out std_logic_vector(3 downto 0)
    );
end uyg64;

architecture Behavioral of uyg64 is
     
begin
    process(clk,rst)
    begin
        if (rst = '1') then
            cik_8bit <= (others => '0');
            cik_4bit <= (others => '0');
        elsif rising_edge(clk) then
            cik_8bit <= gir1 & gir2;
            cik_4bit <= gir1(3) & gir2(2 downto 0);
        end if;
    end process;
end Behavioral;
