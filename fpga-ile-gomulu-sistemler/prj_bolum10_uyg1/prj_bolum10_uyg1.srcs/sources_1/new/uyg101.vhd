----------------------------------------------------------------------------------
-- 10.08.2019, cumartesi, yarýn kurban bayramý, 17:29 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.std_logic_unsigned.ALL;
use std.textio.ALL;

entity uyg101 is
    Generic (
        bits: integer := 16; -- 16-bit veri
        bitx: integer := 8; -- 8-bit veri
        adr_bits: integer := 4 -- veri sayýsý
    );  
    Port (
        clk: in std_logic;
        rst: in std_logic;
        sonuc: out std_logic
    );
end uyg101;

architecture Behavioral of uyg101 is
    component blokROM
        Generic(
            bits: integer := 16; -- 8-bit veri
            adr_bits: integer := 4 -- veri sayýsý    
        );
        port(
            clk: in std_logic;
            rst: in std_logic;
            islem: in std_logic_vector(2 downto 0);
            aktif:in std_logic;
            adres: in std_logic_vector(adr_bits-1 downto 0); -- 16 adet veri
            cik : out std_logic_vector(2**adr_bits downto 0) -- 16-bitlik veri
        );
    end component;
    
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
            islem: in std_logic_vector(2 downto 0);
            oku: out std_logic_vector(7 downto 0)
        );
    end component;
    
    component dosyayaYAZ
        Port (
            clk: in std_logic;
            rst: in std_logic;
            islem: in std_logic_vector(2 downto 0);
            gir: in std_logic_vector(7 downto 0);
            sonuc: out std_logic
        );
    end component;
    
    --genel sinyaller
    signal veri_sayici: integer := 0;
    signal islem_sirasi: std_logic_vector(2 downto 0) := (others => '0');
    
    --rom sinyaller
    signal rom_aktif: std_logic := '0';
    signal rom_adres: std_logic_vector(adr_bits-1 downto 0):=(others=>'0');
    signal rom_cik: std_logic_vector(2**adr_bits downto 0):=(others=>'0');
    
    --ram sinyaller
    signal ram_yaz_oku: std_logic;
    signal ram_aktif: std_logic := '0';
    signal ram_adres: std_logic_vector(adr_bits-1 downto 0):=(others=>'0');
    signal ram_gir: std_logic_vector(2**adr_bits downto 0):=(others=>'0');
    signal ram_cik: std_logic_vector(2**adr_bits downto 0):=(others=>'0');
    
    --dosya okuma sinyaller
    signal okunan_veri: std_logic_vector(7 downto 0);
    
    --dosya yazma sinyaller
    signal yazilan_veri : std_logic_vector(7 downto 0);
    signal son : std_logic := '0';
    
    --sonlu durum makinesi tanýmalamasý
    type FSM_durumlar is (BOSTA,ROM_DOLDUR,RAM_DOLDUR,KARSILASTIR,DOSYAYA_YAZ);
    signal simdiki: FSM_durumlar := BOSTA;
    signal sonraki: FSM_durumlar;
    signal sayici: natural := 0;
    signal durum_biti: std_logic := '0';
   
begin
    -- Durum saklayýcýsý
    process(clk,rst)
    begin
        if(rst='1') then
            simdiki <= BOSTA;
        elsif(rising_edge(clk)) then
            if durum_biti = '1' then
                simdiki <= sonraki;                          
	        end if;
	    end if;
    end process;

    --kombinasyonel devre
    process(clk)
    begin
        case simdiki is
            when BOSTA => --2 saykýl, islem=000
                sonraki <= ROM_DOLDUR;        
                if sayici > 2 then
                    durum_biti <= '1';                    
                else
                    durum_biti <= '0';
                end if;
             
            when ROM_DOLDUR => --5 saykýl, islem=001
                sonraki <= RAM_DOLDUR;               
                if sayici > 2 then 
                    durum_biti <= '1';                    
                else
                    durum_biti <= '0';
                end if;
               
            when RAM_DOLDUR => --5 saykýl, islem=010 
                sonraki <= KARSILASTIR;    
                if sayici > 4 then
                    durum_biti <= '1';                    
                else
                    durum_biti <= '0';
                end if; 
                    
            when KARSILASTIR => --5 saykýl, islem=011
                sonraki <= DOSYAYA_YAZ;      
                if sayici > 4 then
                    durum_biti <= '1';                    
                else
                    durum_biti <= '0';
                end if;              
                                 
            when DOSYAYA_YAZ => --7 saykýl, islem=100
                sonraki <= BOSTA;    
                if sayici > 6 then
                    durum_biti <= '1';                    
                else
                    durum_biti <= '0';
                end if; 
                                    
        end case;
    end process;

    process(clk,rst)
    begin
        if rst='1' then
            sayici <= 0;
        elsif rising_edge(clk) then
            if durum_biti = '0' then
                sayici <= sayici + 1;
            else                 
                sayici <= 0; --durum_bit='1' ise
            end if;
        end if;
    end process;
    
    ROM: blokROM
    Generic map(
        bits => bits, -- 16-bit veri
        adr_bits => adr_bits -- veri sayýsý    
    )
    port map(
        clk => clk,
        rst => rst,
        islem => islem_sirasi,
        aktif => rom_aktif,
        adres => rom_adres,
        cik => rom_cik        
    );
    
    RAM: blokRAM
        Generic map(
            bitx => bitx, -- 8-bit veri
            adr_bits => adr_bits -- veri sayýsý    
        )
        port map(
            clk => clk,
            rst => rst,
            islem => islem_sirasi,
            aktif => rom_aktif,
            yaz_oku => ram_yaz_oku,
            adres => ram_adres,
            gir => ram_gir,
            cik => ram_cik        
        );
        
        DOSYA_OKU: dosyadanOKU
        port map(
            clk => clk,
            rst => rst,
            islem => islem_sirasi,
            oku => okunan_veri
        );
        
        DOSYA_YAZ: dosyayaYAZ
        port map(
            clk => clk,
            rst => rst,
            islem => islem_sirasi,
            gir => yazilan_veri,
            sonuc => son
        );
end Behavioral;