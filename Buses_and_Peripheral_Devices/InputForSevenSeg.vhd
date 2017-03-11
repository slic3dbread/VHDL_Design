----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:58:36 01/26/2015 
-- Design Name: 
-- Module Name:    InputForSevenSeg - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity InputForSevenSeg is
    Port ( a : in  STD_LOGIC_Vector(1 downto 0));
end InputForSevenSeg;

architecture Behavioral of InputForSevenSeg is
	signal b: std_logic_vector(1 downto 0);
begin
	b <= a;
	if b = "00" then
	
	end if;

end Behavioral;

