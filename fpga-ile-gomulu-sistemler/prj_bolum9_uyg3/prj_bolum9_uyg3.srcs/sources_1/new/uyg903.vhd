----------------------------------------------------------------------------------
-- hemogram tahlil içeriði
-- 07.08.2019, çarþ. saat: 17:17
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.std_logic_unsigned.ALL;

entity uyg903 is
    Port (
        clk: in std_logic;
        rst: in std_logic;
        aktif:in std_logic;
        adres: in std_logic_vector(3 downto 0); -- 16 adet veri
        alt : out std_logic_vector(7 downto 0); -- 8-bit veri
        ust : out std_logic_vector(7 downto 0) -- 8-bit veri
    );
end uyg903;

architecture Behavioral of uyg903 is
    type hafiza is ARRAY(0 to 15) of std_logic_vector(15 downto 0);
    -- rom bellek verileri dolduruluyor
    constant ROMbellek: hafiza := (
        -- ilk 8-bit alt deðer, sonraki üst deðer
        0 => "0000010100001011",
        1 => "0000010100000110",
        2 => "0000111000010010",
        3 => "0010011000101010",
        4 => "0101000001100001",
        5 => "0001101100011111",
        6 => "0000110100101000",
        7 => "0000011100001010",
        8 => "0000110100101011",
        9 => "0010101101000001",
        10 => "0000011000010101",
        11 => "0000011000001100",
        12 => "0010010100111000",
        others => (others=>'U'));
begin
    process(clk)
    begin
        if rst='1' then
            alt <= (others => 'Z');
            ust <= (others => 'Z');
        elsif rising_edge(clk) then
            if aktif = '1' then
                alt <= ROMbellek(conv_integer(adres))(15 downto 8);
                ust <= ROMbellek(conv_integer(adres))(7 downto 0);
            else
                alt <= (others=>'Z');
                ust <= (others=>'Z');
            end if;
        end if;
    end process;

end Behavioral;
