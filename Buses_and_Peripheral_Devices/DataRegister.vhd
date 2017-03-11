library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DataRegister is
	port(enable, clk: in std_logic;
		  D: in std_logic_vector(7 downto 0);
		  Q: out std_logic_vector(7 downto 0) );
end DataRegister;

architecture Behavioral of DataRegister is
begin
	process(clk)
	begin
		if (enable='0') then
			null;
		elsif (clk'event and clk='1') then
			Q <= D;
		end if;
	end process;

end Behavioral;

