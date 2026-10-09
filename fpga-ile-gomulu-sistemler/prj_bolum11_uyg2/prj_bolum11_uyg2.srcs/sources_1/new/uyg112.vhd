----------------------------------------------------------------------------------
-- 14.08.2019, çarþamba, 20:34
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity uyg112 is
    Port (
        clk: in std_logic;
        rst: in std_logic;
        sin: out std_logic_vector(15 downto 0);
        cos: out std_logic_vector(15 downto 0)
    );
end uyg112;

architecture Behavioral of uyg112 is
    COMPONENT Cordic_0
      PORT (
        aclk : IN STD_LOGIC;
        s_axis_phase_tvalid : IN STD_LOGIC;
        s_axis_phase_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        m_axis_dout_tvalid : OUT STD_LOGIC;
        m_axis_dout_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
      );
    END COMPONENT;
    
    -- genel sinyaller
    signal sayici: integer := 0;
    
    -- cordic sinyaller
    signal cor_valid_in : std_logic := '0';
    signal cor_valid_out : std_logic;
    signal cor_value_in: std_logic_vector(15 downto 0);
    signal cor_value_out: std_logic_vector(31 downto 0);
    
begin
    process(clk)
    begin
        if rising_edge(clk) then
            sayici <= sayici + 1;
            cor_valid_in <= '1';
        end if;
    end process;

    process(cor_value_out)
    begin    
        sin <= cor_value_out(31 downto 16);
        cos <= cor_value_out(15 downto 0);
    end process;

    TRIGONOMETRI_SINCOS : Cordic_0
      PORT MAP (
        aclk => clk,
        s_axis_phase_tvalid => '1',
        s_axis_phase_tdata => cor_value_in,
        m_axis_dout_tvalid => cor_valid_out,
        m_axis_dout_tdata => cor_value_out
      );
end Behavioral;
