----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.07.2019 11:18:53
-- Design Name: 
-- Module Name: uyg52 - Behavioral
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
use IEEE.STD_LOGIC_SIGNED.ALL;

entity uyg52 is
    Port ( 
        clk : in std_logic;
        rst : in std_logic;
        anahtar : in std_logic;
        son : out std_logic_vector(3 downto 0)
    );
end uyg52;

architecture Behavioral of uyg52 is
    --signal say : std_logic_vector(3 downto 0) := (others=>'0');
begin
    process(clk,rst)
        variable say : std_logic_vector(3 downto 0) := (others=>'0');
        variable an : std_logic := '0';
    begin
        if (rst='1') then
            say := (others=>'0');        
        elsif rising_edge(clk) then
            an := anahtar;
                if (an='0') then
                    say := say + 1;
                else
                    say := say - 1;
                end if;
        end if;
        son <= say;
    end process;
    
end Behavioral;
