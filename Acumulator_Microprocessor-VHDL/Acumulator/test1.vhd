--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:50:20 01/30/2017
-- Design Name:   
-- Module Name:   H:/4540/lab1/test1.vhd
-- Project Name:  lab1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PCreg
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
 
ENTITY test1 IS
END test1;
 
ARCHITECTURE behavior OF test1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PCreg
    PORT(
         d : IN  std_logic_vector(15 downto 0);
         load : IN  std_logic;
         clr : IN  std_logic;
         clk : IN  std_logic;
         incr : IN  std_logic;
         currentPC : IN  std_logic_vector(15 downto 0);
         q : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal d : std_logic_vector(15 downto 0) := (others => '0');
   signal load : std_logic := '0';
   signal clr : std_logic := '0';
   signal clk : std_logic := '0';
   signal incr : std_logic := '0';
   signal currentPC : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal q : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PCreg PORT MAP (
          d => d,
          load => load,
          clr => clr,
          clk => clk,
          incr => incr,
          currentPC => currentPC,
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
		
		clr <= '1';
		currentPC<= q;
		wait for clk_period;
		clr <= '0';
		d <= "0001000100010001";
		load <= '1';
		currentPC <= q;
		wait for clk_period;
		load <= '0';
		incr <= '1';
		currentPC <= q;
		wait for clk_period;	
		incr <= '0';
		currentPC <= q;
		wait for clk_period;	
      -- insert stimulus here 

      wait;
   end process;

END;
