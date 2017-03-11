LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Peripheral1_sseg_FourDigit_TB IS
END Peripheral1_sseg_FourDigit_TB;
 
ARCHITECTURE behavior OF Peripheral1_sseg_FourDigit_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ssegwrapper
    PORT(
         Din : IN  std_logic_vector(7 downto 0);
         Dout : OUT  std_logic_vector(7 downto 0);
         Addr : IN  std_logic_vector(7 downto 0);
         userClk : IN  std_logic;
         mclk : IN  std_logic;
         RW : IN  std_logic;
         req : OUT  std_logic;
         ssegDisplayLEDs : OUT  std_logic_vector(7 downto 0);
         digitDisplayed : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    
   --Inputs
   signal Din : std_logic_vector(7 downto 0) := (others => '0');
   signal Addr : std_logic_vector(7 downto 0) := (others => '0');
   signal userClk : std_logic := '0';
   signal mclk : std_logic := '0';
   signal RW : std_logic := '0';

 	--Outputs
   signal Dout : std_logic_vector(7 downto 0);
   signal req : std_logic;
   signal ssegDisplayLEDs : std_logic_vector(7 downto 0);
   signal digitDisplayed : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant userClk_period : time := 10 ns;
   constant mclk_period : time := 10 ns;
 
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: ssegwrapper PORT MAP (
          Din => Din,
          Dout => Dout,
          Addr => Addr,
          userClk => userClk,
          mclk => mclk,
          RW => RW,
          req => req,
          ssegDisplayLEDs => ssegDisplayLEDs,
          digitDisplayed => digitDisplayed
        );

   -- Clock process definitions
   userClk_process :process
   begin
		userClk <= '0';
		wait for userClk_period/2;
		userClk <= '1';
		wait for userClk_period/2;
   end process;
 
   mclk_process :process
   begin
		mclk <= '0';
		wait for mclk_period/2;
		mclk <= '1';
		wait for mclk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		
		-- Input data-to-be-displayed = 2 (decimal), wrong address
		-- RW disabled
		RW <= '0';
		Din <= "00000010";
		Addr <= "00001000";
		wait for mclk_period*10;
		
		-- Input data-to-be-displayed = 2 (decimal), wrong address
		-- RW enabled
		RW <= '1';
		Din <= "00000010";
		Addr <= "00001000";
		wait for mclk_period*10;
		
		-- Input data-to-be-displayed = 2 (decimal), right address
		-- RW enabled
		RW <= '1';
		Din <= "00000010";
		Addr <= "00000010";
		wait for mclk_period*10;

		-- Input data-to-be-displayed = 5 (decimal), right address
		-- RW disabled
		RW <= '0';
		Din <= "00000101";
		Addr <= "00000010";
		wait for mclk_period*10;
		
		-- Input data-to-be-displayed = 5 (decimal), wrong address
		-- RW enabled
		RW <= '1';
		Din <= "00000101";
		Addr <= "00100001";

      wait;
   end process;

END;
