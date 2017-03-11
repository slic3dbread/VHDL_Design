library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity flash_leds is
	port
	(
		mclk: in std_logic;
		leds: out std_logic_vector(7 downto 0)
	);
end flash_leds;

architecture Behavioral of flash_leds is
	signal temp_leds : std_logic_vector(7 downto 0);	-- temporary storage for ssg
	signal clkdiv : std_logic_vector(20 downto 0);		-- counter for clock divider
begin 


	process (mclk)						-- create system clock divder
	begin
		if mclk = '1' and mclk'Event then	
			clkdiv <= clkdiv +1;
		end if;	    
	end process;



	process(clkdiv(20))			   
	begin
	--temp_leds<="00000001";
	if clkdiv(20) = '1' and clkdiv(20)'Event then
			case temp_leds is				--used to rotate leds to light up
		 		when "00000001"  => 
					temp_leds <= "00000010";
				when "00000010"  => 
					temp_leds <= "00000100";
				when "00000100"  => 
					temp_leds <= "00001000";
				when "00001000"  => 
					temp_leds <= "00010000";
				when "00010000" => 
					temp_leds <= "00100000";
				when "00100000" => 
					temp_leds <= "01000000";
				when "01000000" => 
					temp_leds <= "10000000";
				when "10000000" => 
					temp_leds <= "00000001";
				when others =>
					temp_leds<="00000001";
			end case;
	end if;
	end process;
	
	leds <= temp_leds;	--output ssg

end Behavioral;