----------------------------------------------------------------------------------
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity uyg65 is
    Port (
        clk : in std_logic;
        rst : in std_logic;
        a : in std_logic;
        b : in std_logic;
        s : out std_logic;
        c : out std_logic
    );
end uyg65;

architecture Behavioral of uyg65 is

begin
    process(clk,rst)
    begin
        if (rst = '1') then
            s <= '0';
            c <= '0';
        elsif rising_edge(clk) then
            s <= a xor b;
            c <= a and b;
        end if; 
    end process;
end Behavioral;
