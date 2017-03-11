library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FullAdder is
	port( Ain, Bin, CinFA: in std_logic;
			SumFA, CoutFA: out std_logic);
end FullAdder;

architecture Structural of FullAdder is

	component HalfAdder is
		port( A, B: in std_logic;
				SumHA, CoutHA: out std_logic);
	end component;

	signal C1, S1, C2: std_logic;

begin

	HA1: HalfAdder port map(Ain, Bin, S1, C1);
	HA2: HalfAdder port map(S1, CinFA, SumFA, C2);
	
	CoutFA <= C1 OR C2;

end Structural;

