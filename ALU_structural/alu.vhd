----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:56:45 02/08/2015 
-- Design Name: 
-- Module Name:    alu - Behavioral 
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

entity ALU is
	generic (
		Dwidth : integer := 16);
	port (
		x,y : in std_logic_vector(Dwidth-1 downto 0);
		z : out std_logic_vector(Dwidth-1 downto 0);
		sel : in std_logic_vector (2 downto 0);
		Cin : in std_logic;
		Cout, lt, overflow : out std_logic);
end ALU;

architecture Behavioral of ALU is
	


begin


end Behavioral;

