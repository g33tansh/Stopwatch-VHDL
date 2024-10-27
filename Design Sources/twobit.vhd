----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.10.2024 16:21:15
-- Design Name: 
-- Module Name: 2bitcounter - 2-Bit Counter for Display
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
use IEEE.STD_LOGIC_ARITH.ALL; -- Optional, depending on your usage
use IEEE.STD_LOGIC_UNSIGNED.ALL; -- Optional, depending on your usage

entity twobit is
    Port (
        clk       : in  STD_LOGIC;        -- Clock input
        reset     : in  STD_LOGIC;        -- Reset signal
        count_out : out STD_LOGIC_VECTOR(1 downto 0)  -- 2-bit output
    );
end twobit;

architecture Behavioral of twobit is
    signal counter : INTEGER := 0;      -- Internal counter
begin
    process(clk, reset)
    begin
        if reset = '1' then
            counter <= 0;                 -- Reset counter to 0
        elsif rising_edge(clk) then
            if counter = 3 then           -- Maximum value for 2-bit counter (3)
                counter <= 0;             -- Reset to 0 after reaching 3
            else
                counter <= counter + 1;   -- Increment counter
            end if;
        end if;
    end process;

    count_out <= std_logic_vector(to_unsigned(counter, 2));  -- Convert integer to 2-bit std_logic_vector
end Behavioral;
