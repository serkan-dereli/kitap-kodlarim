----------------------------------------------------------------------------------
-- 11.08.2019, pazar, 11:25, bugün kurban bayramý
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use std.textio.ALL;

entity dosyayaYAZ is
    Port (
        clk: in std_logic;
        rst: in std_logic;
        gir: in std_logic_vector(7 downto 0);
        sonuc: out std_logic
    );
end dosyayaYAZ;

architecture Behavioral of dosyayaYAZ is
    constant DOSYA_YOLU_HASTA_SONUC: string := "c:\hasta_sonuc.txt";
begin
    process(clk)
        file dosya: text open write_mode is DOSYA_YOLU_HASTA_SONUC;
        variable satir: line;
        variable data: integer;
    begin
        if rising_edge(clk) then
            data := conv_integer(unsigned(gir)); 
            write(satir, data);
            writeline(dosya, satir);
            sonuc <= '1';
        end if;
    end process;
end Behavioral;