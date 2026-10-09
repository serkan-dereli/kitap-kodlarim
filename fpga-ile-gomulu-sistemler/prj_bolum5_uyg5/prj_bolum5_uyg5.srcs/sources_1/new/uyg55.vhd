----------------------------------------------------------------------------------
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;

entity uyg55 is
    Port ( 
        clk : in std_logic;
        rst : in std_logic;        
        sayi : in std_logic_vector(31 downto 0);
        sonuc : out std_logic --1 ise iþlem baþarýlý
    );
end uyg55;

architecture Behavioral of uyg55 is
    Type bRAM is Array (0 to 7) Of std_logic_vector(3 downto 0);
    signal xRam : bRAM;  
begin
    process(clk,rst)
        variable sayac,indis : natural := 0;
    begin
        if (rst='1') then
            xRam <= (others => "0000");
            sayac := 0;
            indis := 0;
            sonuc <= '0';
        elsif rising_edge(clk) then
            while sayac < 32 loop
                xRam(indis) <= sayi(sayac+3 downto sayac);
                sayac := sayac + 4;
                indis := indis + 1;
            end loop;
            sonuc <= '1';
        end if;        
    end process;    
end Behavioral;
