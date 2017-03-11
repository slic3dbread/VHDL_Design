library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity Led_Test is
	port (
		SW: in std_logic_vector(7 downto 0);
		LED: out std_logic_vector(7 downto 0)
	);
end Led_Test;

architecture Behavioral of Led_Test is

begin
	connect_leds: for i in 0 to 7 generate
		LED(i)<=SW(i);
	end generate;
end Behavioral;