--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:19:23 02/10/2015
-- Design Name:   
-- Module Name:   T:/Lab3_3380/Lab3_memory/singleport_TB.vhd
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
 
ENTITY singleport_TB IS
END singleport_TB;
 
ARCHITECTURE behavior OF singleport_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT singleport_memory
    PORT(
         Si : IN  std_logic_vector(3 downto 0);
         Out_signal : OUT  std_logic_vector(3 downto 0);
         lights : OUT  std_logic_vector(7 downto 0);
         WriE : IN  std_logic;
         mclk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Si : std_logic_vector(3 downto 0) := (others => '0');
   signal WriE : std_logic := '0';
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
          WriE => WriE,
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
      -- hold reset state for 100 ns.
		WriE<='0';
		Si<="0000";
      wait for mclk_period*10;
		Si<="0001";
      wait for mclk_period*10;
		Si<="0010";
      wait for mclk_period*10;
		Si<="1000";
      wait for mclk_period*10;
      -- insert stimulus here 


      -- insert stimulus here 

      wait;
   end process;

END;
