----------------------------------------------------------------------------------
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;

entity uyg62 is
    Port ( 
        clk : in std_logic;
        rst : in std_logic;
        sayi1 : in std_logic_vector(5 downto 0);
        sayi2 : in std_logic_vector(5 downto 0);
        s_MOD : out std_logic_vector(3 downto 0); 
        s_REM : out std_logic_vector(3 downto 0)              
    );
end uyg62;

architecture Behavioral of uyg62 is

begin
    process(clk,rst)
        variable s1,s2 : integer;
    begin
        if (rst='1') then
            s_MOD <= (others=>'0');
            s_REM <= (others=>'0');
        elsif rising_edge(clk) then
            s1 := conv_integer(signed(sayi1));
            s2 := conv_integer(signed(sayi2));
            s_MOD <= conv_std_logic_vector((s1 MOD s2), s_MOD'length);
            s_REM <= conv_std_logic_vector((s1 REM s2), s_REM'length);            
        end if;   
    end process;

end Behavioral;
