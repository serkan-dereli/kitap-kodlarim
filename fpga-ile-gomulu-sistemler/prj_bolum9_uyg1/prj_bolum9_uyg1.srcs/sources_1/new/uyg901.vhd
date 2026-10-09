----------------------------------------------------------------------------------
-- 06.08.2019, salý. 09:41
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use std.textio.ALL;

entity uyg901 is
    Port (
        clk : in std_logic;
        rst : in std_logic;
        veri : out std_logic_vector(7 downto 0)
    );
end uyg901;

architecture Behavioral of uyg901 is
    constant DOSYA_YOLU : string := "c:\tahlil_sonuc.txt";
    signal data_oku : std_logic_vector(7 downto 0) := (others => '0');
begin
    process(clk)
        file dosya: text open read_mode is DOSYA_YOLU;
        variable satir: line;
        variable data : integer;
    begin
        if rising_edge(clk) then
            if not endfile(dosya) then
                --readline(dosya, satir);
                read(satir, data);
                data_oku <= conv_std_logic_vector(data, data_oku'length);
                veri <= data_oku;
            end if;
        end if;
    end process;

end Behavioral;
