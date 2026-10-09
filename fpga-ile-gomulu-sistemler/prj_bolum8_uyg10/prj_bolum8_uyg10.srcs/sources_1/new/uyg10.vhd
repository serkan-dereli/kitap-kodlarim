----------------------------------------------------------------------------------
-- 05.08.2019, 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity uyg10 is
    Port (
        clk : in std_logic;
        rst : in std_logic;
        durula_biti : in std_logic;
        gosterge : out std_logic_vector(3 downto 0)
    );
end uyg10;

architecture Behavioral of uyg10 is
    --sonlu durum makinesi tanýmalamasý
    type FSM_durumlar is (BOSTA,BASLA,YIKA,DURULA,SIKMA,BITIR);
    signal simdiki : FSM_durumlar := BOSTA;
    signal sonraki : FSM_durumlar;
    signal sayici : natural := 0;
    signal durum_biti : std_logic := '0';
begin
    -- Durumlar arasý geçiþ process i
    process(clk,rst)
    begin
        if(rst='1') then
            simdiki <= BOSTA;            
        elsif(rising_edge(clk)) then
            if durum_biti = '1' then
                simdiki <= sonraki;                          
            end if;
        end if;
    end process;
    
    --kombinasyonel devre
    process(clk,simdiki)
    begin
        case simdiki is
            when BOSTA=> --3 saykýl 
                sonraki <= BASLA;
                gosterge <= "0000";          
                if sayici > 2 then
                    durum_biti <= '1';                    
                else
                    durum_biti <= '0';
                end if;
             
            when BASLA=> --3 saykýl 
                gosterge <= "0001";  
                if durula_biti = '1' then
                    sonraki <= DURULA;
                else
                    sonraki <= YIKA;     
                end if;
                if sayici > 2 then
                    durum_biti <= '1';                    
                else
                    durum_biti <= '0';
                end if;
               
            when YIKA=> --5 saykýl    
                sonraki <= DURULA; 
                gosterge <= "0010";   
                if sayici > 4 then
                    durum_biti <= '1';                    
                else
                    durum_biti <= '0';
                end if; 
                    
            when DURULA=> --5 saykýl  
                sonraki <= SIKMA; 
                gosterge <= "0011";     
                if sayici > 4 then
                    durum_biti <= '1';                    
                else
                    durum_biti <= '0';
                end if;              
                                 
            when SIKMA=> --7 saykýl   
                sonraki <= BITIR;  
                gosterge <= "0100";  
                if sayici > 6 then
                    durum_biti <= '1';                    
                else
                    durum_biti <= '0';
                end if;              

            when BITIR=> --3 saykýl   
                sonraki <= BOSTA;
                gosterge <= "0101";     
                if sayici > 2 then
                    durum_biti <= '1';                    
                else
                    durum_biti <= '0';
                end if;
            
            when others => NULL;        
        end case;
    end process;
    
    process(clk,rst)
    begin
        if rst='1' then
            sayici <= 0;
        elsif rising_edge(clk) then
            if durum_biti = '0' then
                sayici <= sayici + 1;
            else 
                --durum_bit='1' ise
                sayici <= 0;
            end if;
        end if;
    end process;

end Behavioral;
