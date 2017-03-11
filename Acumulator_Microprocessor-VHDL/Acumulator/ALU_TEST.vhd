--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:21:37 01/30/2017
-- Design Name:   
-- Module Name:   T:/lab1nick/ALU_TEST.vhd
-- Project Name:  lab1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU_Behavioural
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
 
ENTITY ALU_TEST IS
END ALU_TEST;
 
ARCHITECTURE behavior OF ALU_TEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU_Behavioural
    PORT(
         sel : IN  std_logic_vector(2 downto 0);
         x : IN  std_logic_vector(15 downto 0);
         y : IN  std_logic_vector(15 downto 0);
         c_in : IN  std_logic;
         c_out : OUT  std_logic;
         overflow : OUT  std_logic;
         z : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal sel : std_logic_vector(2 downto 0) := (others => '0');
   signal x : std_logic_vector(15 downto 0) := (others => '0');
   signal y : std_logic_vector(15 downto 0) := (others => '0');
   signal c_in : std_logic := '0';

 	--Outputs
   signal c_out : std_logic;
   signal overflow : std_logic;
   signal z : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
    -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU_Behavioural PORT MAP (
          sel => sel,
          x => x,
          y => y,
          c_in => c_in,
          c_out => c_out,
          overflow => overflow,
          z => z
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		
		
		x <= "0000000000000000";
		y <= "0000000000000001";
		sel <= "001";
		
		wait for 100 ns;
		
		x <= z;
		y <= "0000000000000001";
		sel <= "010";
		
			
		wait for 100 ns;
		
		x <= z;
		y <= "0000000000000011";
		sel <= "000";
		
		wait for 100 ns;
		
		x <= z;
		y <= "0000000000000111";
		sel <= "011";
		
		wait for 100 ns;
		
		x <= z;
		y <= "1111111111111101";
		sel <= "100";      --signed addition
		
	   wait for 100 ns;
		
		x <= z;
		y <= "1111000000000111";
		sel <= "101";

		wait for 100 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
