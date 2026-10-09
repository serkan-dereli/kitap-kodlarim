----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.07.2019 15:24:47
-- Design Name: 
-- Module Name: Uyg41 - Behavioral
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

entity Uyg41 is
    Port ( 
        clk      : in std_logic;
        rst      : in std_logic;
        sayi_16b : in std_logic_vector(15 downto 0);
        say1_8b  : out std_logic_vector(7 downto 0);
        say2_8b  : out std_logic_vector(7 downto 0)
    );
end Uyg41;

architecture Behavioral of Uyg41 is

begin
    process(clk, rst)
    begin
        if (rst = '1') then
            say1_8b <= (others => '0');
            say2_8b <= (others => '0');
        elsif rising_edge(clk) then
            say1_8b <= sayi_16b(7 downto 0);
            say2_8b <= sayi_16b(15 downto 8);
        end if;
    end process;
end Behavioral;
