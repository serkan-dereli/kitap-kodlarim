----------------------------------------------------------------------------------
--09.08.2019 cuma 19:16
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.std_logic_unsigned.ALL;

entity uyg904 is
    Generic (
        bits: integer := 8; -- 8-bit veri
        adr_bits: integer := 3 -- veri sayýsý 
    );
    Port (
        clk : in std_logic;
        rst : in std_logic;
        aktif: in std_logic;
        yaz_oku: in std_logic;
        adres: in std_logic_vector(adr_bits-1 downto 0);
        gir: in std_logic_vector(bits-1 downto 0);
        cik: out std_logic_vector(bits-1 downto 0)
    );
end uyg904;

architecture Behavioral of uyg904 is
    type hafiza is ARRAY(0 to 2**adr_bits-1) of std_logic_vector(7 downto 0);
    signal blokRAM : hafiza;
begin
    process(clk, rst)
    begin
        if rst='1' then
            blokRAM <= (others => (others => '0'));
        elsif rising_edge(clk) then
            if aktif = '0' then
                cik <= (others => 'Z');
            elsif aktif = '1' then
                if yaz_oku='0' then --okuma iþlemi
                    cik <= blokRAM(conv_integer(adres));
                elsif yaz_oku='1' then
                    blokRAM(conv_integer(adres)) <= gir;               
                end if;
            end if;
        end if;
    end process;
end Behavioral;