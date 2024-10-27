library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux is
    Port (
        sel     : in  STD_LOGIC_VECTOR(1 downto 0);
        seg_in0 : in  STD_LOGIC_VECTOR(6 downto 0);
        seg_in1 : in  STD_LOGIC_VECTOR(6 downto 0);
        seg_in2 : in  STD_LOGIC_VECTOR(6 downto 0);
        seg_in3 : in  STD_LOGIC_VECTOR(6 downto 0);
        seg_out : out STD_LOGIC_VECTOR(6 downto 0)
    );
end mux;

architecture Behavioral of mux is
begin
    process(sel, seg_in0, seg_in1, seg_in2, seg_in3)
    begin
        case sel is
            when "00" => seg_out <= seg_in0;
            when "01" => seg_out <= seg_in1;
            when "10" => seg_out <= seg_in2;
            when "11" => seg_out <= seg_in3;
            when others => seg_out <= (others => '0');
        end case;
    end process;
end Behavioral;