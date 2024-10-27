----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.10.2024 16:21:15
-- Design Name: 
-- Module Name: 16bitcounter - 16-Bit Counter Architecture
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sixteenbit is
    Port (
        clk       : in  STD_LOGIC;                   -- Clock input
        reset     : in  STD_LOGIC;                   -- Reset signal
        enable    : in  STD_LOGIC;                   -- Enable signal for counting
        count_out : out STD_LOGIC_VECTOR(15 downto 0) -- 16-bit counter output
    );
end sixteenbit;

architecture Behavioral of sixteenbit is
    signal counter : STD_LOGIC_VECTOR(15 downto 0) := (others => '0'); -- Internal 16-bit counter signal
begin
    process(clk, reset)
    begin
        if reset = '1' then
            counter <= (others => '0');              -- Reset counter to 0
        elsif rising_edge(clk) then
            if enable = '1' then                     -- Check if counter is enabled
                counter <= counter + 1;              -- Increment counter
            end if;
        end if;
    end process;

    count_out <= counter;                            -- Output the counter value
end Behavioral;
