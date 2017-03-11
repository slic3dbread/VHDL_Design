library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FourDigitSevenSegController is
	port(	mclk: in std_logic; -- FPGA internal clock
			enableSSegController: in std_logic;
			input: in std_logic_vector(15 downto 0);
			EN: out std_logic_vector(3 downto 0); -- enable for digit selector
			O: out std_logic_vector(3 downto 0) );
end FourDigitSevenSegController;

architecture Behavioral of FourDigitSevenSegController is
	signal clkdiv : std_logic_vector(1 downto 0);		-- counter for clock divider
	signal tempEN: std_logic_vector(3 downto 0);
	signal d1,d2,d3,d4: std_logic_vector(3 downto 0);  -- digit displayed on FPGA

begin
		-- parse input and save to digits displayed on FPGA
		d1(3) <= input(15);
		d1(2) <= input(14);
		d1(1) <= input(13);
		d1(0) <= input(12);
	
		d2(3) <= input(11);
		d2(2) <= input(10);
		d2(1) <= input(9);
		d2(0) <= input(8);
	
		d3(3) <= input(7);
		d3(2) <= input(6);
		d3(1) <= input(5);
		d3(0) <= input(4);
	
		d4(3) <= input(3);
		d4(2) <= input(2);
		d4(1) <= input(1);
		d4(0) <= input(0);
	
	process(mclk)	-- create system clock divder
	begin
		if mclk = '1' and mclk'Event then	
			clkdiv <= clkdiv +1;
		end if;	    
	end process;
	
	process(clkdiv(1)) -- display digits based on clock rate
	begin
		tempEN <= "1110"; -- Initialize EN to first display.
		
		if clkdiv(1) = '1' and clkdiv(1)'Event then
			if enableSSegController = '1' then -- if seven seg controller has been enabled
				case tempEN is
					when "1110" =>  
						O <= d1; -- Output first digit to be displayed on FPGA.
						tempEN <= "1101";
					when "1101" =>  
						O <= d2; -- Output second digit to be displayed on FPGA.
						tempEN <= "1011";
					when "1011" =>  
						O <= d3; -- Output third digit to be displayed on FPGA.
						tempEN <= "0111";
					when others  =>  
						O <= d4; -- Output fourth digit to be displayed on FPGA.
						tempEN <= "1110";
				end case;
				EN <= tempEN;
			end if;
		end if;
	end process;
	
end Behavioral;

