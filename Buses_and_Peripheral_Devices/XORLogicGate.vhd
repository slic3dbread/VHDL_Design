library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity XORLogicGate is
	port( O, P: in std_logic;
			Q: out std_logic);
end XORLogicGate;

architecture Behavioral of XORLogicGate is

begin

	Q <= O XOR P;

end Behavioral;

