----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:45:48 03/22/2015 
-- Design Name: 
-- Module Name:    Yreg - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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

entity Yreg IS PORT(
    d   : IN std_logic_vector(15 downto 0):="0000000000000000";
    load  : IN STD_LOGIC; -- load/enable.
    clr : IN STD_LOGIC; -- async. clear.
    clk : IN STD_LOGIC; -- clock.
    q   : OUT std_logic_vector(15 downto 0) -- output.
);
end Yreg;

ARCHITECTURE description OF Yreg IS

BEGIN
    process(clk, clr,d)
    begin
        if clr = '1' then --clears the register
            q <= "0000000000000000";
        elsif rising_edge(clk) then 
            if rising_edge(load) then --loads register
                q <= d; --stores value
            end if;
			end if;
	end process;
END description;
