----------------------------------------------------------------------------------
-- 19.08.2019, pazartesi
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;

entity uyg115 is
    Generic (
        bitx: integer := 32; -- 8-bit veri
        adr_bits: integer := 4 -- veri sayýsý 
    );
    Port ( 
        clk: in std_logic;
        rst: in std_logic;
        adr: in std_logic_vector(3 downto 0);
        cik: out std_logic_vector(31 downto 0)
    );
end uyg115;

architecture Behavioral of uyg115 is
    Component RandomSayi
        Generic ( n: integer := 32 );
        Port (
            clk: in std_logic;
            rst: in std_logic;
            aktif: in std_logic;
            rnd_gir: in std_logic_vector(n-1 downto 0);
            rnd_cik: out std_logic_vector(n-1 downto 0)
        );
    end Component;
    
    Component blokRAM
        Generic (
            bitx: integer := 32; -- 8-bit veri
            adr_bits: integer := 4 -- veri sayýsý 
        );
        Port (
            clk : in std_logic;
            rst : in std_logic;
            aktif: in std_logic;
            yaz_oku: in std_logic;
            adres: in std_logic_vector(adr_bits-1 downto 0);
            gir: in std_logic_vector(bitx-1 downto 0);
            cik: out std_logic_vector(bitx-1 downto 0)
        );
    end Component;

    COMPONENT Floating_BUYUK
      PORT (
        aclk : IN STD_LOGIC;
        s_axis_a_tvalid : IN STD_LOGIC;
        s_axis_a_tready : OUT STD_LOGIC;
        s_axis_a_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        s_axis_b_tvalid : IN STD_LOGIC;
        s_axis_b_tready : OUT STD_LOGIC;
        s_axis_b_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        m_axis_result_tvalid : OUT STD_LOGIC;
        m_axis_result_tready : IN STD_LOGIC;
        m_axis_result_tdata : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
      );
    END COMPONENT;

    COMPONENT Floating_KUCUK
      PORT (
        aclk : IN STD_LOGIC;
        s_axis_a_tvalid : IN STD_LOGIC;
        s_axis_a_tready : OUT STD_LOGIC;
        s_axis_a_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        s_axis_b_tvalid : IN STD_LOGIC;
        s_axis_b_tready : OUT STD_LOGIC;
        s_axis_b_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        m_axis_result_tvalid : OUT STD_LOGIC;
        m_axis_result_tready : IN STD_LOGIC;
        m_axis_result_tdata : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
      );
    END COMPONENT;
      
    -- 32-bitlik LFSR sinyalleri
    signal rnd_aktif: std_logic := '0';
    signal rnd32b: std_logic_vector(bitx-1 downto 0);
    signal rnd32b_tmp: std_logic_vector(bitx-1 downto 0) := x"3f73a29c";-- x"3ddf3b64"; --0.1089

    --ram sinyalleri
    signal ram_yaz_oku: std_logic;
    signal ram_aktif: std_logic := '0';
    signal ram_adres: std_logic_vector(adr_bits-1 downto 0):=(others=>'0');
    signal ram_gir: std_logic_vector(bitx-1 downto 0):=(others=>'0');
    signal ram_say: integer := 0;
    signal ram_cik: std_logic_vector(bitx-1 downto 0);
    
    --floating büyük
    signal a_valid, b_valid, r_tready: std_logic := '1';
    signal a_tready, b_tready, r_tvalid: std_logic; --output çýkýþlar
    signal buy_a, buy_b: std_logic_vector(31 downto 0):=(others => '0');
    signal buy_son: std_logic_vector(7 downto 0);
    
   --floating küçük     
     signal ak_tready, bk_tready, rk_tvalid: std_logic; --output çýkýþlar
     signal kuc_a: std_logic_vector(31 downto 0) := (others => '0');
     signal kuc_b: std_logic_vector(31 downto 0) := x"3f800000";-- 1.0
     signal kuc_son: std_logic_vector(7 downto 0);
   
    --sonlu durum makinesi tanýmalamasý
    type FSM_durumlar is (BOSTA,RASGELE,SIFIRDAN_BUYUK,SIFIRDAN_KUCUK,KAYDET);
    signal simdiki: FSM_durumlar := BOSTA;
    signal sonraki: FSM_durumlar;
    signal sayici: natural := 0;
    signal durum_biti: std_logic := '0'; 
    
    signal genel_say: integer := 0;        
    
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
        if rising_edge(clk) then
            case simdiki is
            when BOSTA=> --3 saykýl 
                sonraki <= RASGELE;          
                if sayici > 1 then
                    if ram_say >= 15 then
                        ram_aktif <= '1';
                        ram_yaz_oku <= '0';
                        ram_adres <= adr;
                        cik <= ram_cik;
                    else
                        durum_biti <= '1';
                    end if;                
                else
                    durum_biti <= '0';
                end if;
             
            when RASGELE=> --3 saykýl 
                sonraki <= SIFIRDAN_BUYUK;
                if sayici > 1 then 
                    durum_biti <= '1';
                    rnd_aktif <= '0'; 
                    buy_a <= rnd32b;
                    rnd32b_tmp <= rnd32b;               
                else
                    durum_biti <= '0';
                    rnd_aktif <= '1';
                end if;
               
            when SIFIRDAN_BUYUK=> --3 saykýl                     
                if sayici > 1 then
                    durum_biti <= '1';
                    if buy_son(0)='1' then
                        sonraki <= SIFIRDAN_KUCUK;
                        kuc_a <= buy_a;
                    else
                        sonraki <= RASGELE;                    
                    end if;                    
                else
                    durum_biti <= '0';
                end if; 
                    
            when SIFIRDAN_KUCUK=> --3 saykýl  
                if sayici > 1 then
                    durum_biti <= '1';
                    if kuc_son(0)='1' then
                        ram_gir <= kuc_a;
                        sonraki <= KAYDET;
                    else
                        sonraki <= RASGELE;                    
                    end if;                    
                else
                    durum_biti <= '0';
                end if; 
                                 
            when KAYDET=> --3 saykýl                
                ram_aktif <= '1';
                ram_yaz_oku <= '1'; 
                ram_adres <= conv_std_logic_vector(ram_say, ram_adres'length);             
                if sayici = 2 then
                    durum_biti <= '1';
                    ram_say <= ram_say + 1;                    
                    if ram_say = 15 then
                        sonraki <= BOSTA;
                    else
                        sonraki <= RASGELE;                        
                        ram_aktif <= '0';                      
                    end if;                   
                else
                    durum_biti <= '0';
                end if;              
            end case;
        end if;
    end process;
    
    process(clk,rst)
    begin
        if rst='1' then
            sayici <= 0;
        elsif rising_edge(clk) then
            genel_say <= genel_say + 1;
            if durum_biti = '0' then
                sayici <= sayici + 1;
            else 
                --durum_bit='1' ise
                sayici <= 0;
            end if;
        end if;
    end process;

    RASGELE_SAYI: RandomSayi
    Generic map (n => 32)
    Port map(
        clk => clk,
        rst => rst,
        aktif => rnd_aktif,
        rnd_gir => rnd32b_tmp,
        rnd_cik => rnd32b
    );

    SAYIDAN_BUYUK_MU : Floating_BUYUK
      PORT MAP (
        aclk => clk,
        s_axis_a_tvalid => a_valid,
        s_axis_a_tready => a_tready,
        s_axis_a_tdata => buy_a,
        s_axis_b_tvalid => b_valid,
        s_axis_b_tready => b_tready,
        s_axis_b_tdata => buy_b,
        m_axis_result_tvalid => r_tvalid,
        m_axis_result_tready => r_tready,
        m_axis_result_tdata => buy_son
      );

    SAYIDAN_KUCUK_MU : Floating_KUCUK
      PORT MAP (
        aclk => clk,
        s_axis_a_tvalid => a_valid,
        s_axis_a_tready => ak_tready,
        s_axis_a_tdata => kuc_a,
        s_axis_b_tvalid => b_valid,
        s_axis_b_tready => bk_tready,
        s_axis_b_tdata => kuc_b,
        m_axis_result_tvalid => rk_tvalid,
        m_axis_result_tready => r_tready,
        m_axis_result_tdata => kuc_son
      );

    
    RAM: blokRAM
    Generic map(
        bitx => bitx, -- 32-bit veri
        adr_bits => adr_bits -- veri sayýsý    
    )
    port map(
        clk => clk,
        rst => rst,
        aktif => ram_aktif,
        yaz_oku => ram_yaz_oku,
        adres => ram_adres,
        gir => ram_gir,
        cik => ram_cik        
    ); -- alt devreyi projeye ekleme kodu


end Behavioral;
