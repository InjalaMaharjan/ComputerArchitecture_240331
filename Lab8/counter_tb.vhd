library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity COUNTER_TB is
end entity COUNTER_TB;

architecture Simulation of COUNTER_TB is
    signal CLK      : std_logic := '0';
    signal RST      : std_logic := '0';
    signal UP       : std_logic := '1';
    signal COUNT_UP : std_logic_vector(3 downto 0);
    signal COUNT_UD : std_logic_vector(3 downto 0);
    constant CLK_PERIOD : time := 20 ns;
    signal sim_running : boolean := true;  -- control signal to stop clock
begin
    -- Clock generation with stop condition
    CLK <= not CLK after CLK_PERIOD / 2 when sim_running else CLK;

    -- Instantiate COUNTER_UP
    U1 : entity work.COUNTER_UP
        port map (
            CLK   => CLK,
            RST   => RST,
            COUNT => COUNT_UP
        );

    -- Instantiate COUNTER_UPDOWN
    U2 : entity work.COUNTER_UPDOWN
        port map (
            CLK   => CLK,
            RST   => RST,
            UP    => UP,
            COUNT => COUNT_UD
        );

    -- Stimulus process
    STIMULUS : process
    begin
        -- Reset both counters
        RST <= '1'; wait for 40 ns;
        RST <= '0';

        -- Count up for 10 clock cycles
        UP <= '1'; wait for 200 ns;

        -- Count down for 5 clock cycles
        UP <= '0'; wait for 100 ns;

        -- Reset and count up again
        RST <= '1'; wait for 40 ns;
        RST <= '0'; UP <= '1';
        wait for 200 ns;

        -- Stop simulation by halting clock
        sim_running <= false;
        wait;
    end process;
end architecture Simulation;
