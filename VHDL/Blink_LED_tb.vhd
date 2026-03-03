library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Blink_LED_tb is
end Blink_LED_tb;

architecture Behavioral of Blink_LED_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    component Blink_LED
    generic (
        MAX_COUNT : integer
    );
    port(
         clk : in  std_logic;
         reset : in  std_logic;
         led_out : out  std_logic
        );
    end component;
    
    -- Inputs
    signal clk : std_logic := '0';
    signal reset : std_logic := '0';

    -- Outputs
    signal led_out : std_logic;

    -- Clock period definitions
    constant clk_period : time := 20 ns; -- 50 MHz clock
    
begin

    -- Instantiate the Unit Under Test (UUT)
    -- Using a very small MAX_COUNT for simulation purposes
    uut: Blink_LED 
    generic map (
        MAX_COUNT => 5
    )
    port map (
          clk => clk,
          reset => reset,
          led_out => led_out
        );

    -- Clock process definitions
    clk_process :process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin       
        -- hold reset state for 100 ns.
        reset <= '1';
        wait for 100 ns;    
        reset <= '0';

        wait for clk_period*20;

        -- finish simulation
        assert false report "Simulation Finished" severity failure;
    end process;

end Behavioral;
