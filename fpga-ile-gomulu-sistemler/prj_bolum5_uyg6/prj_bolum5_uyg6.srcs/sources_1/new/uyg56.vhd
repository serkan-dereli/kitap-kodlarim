library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;

entity uyg56 is
    Port ( 
        clk : in std_logic;
        rst : in std_logic;        
        sayi1 : in std_logic_vector(31 downto 0);
        sayi2 : in std_logic_vector(31 downto 0);
        sonuc : out std_logic --1 ise iþlem baþarýlý
    );
end uyg56;

architecture Behavioral of uyg56 is
    Type bRAM is Array (0 to 7,0 to 1) Of std_logic_vector(3 downto 0);
    signal xRam : bRAM;  
begin
    process(clk,rst)
        variable sayac,indis : natural := 0;
    begin
        if (rst='1') then
            xRam <= (others=> (others=>"0000"));
            sayac := 0;
            indis := 0;
            sonuc <= '0';
        elsif rising_edge(clk) then
            while sayac < 32 loop
                xRam(indis,0) <= sayi1(sayac+3 downto sayac);
                xRam(indis,1) <= sayi2(sayac+3 downto sayac);
                sayac := sayac + 4;
                indis := indis + 1;
            end loop;
            sonuc <= '1';
        end if;        
    end process;    
end Behavioral;