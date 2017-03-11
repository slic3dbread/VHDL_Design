LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY ALUTestBench IS
END ALUTestBench;
 
ARCHITECTURE behavior OF ALUTestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU_16Bit
    PORT(
         X : IN  std_logic_vector(15 downto 0);
         Y : IN  std_logic_vector(15 downto 0);
         S : IN  std_logic_vector(2 downto 0);
         Cin : IN  std_logic;
         Cout : OUT  std_logic;
         Overflow : OUT  std_logic;
         lt : OUT  std_logic;
         Z : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal X : std_logic_vector(15 downto 0) := (others => '0');
   signal Y : std_logic_vector(15 downto 0) := (others => '0');
   signal S : std_logic_vector(2 downto 0) := (others => '0');
   signal Cin : std_logic := '0';

 	--Outputs
   signal Cout : std_logic;
   signal Overflow : std_logic;
   signal lt : std_logic;
   signal Z : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU_16Bit PORT MAP (
          X => X,
          Y => Y,
          S => S,
          Cin => Cin,
          Cout => Cout,
          Overflow => Overflow,
          lt => lt,
          Z => Z
        );

   -- Stimulus process
   stim_proc: process
   begin		

		--testing the AND function
		X <= "0000000000000001";
		Y <= "0000000000000001";
		S <= "000";
		Cin <= '0';
      wait for 10ns;
		
		X <= "0000000000000001";
		Y <= "0000000000000000";
		S <= "000";
		Cin <= '0';
      wait for 10ns;
		
		--testing the OR function
		X <= "0000000000000001";
		Y <= "0000000000000000";
		S <= "001";
		Cin <= '0';
      wait for 10ns;

		X <= "0000000000000000";
		Y <= "0000000000000000";
		S <= "001";
		Cin <= '0';
      wait for 10ns;
		
		--testing the unsigned add
		X <= "0000000000000001";
		Y <= "0000000000000001";
		S <= "010";
		Cin <= '0';
      wait for 10ns;

		--testing the XOR function
		X <= "0000000000001001";
		Y <= "0000000000000101";
		S <= "011";
		Cin <= '0';
      wait for 10ns;

		--testing the signed subtract
		X <= "0000000000000001";
		Y <= "0000000000000001";
		S <= "100";
		Cin <= '1';
      wait for 10ns;
		
		--testing the signed add
		X <= "0000000000001001";
		Y <= "0000000000000101";
		S <= "101";
		Cin <= '1';
      wait for 10ns;
		
		--testing the lt and overflow
		X <= "1000000000000001";
		Y <= "1000000000000101";
		S <= "000";
		Cin <= '0';
      wait for 10ns;
		
      wait;
   end process;

END;
