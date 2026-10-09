library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.std_logic_unsigned.ALL;
use std.textio.ALL;

entity blokROM is
    Generic (
        bits: integer := 16; -- 8-bit veri
        adr_bits: integer := 4 -- veri sayýsý 
    );

    Port (
        clk: in std_logic;
        rst: in std_logic;
        islem : in std_logic_vector(2 downto 0);
        aktif:in std_logic;
        adres: in std_logic_vector(adr_bits-1 downto 0); -- 16 adet veri
        cik : out std_logic_vector(2**adr_bits-1 downto 0) -- 16-bitlik veri
    );
end blokROM;

architecture Behavioral of blokROM is
    constant DOSYA_YOLU: string := "c:\tahlil_genel.txt";
    
    type hafiza is ARRAY(0 to 15) of std_logic_vector(15 downto 0);
    signal ROMbellek: hafiza;
    
    procedure DOSYADAN_ROMa_YUKLE(signal ROMbellek: inout hafiza) is
        file dosya: text open read_mode is DOSYA_YOLU;
        variable satir: line;
        variable data: integer;
    begin
        for i in 0 to 2**adr_bits-1 loop
            if endfile(dosya) then
                exit;
            else
                readline(dosya, satir);
                read(satir, data);
                ROMbellek(i) <= conv_std_logic_vector(data, bits);
            end if;
        end loop;    
    end procedure;
begin        
    process(clk)        
    begin
        if rising_edge(clk) then
            if aktif = '1' then
                cik <= ROMbellek(conv_integer(adres));
            elsif islem = "001" then
                DOSYADAN_ROMa_YUKLE(ROMbellek);      
            end if;
        end if;
    end process;
end Behavioral;