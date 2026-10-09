----------------------------------------------------------------------------------
-- 06.08.2019, salý. 09:41
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use std.textio.ALL;

entity uyg902 is
    Port (
        clk : in std_logic;
        rst : in std_logic;
        gir : in std_logic_vector(7 downto 0);
        veri : out std_logic_vector(7 downto 0)
    );
end uyg902;

architecture Behavioral of uyg902 is
    constant DOSYA_YOLU : string := "c:\verilerim.txt";
begin
    process(clk)
        file dosya: text open write_mode is DOSYA_YOLU;
        variable satir: line;
        variable data : integer;
    begin
        if rising_edge(clk) then
            data := conv_integer(unsigned(gir)); 
            write(satir, data);
            writeline(dosya, satir);
        end if;
    end process;

end Behavioral;
