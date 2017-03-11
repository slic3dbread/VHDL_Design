----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:46:33 02/08/2015 
-- Design Name: 
-- Module Name:    mem - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity singlemem is
	generic (
		Dwidth : integer := 16;
		Awidth : integer := 8);
	port (
		we,clk: in std_logic;
		addr: in std_logic_vector(Awidth-1 downto 0);
		din: in std_logic_vector(Dwidth-1 downto 0);
		dout: out std_logic_vector(Dwidth-1 downto 0)
	);
end singlemem;

architecture Behavioural of singlemem is
	type memType is array(0 to 2**Awidth-1) of std_logic_vector(Dwidth-1 downto 0);
	signal memory: memType:=
		(
		"00000000000000001111111111110001",
		"00000000000000000000000001111010",
		"00000000000000000000000000000100",
		"00000000000000000000000000001000",
		"00000000000000001111111111111100",
		"00000000000000111111111100100000",
		"00000000000000111111111101000000",
		"00000000000000000000000010001100",
		others=> "00000000000000000000000000000000" );
		
		attribute ram_style: string;
		attribute ram_style of memory : signal is "distributed";
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