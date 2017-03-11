--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:01:57 01/27/2015
-- Design Name:   
-- Module Name:   T:/Lab2 - 7-Seg Display/Four-Digit_7-Seg_Controller/SevSeg4DigitTB.vhd
-- Project Name:  Four-Digit_7-Seg_Controller
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Input20DigitsForSevenSeg
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY SevSeg4DigitTB IS
END SevSeg4DigitTB;
 
ARCHITECTURE behavior OF SevSeg4DigitTB IS 
 
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
		wait for mclk_period*10;

		-- Display 8.8.8.8.
		BTNU <= '1';
		BTNR <= '0';
		BTND <= '0';
		BTNL <= '0';
		BTNS <= '0';
		wait for mclk_period*10;

		-- Display AB.CD
		BTNU <= '0';
		BTNR <= '1';
		BTND <= '0';
		BTNL <= '0';
		BTNS <= '0';
		wait for mclk_period*10;

		-- Display 5.432
		BTNU <= '0';
		BTNR <= '0';
		BTND <= '1';
		BTNL <= '0';
		BTNS <= '0';
		wait for mclk_period*10;

		-- Display 0997
		BTNU <= '0';
		BTNR <= '0';
		BTND <= '0';
		BTNL <= '1';
		BTNS <= '0';
		wait for mclk_period*10;

		-- Display 0.54.8
		BTNU <= '0';
		BTNR <= '0';
		BTND <= '0';
		BTNL <= '0';
		BTNS <= '1';
		wait for mclk_period*10;
		
		-- Set back to default, 0.0.0.0.
		BTNU <= '0';
		BTNR <= '0';
		BTND <= '0';
		BTNL <= '0';
		BTNS <= '0';
		wait for mclk_period*10;

      wait;
   end process;

END;
