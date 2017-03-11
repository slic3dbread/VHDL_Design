library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Input20DigitsForSevenSeg is
	port ( mclk, BTNS, BTNU, BTNL, BTND, BTNR: in std_logic;
			 SW: in std_logic_vector(7 downto 0);
			 display: out std_logic_vector(7 downto 0);
			 DP: out std_logic_vector(3 downto 0));
end Input20DigitsForSevenSeg;

architecture Structural of Input20DigitsForSevenSeg is
	signal input: std_logic_vector(15 downto 0);
	signal dataOut: std_logic_vector(15 downto 0);
	signal digit: std_logic_vector(3 downto 0);
	signal enable: std_logic_vector(3 downto 0);

component FourDigitSevenSegController is
	port(	mclk: in std_logic; -- FPGA internal clock
			input: in std_logic_vector(15 downto 0);
			EN: out std_logic_vector(3 downto 0); -- enable for digit selector
			O: out std_logic_vector(3 downto 0) );
end component;

component senv_seg_SingleDigit is
	port(	a: in std_logic_vector(3 downto 0);
		   en: in std_logic_vector(3 downto 0);
		   b: out std_logic_vector(7 downto 0);
		   AN0, AN1, AN2, AN3: out std_logic);
end component;

--component RegisterFile is
--	generic ( Dwidth : integer := 16;
--				 Awidth : integer := 8 );
--	port ( we, clk: std_logic;
--			 ReadAddr1, ReadAddr2, WriteAddr: in std_logic_vector (Awidth-1 downto 0);
--			 DataOut1, DataOut2: out std_logic_vector (Dwidth-1 downto 0);
--			 DataIn: in std_logic_vector (Dwidth-1 downto 0) );
--end component;

component lab3mem is
	generic (
		Dwidth : integer := 16;
		Awidth : integer := 8);
	port (
		we,clk: in std_logic;
		addr: in std_logic_vector(Awidth-1 downto 0);
		din: in std_logic_vector(Dwidth-1 downto 0);
		dout: out std_logic_vector(Dwidth-1 downto 0)
	);
end component;

begin
	process(SW, BTNS, BTNU, BTNL, BTND, BTNR)
	begin
		if BTNS = '1' then
			input <= "1000100010001000"; -- 8888
		elsif BTNU = '1' then
			input <= "1010101111001101"; -- ABCD
		elsif BTNL = '1' then
			input <= "0101010000110010"; -- 5432
		elsif BTND = '1' then
			input <= "0000100110010111"; -- 0997
		elsif BTNR = '1' then
			input <= "0000010101001000"; -- 0548
		else
			input <= "0000000000000000"; -- off by default
		end if;
	end process;
	
	--RFile: RegisterFile port map ('0', mclk, SW, SW, SW, input, dataOut);
	Memory: lab3mem port map ('0', mclk, SW, input, dataOut);
	SevenSegController: FourDigitSevenSegController port map (mclk, dataOut, enable, digit);
	SingleDigitSeg: senv_seg_SingleDigit port map (digit, enable, display, DP(0), DP(1), DP(2), DP(3));
end Structural;

