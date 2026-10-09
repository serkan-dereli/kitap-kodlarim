----------------------------------------------------------------------------------
-- 31.07.2019, çarþaba-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.std_logic_signed.ALL;

entity uyg81 is
    Generic ( n: natural:=4 );
    Port ( 
        clk : in std_logic;
        rst : in std_logic;
        s1 : in std_logic_vector(n-1 downto 0);
        s2 : in std_logic_vector(n-1 downto 0);
        elde : out std_logic;
        top : out std_logic_vector(n-1 downto 0)     
    );
end uyg81;

architecture Behavioral of uyg81 is
    signal ara : std_logic_vector(n downto 0);
begin
    process(clk,rst)
    Begin
        if rst='1' then
            elde <= 'X';
            top <= (others=>'0');
        elsif rising_edge(clk) then            
            ara <= ('0' & s1) + ('0' & s2); 
            top <= ara(n-1 downto 0);
            elde <= ara(n);         
        end if;
    end process;
end Behavioral;
