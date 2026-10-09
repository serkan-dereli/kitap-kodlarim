----------------------------------------------------------------------------------
--  
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;

entity uyg57 is
    Port ( 
        clk : in std_logic;
        rst : in std_logic;
        sayi : in std_logic_vector(7 downto 0);
        --tsayi : out std_logic_vector(7 downto 0);
        cik : out std_logic_vector(3 downto 0)
    );
end uyg57;

architecture Behavioral of uyg57 is
    signal S_Left, S_Right, S_High, S_Low, S_Length : natural;
begin
    process(clk,rst)
        variable say : natural := 0;
        variable veri : std_logic := '0';
    begin
        if (rst='1') then
            cik <= (others=>'0');
        elsif rising_edge(clk) then
            for i in 0 to sayi'length-1 loop
                veri := sayi(i);
                if (veri = '1') then
                    say := say + 1;
                end if;    
            end loop;
            cik <= conv_std_logic_vector(say, cik'length);
            --tsayi <= sayi(sayi'left+1 to sayi'right) & sayi(sayi'left);
            S_Left <= sayi'Left;
            S_Right <= sayi'Right;
            S_High <= sayi'High;
            S_Low <= sayi'Low;
            S_Length <= sayi'Length;
            say := 0;
        end if;
        
    end process;  
end Behavioral;
