----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.07.2019 09:52:06
-- Design Name: 
-- Module Name: Uyg42 - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Uyg42 is
    Port ( 
        clk : in std_logic;
        rst : in std_logic;
        say : buffer std_logic_vector(3 downto 0)
    );
end Uyg42;

architecture Behavioral of Uyg42 is
begin
    process(clk,rst)
    begin
        if (rst = '1') then
            say <= (others => '0');
        elsif rising_edge(clk)
            say <= say + '0001';        
        end if;
    end process;
end Behavioral;
