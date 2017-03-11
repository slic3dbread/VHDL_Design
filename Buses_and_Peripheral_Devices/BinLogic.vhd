library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BinLogic is
	port( XLogic, YLogic: in std_logic;
			Band, Bor, Bxor: out std_logic);
end BinLogic;

architecture Behavioral of BinLogic is

begin

	Band <= XLogic AND YLogic;
	Bor <= XLogic OR YLogic;
	Bxor <= XLogic XOR YLogic;
	
end Behavioral;

