--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:15:37 02/09/2015
-- Design Name:   
-- Module Name:   H:/ENGG3380/Lab3 - RAM_REG_ALU/Four-Digit_7-Seg_Controller/MemoryTB.vhd
-- Project Name:  Four-Digit_7-Seg_Controller
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: singlePortMemory
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
 
ENTITY MemoryTB IS
END MemoryTB;
 
ARCHITECTURE behavior OF MemoryTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT singlePortMemory
    PORT(
         ReadAddr1 : IN  std_logic_vector(7 downto 0);
         ReadAddr2 : IN  std_logic_vector(7 downto 0);
         WriteAddr : IN  std_logic_vector(7 downto 0);
         DataOut1 : OUT  std_logic_vector(15 downto 0);
         DataOut2 : OUT  std_logic_vector(15 downto 0);
         DataIn : IN  std_logic_vector(15 downto 0);
         we : IN  std_logic;
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal ReadAddr1 : std_logic_vector(7 downto 0) := (others => '0');
   signal ReadAddr2 : std_logic_vector(7 downto 0) := (others => '0');
   signal WriteAddr : std_logic_vector(7 downto 0) := (others => '0');
   signal DataIn : std_logic_vector(15 downto 0) := (others => '0');
   signal we : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal DataOut1 : std_logic_vector(15 downto 0);
   signal DataOut2 : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: singlePortMemory PORT MAP (
          ReadAddr1 => ReadAddr1,
          ReadAddr2 => ReadAddr2,
          WriteAddr => WriteAddr,
          DataOut1 => DataOut1,
          DataOut2 => DataOut2,
          DataIn => DataIn,
          we => we,
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
		
		-- read from address lines 1 and 2, write to 3 
		ReadAddr1 <= "00000001";
		ReadAddr2 <= "00000010";
		WriteAddr <= "00000011";
		DataIn <= "0000000000000001";
		we <= '1';
		
		wait for clk_period*10;

		-- read from address lines 4 and 3, don't write
		ReadAddr1 <= "00000100";
		ReadAddr2 <= "00000011";
		WriteAddr <= "00000101";
		DataIn <= "0000000000000010";
		we <= '0';
		
		wait for clk_period*10;

		-- read from address lines 4 and 5, overwrite 3
		ReadAddr1 <= "00000100";
		ReadAddr2 <= "00000101";
		WriteAddr <= "00000011";
		DataIn <= "0000000000000101";
		we <= '1';
		
		wait for clk_period*10;

		-- read from address lines 8 and 3, write to 7
		ReadAddr1 <= "00001000";
		ReadAddr2 <= "00000011";
		WriteAddr <= "00000111";
		DataIn <= "0000000000000011";
		we <= '1';
		
		wait for clk_period*10;


      -- insert stimulus here 

      wait;
   end process;

END;
