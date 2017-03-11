library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_16Bit is
	port(X, Y: in std_logic_vector(15 downto 0);
		  S: in std_logic_vector(2 downto 0);
		  Cin: in std_logic;
		  Cout, Overflow, lt: out std_logic;
		  Z: out std_logic_vector(15 downto 0) );
end ALU_16Bit;

architecture Structural of ALU_16Bit is

	component ALU_1Bit is
		port( ALU_X, ALU_Y, ALU_Cin: in std_logic;
				ALU_S: in std_logic_vector(2 downto 0);
				ALU_Cout, ALU_Z: out std_logic);
	end component;

	component LTComparator is
	port( A, B: in std_logic_vector(15 downto 0);
			F: out std_logic);
	end component;

	signal CoutSig: std_logic_vector(15 downto 0);
	
begin
	ALU0: ALU_1Bit port map( X(0), Y(0), Cin, S, CoutSig(0), Z(0));
	ALU1: ALU_1Bit port map( X(1), Y(1), CoutSig(0), S, CoutSig(1), Z(1));
	ALU2: ALU_1Bit port map( X(2), Y(2), CoutSig(1), S, CoutSig(2), Z(2));
	ALU3: ALU_1Bit port map( X(3), Y(3), CoutSig(2), S, CoutSig(3), Z(3));
	ALU4: ALU_1Bit port map( X(4), Y(4), CoutSig(3), S, CoutSig(4), Z(4));
	ALU5: ALU_1Bit port map( X(5), Y(5), CoutSig(4), S, CoutSig(5), Z(5));
	ALU6: ALU_1Bit port map( X(6), Y(6), CoutSig(5), S, CoutSig(6), Z(6));
	ALU7: ALU_1Bit port map( X(7), Y(7), CoutSig(6), S, CoutSig(7), Z(7));
	ALU8: ALU_1Bit port map( X(8), Y(8), CoutSig(7), S, CoutSig(8), Z(8));
	ALU9: ALU_1Bit port map( X(9), Y(9), CoutSig(8), S, CoutSig(9), Z(9));
	ALU10: ALU_1Bit port map( X(10), Y(10), CoutSig(9), S, CoutSig(10), Z(10));
	ALU11: ALU_1Bit port map( X(11), Y(11), CoutSig(10), S, CoutSig(11), Z(11));
	ALU12: ALU_1Bit port map( X(12), Y(12), CoutSig(11), S, CoutSig(12), Z(12));
	ALU13: ALU_1Bit port map( X(13), Y(13), CoutSig(12), S, CoutSig(13), Z(13));
	ALU14: ALU_1Bit port map( X(14), Y(14), CoutSig(13), S, CoutSig(14), Z(14));
	ALU15: ALU_1Bit port map( X(15), Y(15), CoutSig(14), S, CoutSig(15), Z(15));
	LTComp: LTComparator port map( X, Y, lt);
	
	Cout <= CoutSig(15);

	process(CoutSig)
	begin
		Overflow <= CoutSig(15) XOR CoutSig(14);
	end process;
	
end Structural;

