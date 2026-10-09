library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity uyg75 is
    Port ( 
        clk : in std_logic;
        rst : in std_logic;
        gir : in std_logic_vector(7 downto 0);
        cift : out std_logic;
        tek : out std_logic
    );
end uyg75;

architecture Behavioral of uyg75 is
begin
    process(clk,rst)
        variable sonuc : std_logic;
    begin
        if rst='1' then
            cift <= '0';
            tek <= '0';
        elsif rising_edge(clk) then
            sonuc := gir(0) XOR gir(1) XOR gir(2) XOR gir(3) XOR
                   gir(4) XOR gir(5) XOR gir(6) XOR gir(7);
            if sonuc = '0' then
                cift <= '1';
                tek <= '0';
            else
                cift <= '0';
                tek <= '1';
            end if;             
        end if;
    end process;
end Behavioral;
