----------------------------------------------------------------------------------
-- 12.08.2019, pazartesi, 06:46
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;

entity uyg101 is
    Generic (
        bitx: integer := 8; -- 8-bit veri
        adr_bits: integer := 4 -- veri sayýsý 
    );    
    Port (
        clk: in std_logic;
        rst: in std_logic;
        cikis: out std_logic
    );
end uyg101;

architecture Behavioral of uyg101 is
    component blokRAM
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
    end component;
    
    component dosyadanOKU
    Port (
        clk: in std_logic;
        rst: in std_logic;
        oku: out std_logic_vector(7 downto 0);
        son: out std_logic
    );
    end component;
    
    --genel sinyaller
    signal sayici: integer := 0;
    
    --dosya okuma sinyaller
    signal okunan_veri: std_logic_vector(7 downto 0);
    signal son_veri: std_logic;
    
    --genel sinyaller
    signal veri_sayici: integer := 0;
    signal islem_sirasi: std_logic_vector(2 downto 0) := (others => '0');
    
    --ram sinyaller
    signal ram_yaz_oku: std_logic;
    signal ram_aktif: std_logic := '0';
    signal ram_adres: std_logic_vector(adr_bits-1 downto 0):=(others=>'0');
    signal ram_gir: std_logic_vector(bitx-1 downto 0):=(others=>'0');
    signal ram_cik: std_logic_vector(bitx-1 downto 0);
        
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if son_veri = '0' then                
                ram_aktif <= '1';
                ram_yaz_oku <= '1';
                ram_adres <= conv_std_logic_vector(sayici, ram_adres'length);
                ram_gir <= okunan_veri;
                sayici <= sayici + 1;
            elsif son_veri = '1' then
                ram_yaz_oku <= '0';
                ram_adres <= conv_std_logic_vector(sayici, ram_adres'length);
                if sayici > 0 then
                    sayici <= sayici - 1;
                end if;
            end if;
        end if;
    end process;

    RAM: blokRAM
        Generic map(
            bitx => bitx, -- 8-bit veri
            adr_bits => adr_bits -- veri sayýsý    
        )
        port map(
            clk => clk,
            rst => rst,
            islem => islem_sirasi,
            aktif => ram_aktif,
            yaz_oku => ram_yaz_oku,
            adres => ram_adres,
            gir => ram_gir,
            cik => ram_cik        
        );
        
        DOSYA_OKU: dosyadanOKU
        port map(
            clk => clk,
            rst => rst,
            oku => okunan_veri,
            son => son_veri
        );

end Behavioral;
