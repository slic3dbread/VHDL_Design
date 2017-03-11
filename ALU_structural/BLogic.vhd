library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BLogic is
    Port ( A : in STD_LOGIC;
			  B : in  STD_LOGIC;
           S0 : in  STD_LOGIC;
           S1 : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end BLogic;

architecture Behavioral of BLogic is

component FullAdder is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           S : out  STD_LOGIC);
end component;


begin

	process(A, B, S0, S1)
	begin
	
	if (S0 <= '0' and S1 <= '0') then
		Y <= A and B;
	elsif (S0 <= '0' and S1 <= '1') then
		Y <= A or B;
	elsif (S0 <= '1' and S1 <= '0') then
		Y <= Gi;
	elsif (S0 <= '1' and S1 <= '1') then
		Y <= A xor B;
	else
		Y <= '0';
		
	end if;
	
end process;

FA : FullAdder port map(A, B, '0', Gi, Y);

end behavioral;