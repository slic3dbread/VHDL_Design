--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:34:56 02/08/2015
-- Design Name:   
-- Module Name:   H:/Lab3_3380/lab3_ALU_behavioural/ALU_TB_BEHAVIOURAL.vhd
-- Project Name:  lab3_ALU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY ALU_TB_BEHAVIOURAL IS
END ALU_TB_BEHAVIOURAL;
 
ARCHITECTURE behavior OF ALU_TB_BEHAVIOURAL IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         x : IN  std_logic_vector(15 downto 0);
         y : IN  std_logic_vector(15 downto 0);
         z : OUT  std_logic_vector(15 downto 0);
         sel : IN  std_logic_vector(2 downto 0);
         Cin : IN  std_logic;
         Cout : OUT  std_logic;
         lt : OUT  std_logic;
         overflow : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal x : std_logic_vector(15 downto 0) := (others => '0');
   signal y : std_logic_vector(15 downto 0) := (others => '0');
   signal sel : std_logic_vector(2 downto 0) := (others => '0');
   signal Cin : std_logic := '0';

 	--Outputs
   signal z : std_logic_vector(15 downto 0);
   signal Cout : std_logic;
   signal lt : std_logic;
   signal overflow : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          x => x,
          y => y,
          z => z,
          sel => sel,
          Cin => Cin,
          Cout => Cout,
          lt => lt,
          overflow => overflow
        );

   -- Clock process definitions
   <clock>_process :process
   begin
		<clock> <= '0';
		wait for <clock>_period/2;
		<clock> <= '1';
		wait for <clock>_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
