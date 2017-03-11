----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:33:47 03/01/2015 
-- Design Name: 
-- Module Name:    topLevel - Structural 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity topLevel is
	port ( btnRW: in std_logic;
			 btn: in std_logic_vector(1 downto 0);
			 clk, sw1, mclk: in std_logic;
			 sevenSegLEDs: out std_logic_vector(7 downto 0);
			 digitToDisplay: out std_logic_vector(3 downto 0) );
end topLevel;

architecture Structural of topLevel is
	--Mout is master data out, Min is master data in, addr is the address
	signal Bus_Mout, Bus_Min1, Bus_Min2, Bus_Min3, Bus_addr : std_logic_vector (7 downto 0);
	signal req : std_logic_vector(2 downto 0);
	signal Bus_Min : std_logic_vector (7 downto 0);
	signal RW : std_logic;
	signal debouncedBtnRW: std_logic;
	
	component ssegwrapper is
		generic (Dwidth		: integer := 8;
					Awidth		: integer := 8;
					BaseAddr		: std_logic_vector(7 downto 0) := "00000010"; --assigning base address
					Digits		: integer := 1);
		
		port (Din				: in std_logic_vector (Dwidth-1 downto 0);
				Dout				: out std_logic_vector (Dwidth-1 downto 0);
				Addr				: in std_logic_vector (Awidth-1 downto 0);
				userClk, mclk, RW	: in std_logic;
				req				: out std_logic;
				ssegDisplayLEDs: out std_logic_vector (7 downto 0);
				digitDisplayed: out std_logic_vector(3 downto 0));
	end component;
	
	component debouncer is
    Port ( button : in  STD_LOGIC;
           mclk : in  STD_LOGIC;
           debouncedButton : out  STD_LOGIC);
	end component;
	
begin
	peripheral1: ssegwrapper port map (Bus_Mout, Bus_Min1, Bus_addr, debouncedBtnRW, mclk, RW, req(0), sevenSegLEDs, digitToDisplay);
	--peripheral2: switchbank port map (Bus_addr, Bus_Mout, Bus_Min2, req(1), RW, clk, sw1);
	--peripheral3: memory port map (Bus_addr, Bus_Mout, Bus_Min3, req(2), RW, clk);
	--master: cpu port map(Bus_addr, Bus_Min, Bus_Mout, RW, clk);
	debounceBTN: debouncer port map (btnRW, mclk, debouncedBtnRW);
	arb: Bus_Min <= Bus_Min1 when req(0)='1' else
						 Bus_Min2 when req(1)='1' else
						 Bus_Min3 when req(2)='1' else
						 "00000000";
end Structural;

