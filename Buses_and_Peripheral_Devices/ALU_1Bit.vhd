library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_1Bit is
	port( ALU_X, ALU_Y, ALU_Cin: in std_logic;
			ALU_S: in std_logic_vector(2 downto 0);
			ALU_Cout, ALU_Z: out std_logic);
end ALU_1Bit;

architecture Structural of ALU_1Bit is

component AdderSubtractor is
	port( XSub, YSub, CinSub: in std_logic;
			Sub: in std_logic;
			SumSub, CoutSub: out std_logic);
end component;

	component BinLogic is
		port( XLogic, YLogic: in std_logic;
				Band, Bor, Bxor: out std_logic);
	end component;

	component Mux8to1 is
		port( I0, I1, I2, I3, I4, I5, I6, I7: in std_logic;
				S: in std_logic_vector(2 downto 0);
				Z: out std_logic);
	end component;

	signal FAsum, LogicAND, LogicOR, LogicXOR: std_logic;

begin
	FA: AdderSubtractor port map(ALU_X, ALU_Y, ALU_Cin, ALU_Cin, FAsum, ALU_Cout);
	Logic: BinLogic port map(ALU_X, ALU_Y, LogicAND, LogicOR, LogicXOR);
	Mux: Mux8to1 port map(LogicAND, LogicOR, FAsum, LogicXOR, FAsum, FAsum, '0', '0', ALU_S, ALU_Z);
	
end Structural;

