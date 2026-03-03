library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Blink_LED is
    generic (
        -- For a 50 MHz clock, 50,000,000 cycles = 1 second.
        -- We'll toggle the LED every 25,000,000 cycles for a 1 Hz blink rate.
        MAX_COUNT : integer := 25000000 
    );
    port (
        clk     : in  STD_LOGIC;
        reset   : in  STD_LOGIC;
        led_out : out STD_LOGIC
    );
end Blink_LED;

architecture Behavioral of Blink_LED is
    signal counter : integer range 0 to MAX_COUNT := 0;
    signal led_state  : STD_LOGIC := '0';
begin

    process(clk, reset)
    begin
        if reset = '1' then
            counter <= 0;
            led_state <= '0';
        elsif rising_edge(clk) then
            if counter = MAX_COUNT - 1 then
                counter <= 0;
                led_state <= not led_state;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;

    led_out <= led_state;

end Behavioral;
