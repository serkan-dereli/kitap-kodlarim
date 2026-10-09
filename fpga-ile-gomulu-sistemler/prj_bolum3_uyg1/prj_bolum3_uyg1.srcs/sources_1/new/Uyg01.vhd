----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.07.2019 21:48:35
-- Design Name: 
-- Module Name: Uyg01 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Uyg01 is
    Port ( 
        clk  : in std_logic;
        rst  : in std_logic;
        s1   : in std_logic_vector(7 downto 0);
        s2   : in std_logic_vector(7 downto 0);
        secim: in std_logic;
        cikis: out std_logic_vector(7 downto 0) 
    );
end Uyg01;

architecture Behavioral of Uyg01 is

begin
    process(clk,rst)
    begin
        if (rst = '1') then
            cikis <= (others => '0');
        elsif(rising_edge(clk)) then
            if (secim = '1') then
                cikis <= s1;
            elsif (secim = '0') then
                cikis <= s2;
            else
                cikis <= (others => '0');
            end if;
        end if;
    end process;

end Behavioral;
