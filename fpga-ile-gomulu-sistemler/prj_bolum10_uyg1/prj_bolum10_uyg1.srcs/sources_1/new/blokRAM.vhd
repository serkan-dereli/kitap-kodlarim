----------------------------------------------------------------------------------
-- 11.08.2019, pazar; 07:42, bugün kurban bayramý 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.std_logic_unsigned.ALL;

entity blokRAM is
    Generic (
        bitx: integer := 8; -- 8-bit veri
        adr_bits: integer := 4 -- veri sayýsý 
    );
    Port (
        clk : in std_logic;
        rst : in std_logic;
        islem: in std_logic_vector(2 downto 0);
        aktif: in std_logic;
        yaz_oku: in std_logic;
        adres: in std_logic_vector(adr_bits-1 downto 0);
        gir: in std_logic_vector(bitx-1 downto 0);
        cik: out std_logic_vector(bitx-1 downto 0)
    );
end blokRAM;

architecture Behavioral of blokRAM is
    type hafiza is ARRAY(0 to 2**adr_bits-1) of std_logic_vector(7 downto 0);
    signal RAMbellek: hafiza;
begin
    process(clk, rst)
    begin
        if rst='1' then
            RAMbellek <= (others => (others => '0'));
        elsif rising_edge(clk) and islem = "010" then
            if aktif = '0' then
                cik <= (others => 'Z');
            elsif aktif = '1' then
                if yaz_oku='0' then --okuma iþlemi
                    cik <= RAMbellek(conv_integer(adres));
                elsif yaz_oku='1' then
                    RAMbellek(conv_integer(adres)) <= gir;               
                end if;
            end if;
        end if;
    end process;
end Behavioral;


