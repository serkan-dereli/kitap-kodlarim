----------------------------------------------------------------------------------
-- 02.08.2019 cuma, 22:40
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity uyg84 is
    Port ( 
        clk : in std_logic;
        rst : in std_logic;
        fotosel : in std_logic_vector(3 downto 0);
        sise : out std_logic_vector(1 downto 0)
    );
end uyg84;

architecture Behavioral of uyg84 is

begin
    process(clk,rst)
    begin
        if rst = '1' then
            sise <= (others => '0');
        elsif rising_edge(clk) then
            case fotosel is        
                when x"1" | x"2" | x"4" | x"8" => --üretim hatasý
                    sise <= "XX";
                when x"3" | x"6" | x"9" | x"c" => --1 lt
                    sise <= "01";
                when x"7" | x"b" | x"d" | x"e" => --2 lt
                    sise <= "10";
                when x"f" => --3 lt
                    sise <= "11";
                when others => --bantta þiþe yok
                    sise <= (others => '0'); 
            end case;
        end if;
    end process;
end Behavioral;
