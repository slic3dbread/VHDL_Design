library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity LTComparator is
	port( A, B: in std_logic_vector(15 downto 0);
			F: out std_logic);
end LTComparator;

architecture Behavioral of LTComparator is

begin

	process(A, B)
	begin
		if A < B then
			F <= '1';
		else
			F <= '0';
		end if;
	end process;

end Behavioral;

