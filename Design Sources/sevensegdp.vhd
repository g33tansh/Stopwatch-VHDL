----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.10.2024 16:21:15
-- Design Name: 
-- Module Name: 7segdp - 7 Segment Display Architecture
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

entity sevensegdp is
    Port (
        binary_in : in  STD_LOGIC_VECTOR(3 downto 0);  -- 4-bit binary input
        seg_out   : out STD_LOGIC_VECTOR(6 downto 0)   -- 7-bit output to control segments
    );
end sevensegdp;

architecture Behavioral of sevensegdp is
begin
    process(binary_in)
    begin
        case binary_in is
            when "0000" => seg_out <= "1000000"; -- 0
            when "0001" => seg_out <= "1111001"; -- 1
            when "0010" => seg_out <= "0100100"; -- 2
            when "0011" => seg_out <= "0110000"; -- 3
            when "0100" => seg_out <= "0011001"; -- 4
            when "0101" => seg_out <= "0010010"; -- 5
            when "0110" => seg_out <= "0000010"; -- 6
            when "0111" => seg_out <= "1111000"; -- 7
            when "1000" => seg_out <= "0000000"; -- 8
            when "1001" => seg_out <= "0010000"; -- 9
            when others => seg_out <= "1111111"; -- Blank or invalid input
        end case;
    end process;
end Behavioral;
