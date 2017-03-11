library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AdderSubtractor is
	port( XSub, YSub, CinSub: in std_logic;
			Sub: in std_logic;
			SumSub, CoutSub: out std_logic);
end AdderSubtractor;

architecture Structural of AdderSubtractor is

component FullAdder is
	port( Ain, Bin, CinFA: in std_logic;
			SumFA, CoutFA: out std_logic);
end component;

signal temp: std_logic;

begin

	temp <= YSub XOR Sub;

	FA1: FullAdder port map(XSub, temp, CinSub, SumSub, CoutSub);

end Structural;

