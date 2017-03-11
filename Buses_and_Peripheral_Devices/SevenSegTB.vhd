LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY SevenSegTB IS
END SevenSegTB;
 
ARCHITECTURE behavior OF SevenSegTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Input20DigitsForSevenSeg
    PORT(
         mclk : IN  std_logic;
         BTNS : IN  std_logic;
         BTNU : IN  std_logic;
         BTNL : IN  std_logic;
         BTND : IN  std_logic;
         BTNR : IN  std_logic;
         display : OUT  std_logic_vector(7 downto 0);
         DP : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;

   --Inputs
   signal mclk : std_logic := '0';
   signal BTNS : std_logic := '0';
   signal BTNU : std_logic := '0';
   signal BTNL : std_logic := '0';
   signal BTND : std_logic := '0';
   signal BTNR : std_logic := '0';

 	--Outputs
   signal display : std_logic_vector(7 downto 0);
   signal DP : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant mclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Input20DigitsForSevenSeg PORT MAP (
          mclk => mclk,
          BTNS => BTNS,
          BTNU => BTNU,
          BTNL => BTNL,
          BTND => BTND,
          BTNR => BTNR,
          display => display,
          DP => DP
        );

   -- Clock process definitions
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
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		-- Initialize to 0.0.0.0.
		BTNU <= '0';
		BTNR <= '0';
		BTND <= '0';
		BTNL <= '0';
		BTNS <= '0';
		wait for mclk_period*80;

		-- Display 8.8.8.8.
		BTNU <= '1';
		BTNR <= '0';
		BTND <= '0';
		BTNL <= '0';
		BTNS <= '0';
		wait for mclk_period*80;
		
		-- Display AB.CD
		BTNU <= '0';
		BTNR <= '1';
		BTND <= '0';
		BTNL <= '0';
		BTNS <= '0';
		wait for mclk_period*80;

		-- Display 5.432
		BTNU <= '0';
		BTNR <= '0';
		BTND <= '1';
		BTNL <= '0';
		BTNS <= '0';
		wait for mclk_period*80;

		-- Display 0997
		BTNU <= '0';
		BTNR <= '0';
		BTND <= '0';
		BTNL <= '1';
		BTNS <= '0';
		wait for mclk_period*80;

		-- Display 0.54.8
		BTNU <= '0';
		BTNR <= '0';
		BTND <= '0';
		BTNL <= '0';
		BTNS <= '1';
		wait for mclk_period*80;
		
		-- Set back to default, 0.0.0.0.
		BTNU <= '0';
		BTNR <= '0';
		BTND <= '0';
		BTNL <= '0';
		BTNS <= '0';
		wait for mclk_period*80;

      wait;
   end process;

END;
