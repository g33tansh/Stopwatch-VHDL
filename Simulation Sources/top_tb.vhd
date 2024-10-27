library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity top_tb is
end top_tb;

architecture Behavioral of top_tb is
    -- Component Declaration for the Unit Under Test (UUT)
    component top
        Port (
            clk         : in  STD_LOGIC;
            reset       : in  STD_LOGIC;
            start_stop  : in  STD_LOGIC;
            seg_out     : out STD_LOGIC_VECTOR(6 downto 0);
            anode       : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    -- Signals for the testbench
    signal clk         : STD_LOGIC := '0';
    signal reset       : STD_LOGIC := '0';
    signal start_stop  : STD_LOGIC := '0';
    signal seg_out     : STD_LOGIC_VECTOR(6 downto 0);
    signal anode       : STD_LOGIC_VECTOR(3 downto 0);

    -- Clock period definitions
    constant clk_period : time := 10 ns; -- 100 MHz clock

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: top
        Port map (
            clk         => clk,
            reset       => reset,
            start_stop  => start_stop,
            seg_out     => seg_out,
            anode       => anode
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
        -- Hold reset state for 100 ns.
        reset <= '1';
        wait for 100 ns;
        reset <= '0';

        -- Start the stopwatch
        start_stop <= '1';
        wait for 20 ns;
        start_stop <= '0';

        -- Wait for some time to observe the counting
        wait for 1 ms;

        -- Stop the stopwatch
        start_stop <= '1';
        wait for 20 ns;
        start_stop <= '0';

        -- Wait for some time to observe the paused state
        wait for 500 ms;

        -- Start the stopwatch again
        start_stop <= '1';
        wait for 20 ns;
        start_stop <= '0';

        -- Wait for some time to observe the counting
        wait for 1 ms;

        -- Stop the simulation
        wait;
    end process;

end Behavioral;