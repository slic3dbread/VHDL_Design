--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:29:46 02/09/2015
-- Design Name:   
-- Module Name:   H:/Lab3_3380/lab3_Register/Register_TestBench.vhd
-- Project Name:  lab3_3380
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: regfile
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
 
ENTITY Register_TestBench IS
END Register_TestBench;
 
ARCHITECTURE behavior OF Register_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT regfile
    PORT(
         ReadA1 : IN  std_logic_vector(3 downto 0);
         ReadA2 : IN  std_logic_vector(3 downto 0);
         WriteA : IN  std_logic_vector(3 downto 0);
         DataO1 : OUT  std_logic_vector(15 downto 0);
         DataO2 : OUT  std_logic_vector(15 downto 0);
         DataIn : IN  std_logic_vector(15 downto 0);
         Wen : IN  std_logic;
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal ReadA1 : std_logic_vector(3 downto 0) := (others => '0');
   signal ReadA2 : std_logic_vector(3 downto 0) := (others => '0');
   signal WriteA : std_logic_vector(3 downto 0) := (others => '0');
   signal DataIn : std_logic_vector(15 downto 0) := (others => '0');
   signal Wen : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal DataO1 : std_logic_vector(15 downto 0);
   signal DataO2 : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: regfile PORT MAP (
          ReadA1 => ReadA1,
          ReadA2 => ReadA2,
          WriteA => WriteA,
          DataO1 => DataO1,
          DataO2 => DataO2,
          DataIn => DataIn,
          Wen => Wen,
          clk => clk
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
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
