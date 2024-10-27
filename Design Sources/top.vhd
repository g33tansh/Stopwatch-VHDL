library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity top is
    Port (
        clk         : in  STD_LOGIC;
        reset       : in  STD_LOGIC;
        start_stop  : in  STD_LOGIC;
        seg_out     : out STD_LOGIC_VECTOR(6 downto 0);
        anode       : out STD_LOGIC_VECTOR(3 downto 0)
    );
end top;

architecture Behavioral of top is
    -- Internal signals
    signal clk_10hz   : STD_LOGIC;
    signal clk_250hz  : STD_LOGIC;
    signal count_16   : STD_LOGIC_VECTOR(15 downto 0);
    signal count_2    : STD_LOGIC_VECTOR(1 downto 0);
    signal paused     : STD_LOGIC := '1';
    signal enable     : STD_LOGIC;

begin
    -- Instantiate 10 Hz Clock Divider
    clock_10hz_inst : entity work.tenhz
        Port map (
            clk_in  => clk,
            clk_out => clk_10hz
        );

    -- Instantiate 250 Hz Clock Divider
    clock_250hz_inst : entity work.twofiftyhz
        Port map (
            clk_in  => clk,
            clk_out => clk_250hz
        );

    -- Instantiate 16-bit Counter (only increments if `enable` is high)
    counter_16bit_inst : entity work.sixteenbit 
        Port map (
            clk       => clk_10hz,
            reset     => reset,
            enable    => enable,
            count_out => count_16
        );

    -- Instantiate 2-bit Counter for Multiplexing
    counter_2bit_inst : entity work.twobit
        Port map (
            clk       => clk_250hz,
            reset     => reset,
            count_out => count_2
        );

    -- Control Logic for Start/Stop Functionality
    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                enable <= '0';          -- Stop when reset
                paused <= '1';
            elsif start_stop = '1' then
                paused <= NOT paused;   -- Toggle pause/resume on start/stop input
            end if;
            enable <= NOT paused;       -- Enable counter when not paused
        end if;
    end process;

    -- Instantiate Encoder
    encoder_inst : entity work.encoder
        Port map (
            binary_in => count_16(3 downto 0),
            seg_out   => seg_out
        );

    -- Instantiate Multiplexer
    mux_inst : entity work.mux
        Port map (
            sel     => count_2,
            seg_in0 => count_16(3 downto 0),
            seg_in1 => count_16(7 downto 4),
            seg_in2 => count_16(11 downto 8),
            seg_in3 => count_16(15 downto 12),
            seg_out => seg_out
        );

    -- Control Anodes for 7-Segment Display
    process(count_2)
    begin
        case count_2 is
            when "00" => anode <= "1110";  -- Activate the first digit
            when "01" => anode <= "1101";  -- Activate the second digit
            when "10" => anode <= "1011";  -- Activate the third digit
            when "11" => anode <= "0111";  -- Activate the fourth digit
            when others => anode <= "1111"; -- Default case (all off)
        end case;
    end process;

end Behavioral;