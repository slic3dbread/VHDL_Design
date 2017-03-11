--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:53:14 02/10/2015
-- Design Name:   
-- Module Name:   T:/Lab3_3380/Lab3_memory/MEMORY_TB.vhd
-- Project Name:  Lab3_memory
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: singleport_memory
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
 
ENTITY MEMORY_TB IS
END MEMORY_TB;
 
ARCHITECTURE behavior OF MEMORY_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT singleport_memory
    PORT(
         Si : IN  std_logic_vector(3 downto 0);
         Out_signal : OUT  std_logic_vector(3 downto 0);
         lights : OUT  std_logic_vector(7 downto 0);
         mclk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Si : std_logic_vector(3 downto 0) := (others => '0');
   signal mclk : std_logic := '0';

 	--Outputs
   signal Out_signal : std_logic_vector(3 downto 0);
   signal lights : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant mclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: singleport_memory PORT MAP (
          Si => Si,
          Out_signal => Out_signal,
          lights => lights,
          mclk => mclk
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
		we<='0';
      -- hold reset state for 100 ns.
      wait for mclk_period;
		Si<="0001";
      wait for mclk_period;
		Si<="0010";
		wait for mclk_period;
		Si<="0011";
		wait for mclk_period;
		Si<="0100";
		wait for mclk_period;
		Si<="1000";
      -- insert stimulus here 

      wait;
   end process;

END;
