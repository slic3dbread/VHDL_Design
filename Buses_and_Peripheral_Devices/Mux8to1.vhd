library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux8to1 is
	port( I0, I1, I2, I3, I4, I5, I6, I7: in std_logic;
			S: in std_logic_vector(2 downto 0);
			Z: out std_logic);
end Mux8to1;

architecture Behavioral of Mux8to1 is

begin
	process(I0, I1, I2, I3, I4, I5, I6, I7, S)
	begin
		if S = "000" then
			Z <= I0;
		elsif S = "001" then
			Z <= I1;
		elsif S = "010" then
			Z <= I2;
		elsif S = "011" then
			Z <= I3;
		elsif S = "100" then
			Z <= I4;
		elsif S = "101" then
			Z <= I5; 
		elsif S = "110" then
			Z <= I6;
		else
			Z <= I7;
		end if;
		
	end process;

end Behavioral;

