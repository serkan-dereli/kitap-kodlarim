----------------------------------------------------------------------------------
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity uyg113 is
    Port ( 
        clk: in std_logic;
        rst: in std_logic;
        s1: in std_logic_vector(7 downto 0);
        s2: in std_logic_vector(7 downto 0);
        bolum: out std_logic_vector(7 downto 0);
        kalan: out std_logic_vector(7 downto 0)
    );
end uyg113;

architecture Behavioral of uyg113 is
        
    COMPONENT div_8bit
      PORT (
        aclk : IN STD_LOGIC;
        s_axis_divisor_tvalid : IN STD_LOGIC;
        s_axis_divisor_tdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        s_axis_dividend_tvalid : IN STD_LOGIC;
        s_axis_dividend_tdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        m_axis_dout_tvalid : OUT STD_LOGIC;
        m_axis_dout_tdata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
      );
    END COMPONENT;
    
    --bölme iþlemi sinyaller
    signal divisor_tvalid,dividend_tvalid,dout_tvalid: std_logic;
    signal divisor_tdata,dividend_tdata: std_logic_vector(7 downto 0);
    signal dout_tdata: std_logic_vector(15 downto 0);      
begin
    process(clk)
    begin
        if rst='1' then
            bolum <= (others => '0');
            kalan <= (others => '0');
        elsif rising_edge(clk) then
            divisor_tvalid <= '1';
            dividend_tvalid <= '1';
            divisor_tdata <= s1;
            dividend_tdata <= s2;
            bolum <= dout_tdata(15 downto 8);
            kalan <= dout_tdata(7 downto 0);                    
        end if;
    end process;
    
    BOLME : div_8bit
      PORT MAP (
        aclk => clk,
        s_axis_divisor_tvalid => divisor_tvalid,
        s_axis_divisor_tdata => divisor_tdata,
        s_axis_dividend_tvalid => dividend_tvalid,
        s_axis_dividend_tdata => dividend_tdata,
        m_axis_dout_tvalid => dout_tvalid,
        m_axis_dout_tdata => dout_tdata
      );      

end Behavioral;
