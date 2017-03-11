--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:01:10 01/30/2017
-- Design Name:   
-- Module Name:   T:/lab1nick/TEST_SEVENSEG.vhd
-- Project Name:  lab1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SevenSegController
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
 
ENTITY TEST_SEVENSEG IS
END TEST_SEVENSEG;
 
ARCHITECTURE behavior OF TEST_SEVENSEG IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SevenSegController
    PORT(
         input : IN  std_logic_vector(15 downto 0);
         mclk : IN  std_logic;
         segment : OUT  std_logic_vector(3 downto 0);
         leds : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal input : std_logic_vector(15 downto 0) := (others => '0');
   signal mclk : std_logic := '0';

 	--Outputs
   signal segment : std_logic_vector(3 downto 0);
   signal leds : std_logic_vector(7 downto 0);
	
   -- Clock period definitions
   constant mclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SevenSegController PORT MAP (
          input => input,
          mclk => mclk,
          segment => segment,
          leds => leds
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

      wait for mclk_period*10;

      -- insert stimulus here 
		-- assign digits to corresponding segment input
		
		input <= "1001111110110001";
		
		wait for mclk_period;
      wait;
   end process;

END;
