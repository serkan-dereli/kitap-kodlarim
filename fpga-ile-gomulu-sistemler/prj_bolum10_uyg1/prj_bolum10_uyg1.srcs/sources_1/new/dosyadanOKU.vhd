----------------------------------------------------------------------------------
-- 11.08.2019, pazar, saat: 11:05, bugün kurban bayramý
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use std.textio.ALL;

entity dosyadanOKU is
    Port (
        clk: in std_logic;
        rst: in std_logic;
        oku: out std_logic_vector(7 downto 0)
    );
end dosyadanOKU;

architecture Behavioral of dosyadanOKU is
    constant DOSYA_YOLU_HASTA: string := "c:\tahlil_hasta.txt";
    signal data_oku: std_logic_vector(7 downto 0) := (others => '0');
begin
    process(clk)
        file dosya: text open read_mode is DOSYA_YOLU_HASTA;
        variable satir: line;
        variable data: integer;
    begin
        if rising_edge(clk) then
            if not endfile(dosya) then
                readline(dosya, satir);
                read(satir, data);
                data_oku <= conv_std_logic_vector(data, data_oku'length);
                oku <= data_oku;
            end if;
        end if;
    end process;
end Behavioral;

