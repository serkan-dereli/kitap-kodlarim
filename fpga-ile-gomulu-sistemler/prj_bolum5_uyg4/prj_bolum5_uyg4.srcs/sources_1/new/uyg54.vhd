library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.numeric_std.ALL;

entity uyg54 is
    Port ( 
        clk : in std_logic;
        rst : in std_logic;
        anahtar : in std_logic;
        isaret : out std_logic;
        son : out std_logic_vector(3 downto 0)
    );
end uyg54;

architecture Behavioral of uyg54 is
    constant sinir : signed(3 downto 0) := (others=>'0');  
    signal say : signed(3 downto 0) := (others=>'0');  
begin
    process(clk,rst)        
        variable an : std_logic := '0';
    begin
        if (rst='1') then
            say <= (others=>'0');        
        elsif rising_edge(clk) then
            an := anahtar;
            if (an='0') then
               say <= say + 1;
            else
                say <= say - 1;
            end if;
        end if;       
    end process;
    
    process(say) 
    begin
        if say < sinir then
            isaret <= '1';
        else         
            isaret <= '0';
        end if;    
    end process;
    
    son <= std_logic_vector(say);   
end Behavioral;
