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
	 stall : IN STD_LOGIC := '0';
    q   : OUT std_logic_vector(15 downto 0):="0000000000000000"); -- output.
end component;

component incrementor is
    Port ( PCin : in  STD_LOGIC_VECTOR (15 downto 0);
			  stall : in STD_LOGIC;
           PCplusOne : out  STD_LOGIC_VECTOR (15 downto 0);
           clk : IN STD_LOGIC;
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

component IRreg IS PORT(
    d   : IN std_logic_vector(15 downto 0):="0000000000000000"; --instruction
    load  : IN STD_LOGIC; -- load/enable.
    clr : IN STD_LOGIC; -- async. clear.
    clk : IN STD_LOGIC; -- clock.
	 stall : IN STD_LOGIC;
    q   : OUT std_logic_vector(15 downto 0):="0000000000000000"); -- output.
end component;

component id_exReg IS PORT(
	load  : IN STD_LOGIC; -- load/enable.
	clr : IN STD_LOGIC; -- async. clear.
	clk : IN STD_LOGIC; -- clock.
	
	RD1In   : IN std_logic_vector(15 downto 0):="0000000000000000"; 
	RD1Out   : out std_logic_vector(15 downto 0):="0000000000000000";
	
	RD2In   : IN std_logic_vector(15 downto 0):="0000000000000000"; 
	RD2Out   : out std_logic_vector(15 downto 0):="0000000000000000";
	
	rsIn : IN std_logic_vector(2 downto 0):="000";
	rsOut : out std_logic_vector(2 downto 0):="000"; 
	
	rtin : IN std_logic_vector(2 downto 0):="000";
	rtOut : out std_logic_vector(2 downto 0):="000";
	
	rdIn : IN std_logic_vector(2 downto 0):="000";
	rdOut : out std_logic_vector(2 downto 0):="000";
	
	shiftAmountIn : in std_logic_vector(2 downto 0):="000";
	shiftAmountOut : out std_logic_vector(2 downto 0):="000";
	
	instructExtIn : in std_logic_vector(15 downto 0):="0000000000000000";
	instructExtOut : out std_logic_vector(15 downto 0):="0000000000000000";
	
	ALUCtrlIn : in std_logic_vector(2 downto 0):="000";
	ALUCtrlOut : OUT std_logic_vector(2 downto 0):="000";
	
	shiftDirectionIn : In STD_LOGIC:='0';
	shiftDirectionOut : OUT STD_LOGIC:='0';
	
	shiftEnableIn : in STD_LOGIC:='0';
	shiftEnableOut : OUT STD_LOGIC:='0';
	
	regWriteIn : in STD_LOGIC:='0';
	regWriteOut : OUT STD_LOGIC:='0';
	
	dataMemWriteIn : in STD_LOGIC:='0';
	dataMemWriteOut : OUT STD_LOGIC:='0';
	
	memToRegIn : in STD_LOGIC:='0';
	memToRegOut : OUT STD_LOGIC:='0';
	
	regDestIn : in STD_LOGIC:='0';
	regDestOut : OUT STD_LOGIC:='0';
	
	aluSrcIn :in STD_LOGIC:='0';
	aluSrcOut :OUT STD_LOGIC:='0'; -- output.
	
	instruction_copy_in : IN std_logic_vector(15 downto 0):="0000000000000000";
	instruction_copy_out : OUT std_logic_vector(15 downto 0):="0000000000000000");
end component;

component ex_memReg IS PORT(
	load  : IN STD_LOGIC; -- load/enable.
	clr : IN STD_LOGIC; -- async. clear.
	clk : IN STD_LOGIC; -- clock.
	
	RD2In   : IN std_logic_vector(15 downto 0):="0000000000000000"; --instruction
	RD2Out   : out std_logic_vector(15 downto 0):="0000000000000000"; --instruction
	
	regWriteIn : in STD_LOGIC:='0';
	regWriteOut : OUT STD_LOGIC:='0';
	
	dataMemWriteIn : in STD_LOGIC:='0';
	dataMemWriteOut : OUT STD_LOGIC:='0';
	
	memToRegIn : in STD_LOGIC:='0';
	memToRegOut : OUT STD_LOGIC:='0';
	
	
	regWriteAddrIn : in STD_LOGIC_VECTOR(2 downto 0):="000";
	regWriteAddrOut : out STD_LOGIC_VECTOR(2 downto 0):="000";
	
	shiftOutputIn : in STD_LOGIC_VECTOR(15 downto 0):="0000000000000000";
	shiftOutputOut : out STD_LOGIC_VECTOR(15 downto 0):="0000000000000000");
end component;

component mem_wbReg IS PORT(
	load  : IN STD_LOGIC; -- load/enable.
	clr : IN STD_LOGIC; -- async. clear.
	clk : IN STD_LOGIC; -- clock.	
	
	regWriteAddrIn : in STD_LOGIC_VECTOR(2 downto 0):="000";
	regWriteAddrOut : out STD_LOGIC_VECTOR(2 downto 0):="000";
	
	memToRegIn : in STD_LOGIC:='0';
	memToRegOut : OUT STD_LOGIC:='0';
	
	regWriteIn : in STD_LOGIC:='0';
	regWriteOut : OUT STD_LOGIC:='0';
	
	dataMemOutIn : in STD_LOGIC_VECTOR(15 downto 0):="0000000000000000";
	dataMemOutOut : out STD_LOGIC_VECTOR(15 downto 0):="0000000000000000";
	
	shiftOutputIn : in STD_LOGIC_VECTOR(15 downto 0):="0000000000000000";
	shiftOutputOut : out STD_LOGIC_VECTOR(15 downto 0):="0000000000000000"); -- output.
end component;

component hazardDetect IS PORT(
    if_idrs : IN std_logic_vector(2 downto 0):="000";
	 if_idrt : IN std_logic_vector(2 downto 0):="000";
	 id_exrt : IN std_logic_vector(2 downto 0):="000";
	 id_exMemRead : IN std_logic := '0';
	 clk : IN std_logic := '0';
    stall   : OUT std_logic:='0'); -- output.
end component;

component aluAInputMux_4to1_16bit is
    Port ( i0 : in  STD_LOGIC_VECTOR (15 downto 0);
           i1 : in  STD_LOGIC_VECTOR (15 downto 0);
			  i2 : in  STD_LOGIC_VECTOR (15 downto 0);
           c : out  STD_LOGIC_VECTOR (15 downto 0);
           sel : in  STD_LOGIC_VECTOR (1 downto 0));
end component;

component aluBInputMux_4to1_16bit is
    Port ( i0 : in  STD_LOGIC_VECTOR (15 downto 0);
           i1 : in  STD_LOGIC_VECTOR (15 downto 0);
			  i2 : in  STD_LOGIC_VECTOR (15 downto 0);
           c : out  STD_LOGIC_VECTOR (15 downto 0);
           sel : in  STD_LOGIC_VECTOR (1 downto 0));
end component;

component forwardingUnit is
    Port ( if_idrs : IN std_logic_vector(2 downto 0):="000";
			  if_idrt : IN std_logic_vector(2 downto 0):="000";
			  id_exrs : IN std_logic_vector(2 downto 0):="000";
			  id_exrt : IN std_logic_vector(2 downto 0):="000";
			  ex_memrd : IN std_logic_vector(2 downto 0):="000";
			  mem_wbrd : IN std_logic_vector(2 downto 0):="000";
			  ex_memRegWrite : IN std_logic := '0';
			  mem_wbRegWrite : IN std_logic := '0';
           forwardA : OUT std_logic_vector(1 downto 0):="00";
			  forwardB : OUT std_logic_vector(1 downto 0):="00");
end component;

--signals for shifter
signal shiftAmntSig : STD_LOGIC_VECTOR(2 downto 0);
signal shiftAmntid_exRegSig : STD_LOGIC_VECTOR(2 downto 0);
signal shiftOutputSig : STD_LOGIC_VECTOR(15 downto 0);
signal instructMemOutSig : STD_LOGIC_VECTOR(15 downto 0);
signal instructMemOutIRRegSig : STD_LOGIC_VECTOR(15 downto 0);
signal ALUCtrlSig : STD_LOGIC_VECTOR(2 downto 0);
signal regDataInSig : STD_LOGIC_VECTOR(15 downto 0);
signal dataToLedOut : STD_LOGIC_VECTOR(15 downto 0);
signal readData1Sig : STD_LOGIC_VECTOR(15 downto 0);
signal readData1id_exRegSig : STD_LOGIC_VECTOR(15 downto 0);
signal readData1RegRegSig : STD_LOGIC_VECTOR(15 downto 0);
signal readData2Sig : STD_LOGIC_VECTOR(15 downto 0);
signal readData2id_exRegSig : STD_LOGIC_VECTOR(15 downto 0);
signal regWriteAddrSig : STD_LOGIC_VECTOR(2 downto 0);
signal rsSig : STD_LOGIC_VECTOR(2 downto 0);
signal rsid_exRegSig : STD_LOGIC_VECTOR(2 downto 0);
signal rtSig : STD_LOGIC_VECTOR(2 downto 0);
signal rtid_exRegSig : STD_LOGIC_VECTOR(2 downto 0);
signal dataMemAddrSig : STD_LOGIC_VECTOR(7 downto 0);
signal dataMemInSig : STD_LOGIC_VECTOR(15 downto 0);
signal dataMemOutSig : STD_LOGIC_VECTOR(15 downto 0);
signal writeRegMuxOutSig : STD_LOGIC_VECTOR(2 downto 0);
signal rdSig : STD_LOGIC_VECTOR(2 downto 0);
signal rdid_exRegSig : STD_LOGIC_VECTOR(2 downto 0);
signal opCodeSig : STD_LOGIC_VECTOR(3 downto 0);
signal PCplusOneSig : STD_LOGIC_VECTOR(15 downto 0);
signal PCoutSig : STD_LOGIC_VECTOR(15 downto 0);
signal aluOut : STD_LOGIC_VECTOR(15 downto 0);
signal instructMemAddrSig : STD_LOGIC_VECTOR(7 downto 0);
signal aluMuxOut : STD_LOGIC_VECTOR(15 downto 0);
signal instructExtSig : STD_LOGIC_VECTOR(15 downto 0);
signal ALUCtrlid_exRegSig : STD_LOGIC_VECTOR(2 downto 0); 
signal instructExtid_exRegSig : STD_LOGIC_VECTOR(15 downto 0); 
signal shiftOutputex_memRegSig : STD_LOGIC_VECTOR(15 downto 0);
signal shiftOutputmem_wbRegSig : STD_LOGIC_VECTOR(15 downto 0);
signal regWriteAddrex_memRegSig : STD_LOGIC_VECTOR(2 downto 0);
signal readData2ex_memRegSig : STD_LOGIC_VECTOR(15 downto 0);
signal dataMemOutmem_wbRegSig : STD_LOGIC_VECTOR(15 downto 0);
signal aluAMuxOutSig : STD_LOGIC_VECTOR(15 downto 0);
signal aluBMuxOutSig : STD_LOGIC_VECTOR(15 downto 0);
signal datamemaddrregsig : STD_LOGIC_vector(7 downto 0);
signal regWriteAddrmem_wbRegSig : STD_LOGIC_Vector(2 downto 0);

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
signal aluSrcid_exRegSig : STD_LOGIC;
signal dataMemWriteid_exRegSig : STD_LOGIC;
signal regDestid_exRegSig : STD_LOGIC;
signal memToRegid_exRegSig : STD_LOGIC;
signal memToRegex_memRegSig : STD_LOGIC;
signal regWriteid_exRegSig : STD_LOGIC;
signal regWriteex_memRegSig : STD_LOGIC;
signal regWritemem_wbRegSig : STD_LOGIC;
signal shiftEnableid_exRegSig : STD_LOGIC;
signal shiftDirectionid_exRegSig : STD_LOGIC;
signal memToRegmem_wbRegSig : STD_LOGIC;
signal dataMemWriteex_memRegSig : STD_LOGIC;
signal stallSig : STD_lOGIC;
signal forwardASig : STD_LOGIC_Vector(1 downto 0);
signal forwardBSig : STD_LOGIC_Vector(1 downto 0);

--Clock Signals
signal clkdiv : std_logic_vector(0 downto 0);		-- counter for clock divider
--signal clk : std_logic;

signal instructMemOutid_exRegSig : STD_LOGIC_Vector(15 downto 0);

begin
	
	
--	process (mclk)						-- create system clock divder
--	begin								-- not used for simulation
--		if mclk = '1' and mclk'Event then	
--			clkdiv <= clkdiv +1;
--		end if;	    
--	end process;

--	clk <= clkdiv(0);

	--signals from instruction register
	rsSig <= instructMemOutIRRegSig(11 downto 9);
	rtSig <= instructMemOutIRRegSig(8 downto 6);
	rdSig <= instructMemOutIRRegSig(5 downto 3);
	shiftAmntSig <= instructMemOutIRRegSig(2 downto 0);
	opCodeSig <= instructMemOutIRRegSig(15 downto 12);
	
	--only 8 bit data mem address
	dataMemAddrSig <= shiftOutputex_memRegSig(7 downto 0);
	
	--only 8 bit instruction mem
	instructMemAddrSig <= PCoutSig(7 downto 0);

	--for load and stores imidiate value extention
	instructExtSig(15 downto 6) <= "0000000000";
	instructExtSig(5 downto 0) <= instructMemOutIRRegSig(5 downto 0);
	
	--port maps for all components
	PCRegister : PCReg port map(
		d => PCplusOneSig,
		load => PCIncrSig,
		clr => '0',
		clk => clk,
		stall => stallSig,
		q => PCoutSig);
		
	incr : incrementor port map(
		PCin => PCoutSig,
		stall => stallSig,
		clk => clk,
		PCplusOne => PCplusOneSig,
		incr => PCIncrSig);
		
	ShifterNew : shifter port map(
		shamt => shiftAmntid_exRegSig,
      shftDir => shiftDirectionid_exRegSig,
      shftEn => shiftEnableid_exRegSig,
      dataIn => aluOut,
      dataOut => shiftOutputSig);
	
	InstructMem : InstructionMem port map(
		we => '0',
		clk => clk,
		addr => instructMemAddrSig,
		din => "0000000000000000",
		dout => instructMemOutSig);
			
	ALU : ALU_Behavioural port map(
		sel => ALUCtrlid_exRegSig,
		x => aluAMuxOutSig,
		y => aluMuxOut,
		c_in => carryInSig,
		c_out => carryInSig,
		overflow => overFlowSig,
		z => aluOut);
				
	registers : regFile port map(
		ReadAddr1 => rsSig,
		ReadAddr2 => rtSig,
		WriteAddr => regWriteAddrmem_wbRegSig,
		DataOut1=> readData1Sig,
		DataOut2 => readData2Sig,
		DataToLed => dataToLedOut,
		DataIn => regDataInSig,
		Wen => regWriteSig,
		clk => clk);
		
	dataMemory : DataMem port map(
		we => dataMemWriteex_memRegSig,
		clk => clk,
		addr => dataMemAddrSig,
		din => readData2ex_memRegSig,
		dout => dataMemOutSig);
		
	datatMemMux : MUX_2to1_16bit port map(
		 i0 => shiftOutputmem_wbRegSig,
       i1 => dataMemOutmem_wbRegSig,
       c => regDataInSig,
       sel => memToRegmem_wbRegSig);
		 
	aluInputMux : MUX_2to1_16bit port map(
		 i0 => aluBMuxOutSig,
       i1 => instructExtid_exRegSig,
       c => aluMuxOut,
       sel => aluSrcid_exRegSig);
		 
	writeRegMux : MUX_2to1_3bit port map(
		 i0 => rtid_exRegSig,
       i1 => rdid_exRegSig,
       c => regWriteAddrSig,
       sel => regDestid_exRegSig);
	
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
	
	instructReg : IRreg port map(
		d => instructMemOutSig,
		load =>'1',
		clr => '0',
		clk => clk,
		stall => stallSig,
		q =>instructMemOutIRRegSig);
		
	id_exRegister :id_exReg port map(
		load =>'1',
		clr=>'0',
		clk=>clk,
		RD1In=>readData1Sig,
		RD1Out=>readData1id_exRegSig,
		RD2In=>readData2Sig,
		RD2Out=>readData2id_exRegSig,
		rsIn=>rsSig,
		rsOut=>rsid_exRegSig,
		rtin=>rtSig,
		rtOut=>rtid_exRegSig,
		rdIn=>rdSig,
		rdOut=>rdid_exRegSig,
		shiftAmountIn=>shiftAmntSig,
		shiftAmountOut=>shiftAmntid_exRegSig,
		instructExtIn=>instructExtSig,
		instructExtOut=>instructExtid_exRegSig,
		ALUCtrlIn=>ALUCtrlSig,
		ALUCtrlOut=>ALUCtrlid_exRegSig,
		shiftDirectionIn=>shiftDirectionSig,
		shiftDirectionOut=>shiftDirectionid_exRegSig,
		shiftEnableIn=>shiftEnableSig,
		shiftEnableOut=>shiftEnableid_exRegSig,
		regWriteIn=>regWriteSig,
		regWriteOut=>regWriteid_exRegSig,
		dataMemWriteIn=>dataMemWriteSig,
		dataMemWriteOut=>dataMemWriteid_exRegSig,
		memToRegIn=>memToRegSig,
		memToRegOut=>memToRegid_exRegSig,
		regDestIn=>regDestSig,
		regDestOut=>regDestid_exRegSig,
		aluSrcIn=>aluSrcSig,
		aluSrcOut=>aluSrcid_exRegSig,
		instruction_copy_in => instructMemOutIRRegSig,
		instruction_copy_out =>  instructMemOutid_exRegSig);
		
	ex_memRegister : ex_memReg port map(	
		load=>'1',
		clr=>'0',
		clk=>clk,
		RD2In=>readData2id_exRegSig,
		RD2Out=>readData2ex_memRegSig,
		regWriteIn=>regWriteid_exRegSig,
		regWriteOut=>regWriteex_memRegSig,
		dataMemWriteIn=>dataMemWriteid_exRegSig,
		dataMemWriteOut=>dataMemWriteex_memRegSig,
		memToRegIn=>memToRegid_exRegSig,
		memToRegOut=>memToRegex_memRegSig,
		regWriteAddrIn=>regWriteAddrSig,
		regWriteAddrOut=>regWriteAddrex_memRegSig,
		shiftOutputIn=>shiftOutputSig,
		shiftOutputOut=>shiftOutputex_memRegSig);

	mem_wbRegister : mem_wbReg port map(
		load=>'1',
		clr=>'0',
		clk=>clk,
		regWriteAddrIn=>regWriteAddrex_memRegSig,
		regWriteAddrOut=>regWriteAddrmem_wbRegSig,
		
		memToRegIn=>memToRegex_memRegSig,
		memToRegOut=>memToRegmem_wbRegSig,
		
		regWriteIn=>regWriteex_memRegSig,
		regWriteOut=>regWritemem_wbRegSig,
		
		dataMemOutIn=>dataMemOutSig,
		dataMemOutOut=>dataMemOutmem_wbRegSig,
		
		shiftOutputIn=>shiftOutputex_memRegSig,
		shiftOutputOut=>shiftOutputmem_wbRegSig);
	
	hazCtrl : hazardDetect port map(
		if_idrs=>rsSig,
		if_idrt=>rtSig,
		id_exrt=>rtid_exRegSig,
		id_exMemRead=>memToRegid_exRegSig,
		stall=>stallSig,
		clk=>clk);
	
	aluAMux : aluAInputMux_4to1_16bit port map(
		i0 =>readData1id_exRegSig,
		i1 =>regDataInSig,
		i2 =>shiftOutputex_memRegSig,
		c =>aluAMuxOutSig,
		sel =>forwardASig);
	
	aluBMux : aluBInputMux_4to1_16bit port map(
		i0 =>readData2id_exRegSig,
		i1 =>regDataInSig,
		i2 =>shiftOutputex_memRegSig,
		c =>aluBMuxOutSig,
		sel =>forwardBSig);	

	frwdUnit : forwardingUnit port map(
		if_idrs =>rsSig,
		if_idrt =>rtSig,
		id_exrs =>rsid_exRegSig,
		id_exrt =>rtid_exRegSig,
		ex_memrd =>regWriteAddrex_memRegSig,
		mem_wbrd =>regWriteAddrmem_wbRegSig,
		ex_memRegWrite=>regWriteex_memRegSig,
		mem_wbRegWrite=>regWritemem_wbRegSig,
		forwardA=>forwardASig,
		forwardB=>forwardBSig);


end Behavioral;

