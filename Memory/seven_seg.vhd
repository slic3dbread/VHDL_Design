library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity senv_seg is
	port
	(
		Y: in std_logic_vector(4 downto 0);
		Z: out std_logic_vector(7 downto 0));
end senv_seg;

architecture Behavioral of senv_seg is

begin

	process (Y)
	begin
		case Y is
			when "00000" =>  Z <= "11000000";
			when "00001" =>  Z <= "11111001"; 
			when "00010" =>  Z <= "10100100"; 
			when "00011" =>  Z <= "10110000"; 
			when "00100" =>  Z <= "10011001"; 
			when "00101" =>  Z <= "10010010"; 
			when "00110" =>  Z <= "10000010";
			when "00111" =>  Z <= "11111000"; 
			when "01000" =>  Z <= "10000000"; 
			when "01001" =>  Z <= "10011000"; 
			when "01010" =>  Z <= "10001000"; 
			when "01011" =>  Z <= "10000011"; 
			when "01100" =>  Z <= "11000110"; 
			when "01101" =>  Z <= "10100001"; 
			when "01110" =>  Z <= "10000110"; 
			when "01111" =>  Z <= "10001110";
			when "10000" =>  Z <= "01000000";
			when "10001" =>  Z <= "01111001"; 
			when "10010" =>  Z <= "00100100"; 
			when "10011" =>  Z <= "00110000"; 
			when "10100" =>  Z <= "00011001"; 
			when "10101" =>  Z <= "00010010"; 
			when "10110" =>  Z <= "00000010";
			when "10111" =>  Z <= "01111000"; 
			when "11000" =>  Z <= "00000000"; 
			when "11001" =>  Z <= "00011000"; 
			when "11010" =>  Z <= "00001000"; 
			when "11011" =>  Z <= "00000011"; 
			when "11100" =>  Z <= "01000110"; 
			when "11101" =>  Z <= "00100001"; 
			when "11110" =>  Z <= "00000110"; 
			when "11111" =>  Z <= "00001110";
			when others  =>  Z <= "11111111";

		end case;
	end process;		   					     
end Behavioral; 