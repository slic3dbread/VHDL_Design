library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SevenSegDisplay is
	port (mclk: in std_logic;
			displayLEDs: out std_logic_vector(7 downto 0);
			digitDisplayed: out std_logic_vector(3 downto 0) );
end SevenSegDisplay;

architecture Structural of SevenSegDisplay is
	signal input: std_logic_vector(15 downto 0);
	signal digit: std_logic_vector(3 downto 0);
	signal enableDisplay: std_logic_vector(3 downto 0);
	
	component FourDigitSevenSegController is
		port (mclk: in std_logic; -- FPGA internal clock
				input: in std_logic_vector(15 downto 0);
				EN: out std_logic_vector(3 downto 0); -- enable for digit selector
				O: out std_logic_vector(3 downto 0) );
	end component;
	
	component SevenSegDecoder is
		port(	a: in std_logic_vector(3 downto 0);
				en: in std_logic_vector(3 downto 0);
				b: out std_logic_vector(7 downto 0);
				AN0, AN1, AN2, AN3: out std_logic);
	end component;

begin
	SevenSegController: FourDigitSevenSegController port map (mclk, input, enableDisplay, digit);
	SevenSegDecoder: sevensegdecoder port map (digit, enableDisplay, displayLEDs, digitDisplayed(0), digitDisplayed(1), digitDisplayed(2), digitDisplayed(3));
end Structural;

