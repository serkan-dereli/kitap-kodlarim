----------------------------------------------------------------------------------
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;

entity uyg63 is
    Port (
        clk : in std_logic;
        rst : in std_logic;
        taban : in std_logic_vector(3 downto 0);
        us : in std_logic_vector(1 downto 0);
        sonuc : out std_logic_vector(15 downto 0);
        abs_mi : out std_logic
    );
end uyg63;

architecture Behavioral of uyg63 is
    
begin
    process(clk,rst)
        variable t, u : integer;
        variable abs_kullan : std_logic := '0';
    begin
        if (rst='1') then
            sonuc <= (others => '0');
            abs_mi <= '0';
        elsif rising_edge(clk) then
            t := conv_integer(signed(taban));
            u := conv_integer(unsigned(us));
            if (t<0) then
                t := ABS(t);
                abs_kullan := '1';
            else
                abs_kullan := '0';
            end if;
            abs_mi <= abs_kullan;
            sonuc <= conv_std_logic_vector((t**u),sonuc'length);
        end if;
    end process;
end Behavioral;
