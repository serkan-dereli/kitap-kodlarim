----------------------------------------------------------------------------------
-- 04.08.2019, pazar 11:25 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity uyg87 is
    Port (
        clk : in std_logic;
        rst : in std_logic;
        gir : in std_logic_vector(3 downto 0);
        cik : out std_logic_vector(7 downto 0)
    );
end uyg87;

architecture Behavioral of uyg87 is

begin
    process(clk,rst)
        variable i: integer range 0 to 9;
        variable x : std_logic_vector(7 downto 0);
        variable y : std_logic_vector(7 downto 0) := "10101010";
    begin
        if rst='1' then
            cik <= (others => 'U');
        elsif rising_edge(clk) then
            i := 4;
            x := gir & "0000";
            tekrar: loop
                i := i - 1;
                if gir(i)='1' then
                    x(i) := '0';
                else
                    x(i) := '1';
                end if; 
                EXIT tekrar When i = 0;             
            end loop tekrar;
            x := x XNOR y;            
        end if;
        cik <= x;
    end process;

end Behavioral;
