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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
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

signal xSigned: STD_Logic_VECTOR(Dwidth downto 0):= (others => '0');
signal ySigned: STD_Logic_VECTOR(Dwidth downto 0):= (others => '0');
signal tempX: STD_Logic_VECTOR(Dwidth downto 0):= (others => '0');
signal tempY: STD_Logic_VECTOR(Dwidth downto 0):= (others => '0');
signal tempZ: STD_Logic_VECTOR(Dwidth downto 0):= (others => '0');

begin

process(sel,x,y,Cin)
begin
	case sel is
		when "000" => z <= x and Y;
		when "001" => z <= (X or Y);
		when "010" => z <= (tempX + tempY);
		when "011" => z <= (X xor Y); 
		when "100" => 
			zTemp <= (xSigned + C_in) - ySigned; --signed subtract (beq)
		when "101" => 
			xSigned <= signed(x);
			ySigned <= signed(y);
			zTemp <= "00000000000000000";
			zTemp <= (xSigned + C_in) + ySigned; -- signed addition
		when "110" =>
			zTemp <= "00000000000000000";
			if(x<y) then --set on less than
				lt <= '1';
			else
				lt <= '0';
			end if;
		when others =>
			zTemp <= "00000000000000000";
			lt <= '0';
		end case;
	end process;

c_out <= zTemp(Dwidth);
overflow <= zTemp(Dwidth) xor zTemp(Dwidth-1);--need to fix for signed overflow
z(Dwidth-1 downto 0) <= zTemp(Dwidth-1 downto 0);		

end Behavioral;

