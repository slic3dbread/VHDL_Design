library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity lab3mem is
	generic (
		Dwidth : integer := 16;
		Awidth : integer := 8);
	port (
		we,clk: in std_logic;
		addr: in std_logic_vector(Awidth-1 downto 0);
		din: in std_logic_vector(Dwidth-1 downto 0);
		dout: out std_logic_vector(Dwidth-1 downto 0)
	);
end lab3mem;

architecture Behavioural of lab3mem is
	type memType is array(0 to 2**Awidth-1) of std_logic_vector(Dwidth-1 downto 0);
	signal memory: memType:=
		(
		"0000000000000001",
		"0000000000000010",
		"0000000000000100",
		"0000000000001000",
		"0000000000010000",
		"0000000000100000",
		"0000000001000000",
		"0000000010000000",
		others=> "0000000000000000" );
begin
	process(clk)
	begin
		if(clk'event and clk='1') then
			if(we='1') then
				memory(conv_integer(addr)) <= din;
				-- READ-AFTER-WRITE semantic for spartan  block RAM.  If removed,
				-- READ-THROUGH mode is only supported by distributed RAM (through CLBs)
				dout<=din;
			else
				dout<=memory(conv_integer(addr));
			end if;
		end if;
	end process;
end Behavioural;