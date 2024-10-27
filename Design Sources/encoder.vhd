----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.10.2024 16:21:15
-- Design Name: 
-- Module Name: Encoder - Encoder Architecture
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

entity encoder is
    Port (
        binary_in  : in  STD_LOGIC_VECTOR(3 downto 0);  -- 4-bit binary input
        seg_out    : out STD_LOGIC_VECTOR(6 downto 0)   -- 7-bit segment output
    );
end encoder;

architecture Behavioral of encoder is
begin
    process(binary_in)
    begin
        case binary_in is
            when "0000" => seg_out <= "1000000";  -- Display 0
            when "0001" => seg_out <= "1111001";  -- Display 1
            when "0010" => seg_out <= "0100100";  -- Display 2
            when "0011" => seg_out <= "0110000";  -- Display 3
            when "0100" => seg_out <= "0011001";  -- Display 4
            when "0101" => seg_out <= "0010010";  -- Display 5
            when "0110" => seg_out <= "0000010";  -- Display 6
            when "0111" => seg_out <= "1111000";  -- Display 7
            when "1000" => seg_out <= "0000000";  -- Display 8
            when "1001" => seg_out <= "0010000";  -- Display 9
            when others => seg_out <= "1111111";  -- Blank (all segments off)
        end case;
    end process;
end Behavioral;

