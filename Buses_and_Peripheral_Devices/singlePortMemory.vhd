library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RegisterFile is
	generic ( Dwidth : integer := 16;
				 Awidth : integer := 8 );
	port ( ReadAddr1, ReadAddr2, WriteAddr: in std_logic_vector (Awidth-1 downto 0);
			 DataOut1, DataOut2: out std_logic_vector (Dwidth-1 downto 0);
			 DataIn: in std_logic_vector (Dwidth-1 downto 0);
			 we, clk: std_logic );
end RegisterFile;

architecture Behavioral of RegisterFile is
	type memType is array(0 to 2**Awidth-1) of std_logic_vector(Dwidth-1 downto 0);
	signal memory: memType:=
		("0000000000000001",
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
			if(we='1') then -- When writing
				memory(conv_integer(WriteAddr)) <= DataIn; -- Save input coming from data in to write address memory location
				DataOut1 <= DataIn;
				DataOut2 <= memory(conv_integer(ReadAddr2));
			else -- When not writing (i.e. read only)
				DataOut1 <= memory(conv_integer(ReadAddr1));
				DataOut2 <= memory(conv_integer(ReadAddr2));
			end if;
		end if;
	end process;
end Behavioral;
