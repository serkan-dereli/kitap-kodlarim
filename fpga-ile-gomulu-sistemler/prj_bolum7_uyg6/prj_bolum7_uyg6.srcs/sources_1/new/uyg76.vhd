
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;
use IEEE.std_logic_arith.ALL;

entity uyg76 is
    Port (   
        clk : in std_logic;      
        gir : in std_logic_vector(7 downto 0);
        cift : out std_logic;
        tek : out std_logic
    );
end uyg76;

architecture Behavioral of uyg76 is
    signal sonuc : std_logic_vector(8 downto 0) := (others=>'0');
begin
    GEN:for i IN 0 TO 7 GENERATE
        sonuc(i+1) <= sonuc(i) XOR gir(i);
    end generate;
    
    process(clk,sonuc(8))        
    begin
        if rising_edge(clk) then            
            if sonuc(8) = '0' then
                cift <= '1';
                tek <= '0';
            elsif sonuc(8) = '1' then
                cift <= '0';
                tek <= '1';
            end if; 
        end if;      
    end process;

end Behavioral;
