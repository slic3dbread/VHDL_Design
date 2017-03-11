--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:03:18 01/30/2017
-- Design Name:   
-- Module Name:   H:/4540/lab1/processortest.vhd
-- Project Name:  lab1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ProcessorToLevel
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
 
ENTITY processortest IS
END processortest;
 
ARCHITECTURE behavior OF processortest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ProcessorToLevel
    PORT(
         mclk : IN  std_logic;
         button : IN  std_logic_vector(4 downto 0);
         segment : OUT  std_logic_vector(3 downto 0);
         leds : OUT  std_logic_vector(7 downto 0);
         inputSwitches : IN  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal mclk : std_logic := '0';
   signal button : std_logic_vector(4 downto 0) := (others => '0');
   signal inputSwitches : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal segment : std_logic_vector(3 downto 0);
   signal leds : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant mclk_period : time := 1000 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ProcessorToLevel PORT MAP (
          mclk => mclk,
          button => button,
          segment => segment,
          leds => leds,
          inputSwitches => inputSwitches
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

		inputSwitches(0) <='0';
		inputSwitches(1) <='1';

      wait for mclk_period*2;
		
		inputSwitches(0) <='0';
		inputSwitches(1) <='0';

      wait for mclk_period*2;
				
		inputSwitches(0) <='1';
		inputSwitches(1) <='1';
		
		wait for mclk_period*2;
		
		inputSwitches(0) <='0';
		inputSwitches(1) <='0';

      wait for mclk_period*2;
				
		inputSwitches(0) <='1';
		inputSwitches(1) <='1';
		
		wait for mclk_period*2;



      -- insert stimulus here 
   end process;

END;
