-- filter_design.vhd
-- Simple VHDL filter example
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity filter is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR(15 downto 0);
           data_out : out STD_LOGIC_VECTOR(15 downto 0));
end filter;

architecture Behavioral of filter is
begin
    process(clk, reset)
    begin
        if reset = '1' then
            data_out <= (others => '0');
        elsif rising_edge(clk) then
            -- simple pass‑through for demonstration
            data_out <= data_in;
        end if;
    end process;
end Behavioral;
