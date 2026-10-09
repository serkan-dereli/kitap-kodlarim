----------------------------------------------------------------------------------
-- 04.08.2019 pazar, 17:03 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.std_logic_unsigned.ALL;

entity uyg88 is
    Generic ( n: natural := 4 );
    Port ( 
        clk : in std_logic;
        rst : in std_logic;
        gir : in std_logic_vector(2*n-1 downto 0);
        cik : out std_logic_vector(2*n-1 downto 0)
    );
end uyg88;

architecture Behavioral of uyg88 is
    --fonksiyon tanýmlamasý
    function carpim(a, b: std_logic_vector(n-1 downto 0)) 
            return std_logic_vector is
        variable ta, tb: std_logic_vector(n-1 downto 0);
        variable ts: std_logic_vector(2*n-1 downto 0);        
    begin
        ta := a;
        tb := b;
        ts := (others=>'0');
        for i in n-1 downto 0 loop
            ts := ts(2*n-2 downto 0) & '0';
            if tb(i) = '1' then
                ts := ts + ta;
            end if;
        end loop; 
        return ts;  
    end carpim; 
    --fonksiyon sonu            
begin
    --ana process baþlangýcý
    process(clk,rst)
        variable t1,t2 : std_logic_vector(n-1 downto 0);
        variable t : std_logic_vector(2*n-1 downto 0);
    begin
        if rst='1' then
            cik <= (others => '0');
        elsif rising_edge(clk) then
            t1 := gir(n-1 downto 0);
            t2 := gir(2*n-1 downto n);
            t := carpim(t1,t2);
            cik <= t;
        end if;    
    end process;
end Behavioral;
