----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:31:39 02/08/2015 
-- Design Name: 
-- Module Name:    register - Behavioral 
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
use IEEE.std_logic_arith.ALL;
use IEEE.std_logic_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity regfile is
	generic (
		Dwidth : integer := 16;
		Awidth : integer := 4); -- 2**4=16 registers
	port (
		ReadA1, ReadA2, WriteA : in std_logic_vector(Awidth-1 downto 0);
		DataO1, DataO2 : out std_logic_vector(Dwidth-1 downto 0);
		DataIn : in std_logic_vector(Dwidth-1 downto 0);
		Wen, clk : in std_logic);
end regfile;

architecture Behavioral of regfile is

type memType is array(0 to 2**Awidth-1) of std_logic_vector(Dwidth-1 downto 0);
signal memory: memType;

attribute ram_style: string;
attribute ram_style of memory : signal is "block";--force to block ram

begin

	process(clk)
		begin
		if(clk'event and clk='1') then
			if(Wen='1') then
				memory(conv_integer(WriteA)) <= DataIn;
			end if;
				DataO1<=memory(conv_integer(ReadA1));
				DataO2<=memory(conv_integer(ReadA2));
		end if;
end process;
end Behavioral;

