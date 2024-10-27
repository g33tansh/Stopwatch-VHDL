----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Geetansh
-- 
-- Create Date: 27.10.2024 16:21:15
-- Design Name: 
-- Module Name: 10hzclock - Arch of 10 Hz Clock Divider for 16 Bit Counter
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created

-- This file defines the entity and architecture for a clock divider module that generates a 10 Hz output clock signal from an input clock signal.
-- The input clock signal is provided through the "clk_in" port, and the output clock signal is generated and provided through the "clk_out" port.

library IEEE; -- Importing the IEEE library for standard logic types and operations.
use IEEE.STD_LOGIC_1164.ALL; -- Using the standard logic types and operations from the IEEE library.
use IEEE.STD_LOGIC_ARITH.ALL; -- Using the standard logic arithmetic operations from the IEEE library.
use IEEE.STD_LOGIC_UNSIGNED.ALL; -- Using the standard logic unsigned operations from the IEEE library.

entity tenhz is
    Port (
        clk_in  : in  STD_LOGIC;        -- Input clock (e.g., 100 MHz)
        clk_out : out STD_LOGIC         -- Output clock (10 Hz)
    );
end tenhz;

architecture Behavioral of tenhz is
    signal counter : INTEGER := 0;      -- Counter for clock division
    constant DIVISOR : INTEGER := 5000000; -- 100 MHz / 10 Hz = 10,000,000 / 2 (for toggling)
    signal clk_out_internal : STD_LOGIC := '0'; -- Internal signal for clk_out
begin
    process(clk_in)
    begin
        if rising_edge(clk_in) then -- Check for rising edge of the input clock signal.
            if counter = DIVISOR - 1 then -- Check if the counter has reached the desired division value.
                clk_out_internal <= NOT clk_out_internal;  -- Toggle output clock signal
                counter <= 0;             -- Reset the counter
            else
                counter <= counter + 1;   -- Increment counter
            end if;
        end if;
    end process;

    clk_out <= clk_out_internal; -- Assign internal signal to output port
end Behavioral;