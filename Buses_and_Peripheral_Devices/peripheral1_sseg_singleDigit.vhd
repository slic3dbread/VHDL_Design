LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY peripheral1_sseg_singleDigit_TB IS
END peripheral1_sseg_singleDigit_TB;

ARCHITECTURE behavior OF peripheral1_sseg_singleDigit_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT ssegwrapper
    PORT(
         Din : IN  std_logic_vector(7 downto 0);
         Dout : OUT  std_logic_vector(7 downto 0);
         Addr : IN  std_logic_vector(7 downto 0);
         RW : IN  std_logic;
         req : OUT  std_logic;
         clk : IN  std_logic;
         ssegDisplayLEDs : OUT  std_logic_vector(7 downto 0);
         ssegEN : OUT  std_logic_vector(0 downto 0)
        );
    END COMPONENT;

   --Inputs
   signal Din : std_logic_vector(7 downto 0) := (others => '0');
   signal Addr : std_logic_vector(7 downto 0) := (others => '0');
   signal RW : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal Dout : std_logic_vector(7 downto 0);
   signal req : std_logic;
   signal ssegDisplayLEDs : std_logic_vector(7 downto 0);
   signal ssegEN : std_logic_vector(0 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: ssegwrapper PORT MAP (
          Din => Din,
          Dout => Dout,
          Addr => Addr,
          RW => RW,
          req => req,
          clk => clk,
          ssegDisplayLEDs => ssegDisplayLEDs,
          ssegEN => ssegEN
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
   -- Stimulus process
   stim_proc: process
   begin		
		-- Input data-to-be-displayed = 2 (decimal), wrong address
		Din <= "00000010";
		Addr <= "00001000";
		wait for clk_period*10;
		
		-- Input data-to-be-displayed = 2 (decimal), right address
		Din <= "00000010";
		Addr <= "00000010";
		wait for clk_period*10;

		-- Input data-to-be-displayed = 5 (decimal), right address
		Din <= "00000101";
		Addr <= "00000010";
		wait for clk_period*10;
		
		-- Input data-to-be-displayed = 5 (decimal), wrong address
		Din <= "00000101";
		Addr <= "00100001";

      wait;
   end process;
END;
