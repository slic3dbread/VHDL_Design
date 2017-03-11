----------------------------------------------------------------------------------
-- Names: Carter Noble, Andrew Mackey
-- Course: 3380
-- Lab Number: 2
-- 
-- Create Date:    15:00:30 01/22/2015 
-- Design Name:    lab2
-- Module Name:    inputSelect - Behavioral 
-- Project Name:   Lab2
-- Target Devices: Nexys 3 FPGA
-- Tool versions:  Xilinx design suite 14
-- Description:    create 4 digit 7 seg display--

-- Revision: 1
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity inputSelect is
    Port ( a : in  STD_LOGIC_VECTOR (4 downto 0);
           b : out  STD_LOGIC_VECTOR (19 downto 0));
end inputSelect;

architecture Behavioral of inputSelect is

begin
	process(a) is
		begin
			if(a(0) = '1') then --button 1 (8.8.8.8.)
				b <= "01000010000100001000";
			elsif(a(1) = '1') then --button 2 (Ab.Cd)
				b <= "11010010111110011101";
			elsif(a(2) = '1') then --button 3 (5.432)
				b <= "00101101001001110010";
			elsif(a(3) = '1') then --button 4 (0997)
				b <= "10000110011100110111";
			elsif(a(4) = '1') then --button 5 (0.54.8)
				b <= "00000101010010011000";
			else							--anything else
				b <= "10000100001000010000";
			end if;	
	end process;
end Behavioral;

