library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity HalfAdder is
	port( A, B: in std_logic;
			SumHA, CoutHA: out std_logic);
end HalfAdder;

architecture Behavioral of HalfAdder is

begin

	SumHA <= A XOR B;
	CoutHA <= A AND B;

end Behavioral;

