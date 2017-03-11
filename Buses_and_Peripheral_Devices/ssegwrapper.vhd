library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ssegwrapper is
	generic (Dwidth		: integer := 8;
				Awidth		: integer := 8;
				BaseAddr		: std_logic_vector(7 downto 0) := "00000010"; --assigning base address
				Digits		: integer := 1);
	
	port (Din				: in std_logic_vector (Dwidth-1 downto 0);
			Dout				: out std_logic_vector (Dwidth-1 downto 0);
			Addr				: in std_logic_vector (Awidth-1 downto 0);
			userClk			: in std_logic; -- userClk represents debounced btnRW (i.e. RW select)
			mclk, RW			: in std_logic;
			req				: out std_logic;
			ssegDisplayLEDs: out std_logic_vector (7 downto 0);
			digitDisplayed: out std_logic_vector(3 downto 0));
end ssegwrapper;

architecture Structural of ssegwrapper is
	signal sevenSegEnable: std_logic; -- enable seven seg display
	signal display: std_logic_vector(3 downto 0); -- which digit is being displayed
	signal input: std_logic_vector(15 downto 0); -- input for 4-digit seven segment display
	signal counter: std_logic; -- used to count between register1 and register2
	signal enableReg1, enableReg2: std_logic;
	signal readReg1, readReg2: std_logic_vector(7 downto 0);
	--signal digit0: std_logic_vector(3 downto 0);

	component DataRegister is
		port(enable, clk: in std_logic;
			  D: in std_logic_vector(7 downto 0);
			  Q: out std_logic_vector(7 downto 0) );
	end component;

	component SevenSegDisplay is
		port (mclk: in std_logic;
				enableSSeg: in std_logic;
				input: in std_logic_vector(15 downto 0);
				displayLEDs: out std_logic_vector(7 downto 0);
				digitDisplayed: out std_logic_vector(3 downto 0) );
	end component;

begin
	Register1: DataRegister port map (enableReg1, mclk, Din, readReg1); -- 8 bit register (SSeg input 15 downto 8)
	Register2: DataRegister port map (enableReg2, mclk, Din, readReg2); -- 8 bit register (SSeg input 7 downto 0)
	SevenSegmentDisplay: SevenSegDisplay port map (mclk, sevenSegEnable, input, ssegDisplayLEDs, display);
	
	process(Din, Addr, userClk, RW)
	begin
		-- Sending 16 bits of input for 7seg via 2 registers
		input(15 downto 8) <= readReg1; -- first 8 bits of 7seg input given by register1
		input(7 downto 0) <= readReg2; --last 8 bits of 7seg input given by register2
		Dout <= Din;
		DigitDisplayed <= display;
		
		-- Displaying data through seven segment display
		if (userClk'event and userClk='1') then
			if (RW='1') then -- Read/Write = 1, write to registers
				if (counter='0') then -- Determine which register to write to (register 1)
					counter <= '1'; -- increment counter so next register can receive data
					enableReg1 <= '1'; -- ENABLE load on register 1
					enableReg2 <= '0'; -- DISABLE load on register 2
					sevenSegEnable <= '0'; -- wait until full 16 bits to display results on 7SegDisplay
				elsif(counter='1') then -- Determine which register to write to (register 2)
					counter <= '0'; -- reset counter
					enableReg1 <= '0'; -- DISABLE load on register 1
					enableReg2 <= '1'; -- ENABLE load on register 2
					sevenSegEnable <= '1'; -- full 16 bits obtained -> enable sevenseg to display results
				end if;
			else -- Read/Write = 0, don't write to registers
				enableReg1 <= '0';
				enableReg2 <= '0';
			end if;
		end if;
		
		-- Address Comparator to make sure that peripheral 1 is the peripheral being addressed.
		if(Addr = BaseAddr) then
			req <= '1';
		else
			req <= '0';
		end if;
	end process;
	
end Structural;
