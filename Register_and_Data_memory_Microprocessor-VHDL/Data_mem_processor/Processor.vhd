----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:30:10 02/08/2017 
-- Design Name: 
-- Module Name:    Processor - Behavioral 
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
use IEEE.numeric_std.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Processor is port(
	clk: in std_logic:= '0';
	mclk: in std_logic:= '0';
	segment : out  STD_LOGIC_VECTOR (3 downto 0);
	leds: out std_logic_vector(7 downto 0));
end Processor;

architecture Behavioral of Processor is


component ALU_Behavioural is
    generic (
			  Dwidth : integer := 16);
    Port ( sel : in  STD_LOGIC_VECTOR (2 downto 0);
           x : in  STD_LOGIC_VECTOR (Dwidth-1 downto 0);
           y : in  STD_LOGIC_VECTOR (Dwidth-1 downto 0);
           c_in : in  STD_LOGIC;
           c_out : out  STD_LOGIC;
           overflow : out  STD_LOGIC;
           z : out  STD_LOGIC_VECTOR (Dwidth-1 downto 0));
           --lt : out  STD_LOGIC);
end component;

component Zreg IS PORT(
    d   : IN std_logic_vector(15 downto 0):="0000000000000000";
    load  : IN STD_LOGIC; -- load/enable.
    clr : IN STD_LOGIC; -- async. clear.
    clk : IN STD_LOGIC; -- clock.
    q   : OUT std_logic_vector(15 downto 0) -- output.
);
end component;

component regFile is
	generic (--generic width for easy implementation
		Dwidth : integer := 16;
		Awidth : integer := 3); -- 2**3=8 registers
	port (--2 reads 1 write
		ReadAddr1, ReadAddr2, WriteAddr : in std_logic_vector(Awidth-1 downto 0);
		DataOut1, DataOut2  : out std_logic_vector(Dwidth-1 downto 0);
		DataToLed : out std_logic_vector(Dwidth-1 downto 0);
		DataIn : in std_logic_vector(Dwidth-1 downto 0);
		Wen, clk : in std_logic);
end component;

component shifter is
    Port ( shamt : in  STD_LOGIC_VECTOR (2 downto 0);
           shftDir : in  STD_LOGIC;
           shftEn : in  STD_LOGIC;
           dataIn : in  STD_LOGIC_VECTOR (15 downto 0);
           dataOut : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component signExtender is
    Port ( Din : in  STD_LOGIC_VECTOR (5 downto 0);
           Dout : out  STD_LOGIC_VECTOR (15 downto 0));
end component;

component PCreg IS PORT(
    d   : IN std_logic_vector(15 downto 0):="0000000000000000";
    load  : IN STD_LOGIC; -- load/enable.
    clr : IN STD_LOGIC; -- async. clear.
    clk : IN STD_LOGIC; -- clock.
    q   : OUT std_logic_vector(15 downto 0):="0000000000000000"); -- output.
end component;

component incrementor is
    Port ( PCin : in  STD_LOGIC_VECTOR (15 downto 0);
           PCplusOne : out  STD_LOGIC_VECTOR (15 downto 0);
           incr : in  STD_LOGIC);
end component;

component InstructionMem is
generic (
    Dwidth : integer := 16; -- Each location is 16 bits
    Awidth : integer := 8); -- 8 Address lines (i.e., 64 locations)
port (
    we,clk: in std_logic;
    addr: in std_logic_vector(Awidth-1 downto 0);
    din: in std_logic_vector(Dwidth-1 downto 0);
    dout: out std_logic_vector(Dwidth-1 downto 0)
);
end component;

component DataMem is
generic (
    Dwidth : integer := 16; -- Each location is 16 bits
    Awidth : integer := 8); -- 8 Address lines (i.e., 64 locations)
port (
    we,clk: in std_logic;
    addr: in std_logic_vector(Awidth-1 downto 0);
    din: in std_logic_vector(Dwidth-1 downto 0);
    dout: out std_logic_vector(Dwidth-1 downto 0)
);
end component;

component MUX_2to1_16bit is
    Port ( i0 : in  STD_LOGIC_VECTOR (15 downto 0);
           i1 : in  STD_LOGIC_VECTOR (15 downto 0);
           c : out  STD_LOGIC_VECTOR (15 downto 0);
           sel : in  STD_LOGIC);
end component;

component MUX_2to1_3bit is
    Port ( i0 : in  STD_LOGIC_VECTOR (2 downto 0);
           i1 : in  STD_LOGIC_VECTOR (2 downto 0);
           c : out  STD_LOGIC_VECTOR (2 downto 0);
           sel : in  STD_LOGIC);
end component;

component Controller is Port(
	opCode  : IN std_logic_vector(3 downto 0):="0000";
	shamnt : IN std_logic_vector(2 downto 0);
	ALUCtrl : OUT std_logic_vector(2 downto 0);
	memToReg : OUT std_logic;
	shiftDirection : OUT STD_LOGIC;
	shiftEnable : OUT STD_LOGIC;
	regWrite : OUT STD_LOGIC;
	dataMemWrite : OUT STD_LOGIC;
	regDest : OUT STD_LOGIC;
	PCInc: OUT STD_LOGIC;
	aluSrc: OUT STD_LOGIC);
end component;

component SevenSegController is Port( 
	input : in  STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";    
	mclk: in std_logic;
	segment : out  STD_LOGIC_VECTOR (3 downto 0);
	leds: out std_logic_vector(7 downto 0));
end component;

--signals for shifter
signal shiftAmntSig : STD_LOGIC_VECTOR(2 downto 0);
signal shiftOutput : STD_LOGIC_VECTOR(15 downto 0);
signal instructMemOut : STD_LOGIC_VECTOR(15 downto 0);
signal ALUCtrlSig : STD_LOGIC_VECTOR(2 downto 0);
signal regDataInSig : STD_LOGIC_VECTOR(15 downto 0);
signal dataToLedOut : STD_LOGIC_VECTOR(15 downto 0);
signal readData1Sig : STD_LOGIC_VECTOR(15 downto 0);
signal readData2Sig : STD_LOGIC_VECTOR(15 downto 0);
signal regWriteAddrSig : STD_LOGIC_VECTOR(2 downto 0);
signal rsSig : STD_LOGIC_VECTOR(2 downto 0);
signal rtSig : STD_LOGIC_VECTOR(2 downto 0);
signal dataMemAddrSig : STD_LOGIC_VECTOR(7 downto 0);
signal dataMemInSig : STD_LOGIC_VECTOR(15 downto 0);
signal dataMemOutSig : STD_LOGIC_VECTOR(15 downto 0);
signal writeRegMuxOutSig : STD_LOGIC_VECTOR(2 downto 0);
signal rdSig : STD_LOGIC_VECTOR(2 downto 0);
signal opCodeSig : STD_LOGIC_VECTOR(3 downto 0);
signal PCplusOneSig : STD_LOGIC_VECTOR(15 downto 0);
signal PCoutSig : STD_LOGIC_VECTOR(15 downto 0);
signal aluOut : STD_LOGIC_VECTOR(15 downto 0);
signal instructMemAddrSig : STD_LOGIC_VECTOR(7 downto 0);
signal aluMuxOut : STD_LOGIC_VECTOR(15 downto 0);
signal instructExtSig : STD_LOGIC_VECTOR(15 downto 0);

--Control Signals
signal shiftDirectionSig : STD_LOGIC;
signal shiftEnableSig : STD_LOGIC;
signal regWriteSig : STD_LOGIC;
signal carryInSig : STD_LOGIC;
signal carryOutSig : STD_LOGIC;
signal overFlowSig : STD_LOGIC;
signal dataMemWriteSig : STD_LOGIC;
signal memToRegSig : STD_LOGIC;
signal regDestSig : STD_LOGIC;
signal PCIncrSig : STD_LOGIC;
signal aluSrcSig : STD_LOGIC;


--Clock Signals
signal clkdiv : std_logic_vector(0 downto 0);		-- counter for clock divider
--signal clk : std_logic;

begin
	
	
--	process (mclk)						-- create system clock divder
--	begin
--		if mclk = '1' and mclk'Event then	
--			clkdiv <= clkdiv +1;
--		end if;	    
--	end process;

--	clk <= clkdiv(0);
	rsSig <= instructMemOut(11 downto 9);
	rtSig <= instructMemOut(8 downto 6);
	rdSig <= instructMemOut(5 downto 3);
	shiftAmntSig <= instructMemOut(2 downto 0);
	opCodeSig <= instructMemOut(15 downto 12);
	dataMemAddrSig <= shiftOutput(7 downto 0);
	instructMemAddrSig <= PCoutSig(7 downto 0);
	instructExtSig(15 downto 6) <= "0000000000";
	instructExtSig(5 downto 0) <= instructMemOut(5 downto 0);
	
	PCRegister : PCReg port map(
		d => PCplusOneSig,
		load => PCIncrSig,
		clr => '0',
		clk => clk,
		q => PCoutSig);
		
	incr : incrementor port map(
		PCin => PCoutSig,
		PCplusOne => PCplusOneSig,
		incr => PCIncrSig);
		
	ShifterNew : shifter port map(
		shamt => shiftAmntSig,
      shftDir => shiftDirectionSig,
      shftEn => shiftEnableSig,
      dataIn => aluOut,
      dataOut => shiftOutput);
	
	InstructMem : InstructionMem port map(
		we => '0',
		clk => clk,
		addr => instructMemAddrSig,
		din => "0000000000000000",
		dout => instructMemOut);
			
	ALU : ALU_Behavioural port map(
		sel => ALUCtrlSig,
		x => readData1Sig,
		y => aluMuxOut,
		c_in => carryInSig,
		c_out => carryInSig,
		overflow => overFlowSig,
		z => aluOut);
				
	registers : regFile port map(
		ReadAddr1 => rsSig,
		ReadAddr2 => rtSig,
		WriteAddr => regWriteAddrSig,
		DataOut1=> readData1Sig,
		DataOut2 => readData2Sig,
		DataToLed => dataToLedOut,
		DataIn => regDataInSig,
		Wen => regWriteSig,
		clk => clk);
		
	dataMemory : DataMem port map(
		we => dataMemWriteSig,
		clk => clk,
		addr => dataMemAddrSig,
		din => readData2Sig,
		dout => dataMemOutSig);
		
	datatMemMux : MUX_2to1_16bit port map(
		 i0 => shiftOutput,
       i1 => dataMemOutSig,
       c => regDataInSig,
       sel => memToRegSig);
		 
	aluInputMux : MUX_2to1_16bit port map(
		 i0 => readData2Sig,
       i1 => instructExtSig,
       c => aluMuxOut,
       sel => aluSrcSig);
		 
	writeRegMux : MUX_2to1_3bit port map(
		 i0 => rtSig,
       i1 => rdSig,
       c => regWriteAddrSig,
       sel => regDestSig);
	
	Control : Controller port map(
		opCode => opCodeSig,
		shamnt => shiftAmntSig,
		ALUCtrl => ALUCtrlSig,
		shiftDirection => shiftDirectionSig,
		shiftEnable => shiftEnableSig,
		regWrite => regWriteSig,
		dataMemWrite => dataMemWriteSig,
		memToReg => memToRegSig,
		regDest => regDestSig,
		PCInc => PCIncrSig,
		aluSrc => aluSrcSig);
		
	sevenSeg : SevenSegController port map(
		input => dataToLedOut,
		mclk => mclk,
		segment => segment,
		leds =>leds);
	
end Behavioral;

