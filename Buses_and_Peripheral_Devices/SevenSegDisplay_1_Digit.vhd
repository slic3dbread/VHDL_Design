library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity senv_seg_SingleDigit is
	port(	a: in std_logic_vector(3 downto 0);
		   en: in std_logic_vector(3 downto 0);
		   b: out std_logic_vector(7 downto 0);
		   AN0, AN1, AN2, AN3: out std_logic);
end senv_seg_SingleDigit;

architecture Behavioral of senv_seg_SingleDigit is
begin
	process (a, en)
	begin
		-- select where to display data
		AN0 <= en(3);
		AN1 <= en(2);
		AN2 <= en(1);
		AN3 <= en(0);
		
		-- decode the input to work with 7-seg
		case a is
			--                     Dgfedcba
			when "0000" =>  b <= "11000000"; -- 0
			when "0001" =>  b <= "11111001"; -- 1
			when "0010" =>  b <= "10100100"; -- 2
			when "0011" =>  b <= "10110000"; -- 3
			when "0100" =>  b <= "10011001"; -- 4
			when "0101" =>  b <= "10010010"; -- 5
			when "0110" =>  b <= "10000010"; -- 6
			when "0111" =>  b <= "11111000"; -- 7
			when "1000" =>  b <= "10000000"; -- 8
			when "1001" =>  b <= "10010000"; -- 9
			when "1010" =>  b <= "10001000"; -- A
			when "1011" =>  b <= "10000011"; -- b
			when "1100" =>  b <= "11000110"; -- C
			when "1101" =>  b <= "10100001"; -- d
			when "1110" =>  b <= "10000110"; -- E
			when "1111" =>  b <= "10001110"; -- F
			when others  =>  b <= "11111111"; -- OFF
		end case;
	end process;		   					     
end Behavioral;