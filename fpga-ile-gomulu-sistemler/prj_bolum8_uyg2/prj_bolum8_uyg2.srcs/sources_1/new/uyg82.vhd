----------------------------------------------------------------------------------
-- 1/8/2019, perþembe, 21.32 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity uyg82 is
    Port ( 
        clk : in std_logic;
        rst : in std_logic;
        g : in std_logic_vector(1 downto 0);
        s : out std_logic_vector(3 downto 0);
        durum: out std_logic --0 olduðunda aktif olacak
    );
end uyg82;

architecture Behavioral of uyg82 is
    signal kare : std_logic_vector(3 downto 0);
begin
    process(clk,rst)
    Begin
        if rst = '1' then
            kare <= (others => '0');
        elsif rising_edge(clk) then            
            kare(3) <= g(0) and g(1); --E
            kare(2) <= NOT(g(0)) and g(1); --F
            kare(1) <= '0'; --G
            kare(0) <= g(0); --H   
        end if;
        s <= kare;
    end process;
    
    process(kare)
    begin
        if kare = x"0" then
            durum <= '1';
        else
            durum <= '0';
        end if;
    end process;
end Behavioral;
