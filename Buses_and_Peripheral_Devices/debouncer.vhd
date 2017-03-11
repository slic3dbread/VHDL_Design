-- VHDL Code For Debouncer Provided in ENGG2410 - Lab 7

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity debouncer is
    Port ( button : in  STD_LOGIC;
           mclk : in  STD_LOGIC;
           debouncedButton : out  STD_LOGIC);
end debouncer;

architecture Behavioral of debouncer is
	signal d1, d2, reset, cout : std_logic;
	signal count : std_logic_vector(20 downto 0);
begin

	reset <= d1 xor d2;

	FF: process(mclk)
	begin
		if(mclk'event and mclk = '1') then
			d1 <= button;
			d2 <= d1;
			if(cout = '1') then
				debouncedButton <= d2;
			end if;
		end if;
	end process;

	CNTR: process(mclk, reset)
	begin
		if(reset='1') then
			count <= (others=>'0');
		elsif (mclk'event and mclk='1') then
			if (cout = '0') then
				count <= count + 1;
			end if;
		end if;
	end process;

	cout <= count(20);

end Behavioral;