library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lab3Memory is
	port ( mclk: in std_logic;
			 SW: in std_logic_vector(7 downto 0);
			 din: in std_logic_vector(15 downto 0);
			 dout: out std_logic_vector(15 downto 0));
end lab3Memory;

architecture Structural of lab3Memory is

component singlePortMemory is
	generic ( Dwidth : integer := 16;
				 Awidth : integer := 8 );
	port ( we,clk: in std_logic;
				addr: in std_logic_vector(Awidth-1 downto 0);
				 din: in std_logic_vector(Dwidth-1 downto 0);
				dout: out std_logic_vector(Dwidth-1 downto 0) );
end component;

begin



end Structural;

