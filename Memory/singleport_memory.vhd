----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:34:36 02/09/2015 
-- Design Name: 
-- Module Name:    singleport_memory - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity singleport_memory is
	Port ( Si : in  STD_LOGIC_VECTOR(3 downto 0);
           Out_signal : out  STD_LOGIC_VECTOR(3 downto 0);
			  lights: out std_logic_vector(7 downto 0);
			  WriE: in std_logic;
			  mclk: in std_logic);
end singleport_memory;

architecture Behavioral of singleport_memory is

component senv_seg is
	port
	(
		Y: in std_logic_vector(4 downto 0);
		Z: out std_logic_vector(7 downto 0));
end component;

component singlemem is
	generic (
		Dwidth : integer := 16;
		Awidth : integer := 8);
	port (
		we,clk: in std_logic;
		addr: in std_logic_vector(Awidth-1 downto 0);
		din: in std_logic_vector(Dwidth-1 downto 0);
		dout: out std_logic_vector(Dwidth-1 downto 0)
	);
end component;

	
	signal clkdiv : std_logic_vector(15 downto 0);		-- counter for clock divider
	signal temp_DS : std_logic_vector(4 downto 0):= "00000";
	signal inp : std_logic_vector(31 downto 0); --Since we need 20 bit input
	signal temp_signal : std_logic_vector(3 downto 0):= "1111";
	signal Address : std_logic_vector(3 downto 0):= "0000";
begin

   singleMemory : singlemem generic map(32, 4)
				port map(WriE, mclk, Si, "00000000000000000000000000000000", inp);
	
	process (mclk)						--system clock divder
	begin
		if mclk = '1' and mclk'Event then	
			clkdiv <= clkdiv +1;
		end if;	    
	end process;
	
	decoder : senv_seg port map(temp_DS,lights);
	
	process(clkdiv(15), temp_DS, inp)
	
	variable First:std_logic_vector(4 downto 0);
	variable Second:std_logic_vector(4 downto 0);
	variable Third:std_logic_vector(4 downto 0);
	variable Fourth:std_logic_vector(4 downto 0);
	
	
	
	begin
	
	
	First:= inp(4 downto 0);
	Second:= inp(9 downto 5);
	Third:= inp(14 downto 10);
	Fourth:= inp(19 downto 15);
	
	if clkdiv(15) = '1' and clkdiv(15)'Event then
			case temp_signal is				--Choose LEDS
		 		when "1110"  =>
					temp_DS <= Second;
					temp_signal <= "1101";
				when "1101"  =>
					temp_DS <= Third;
					temp_signal <= "1011";
				when "1011"  =>
					temp_DS <= Fourth;
					temp_signal <= "0111";
				when others =>
					temp_DS <= First;
					temp_signal<="1110";
			end case;
	end if;
	end process;
Out_signal<=temp_signal;
end Behavioral;

