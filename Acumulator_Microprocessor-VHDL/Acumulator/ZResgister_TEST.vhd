--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:39:20 01/30/2017
-- Design Name:   
-- Module Name:   T:/lab1nick/ZResgister_TEST.vhd
-- Project Name:  lab1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Yreg
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
 
ENTITY ZResgister_TEST IS
END ZResgister_TEST;
 
ARCHITECTURE behavior OF ZResgister_TEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Yreg
    PORT(
         d : IN  std_logic_vector(15 downto 0);
         load : IN  std_logic;
         clr : IN  std_logic;
         clk : IN  std_logic;
         q : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal d : std_logic_vector(15 downto 0) := (others => '0');
   signal load : std_logic := '0';
   signal clr : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal q : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Yreg PORT MAP (
          d => d,
          load => load,
          clr => clr,
          clk => clk,
          q => q
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
		load <= '0';
		d <= "0000000000001001";
		clr <= '1';
		wait for clk_period;
		clr <= '0';
		wait for clk_period;
		load <= '1';
		wait for clk_period;
		d <= "0000000000011001";
		wait for clk_period;
		load <= '1';
		wait for clk_period;
		load <= '0';
		wait for clk_period;
		load <= '1';
		wait for clk_period;
		load <= '0';
		wait for clk_period;
		load <= '1';
		wait for clk_period;
		load <= '0';
		wait for clk_period;
		load <= '1';
		wait for clk_period;
		load <= '0';
		wait for clk_period;
		load <= '1';
		wait for clk_period;
		load <= '0';
		wait for clk_period;
		load <= '1';
		
      wait;
   end process;

END;
