----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:50:53 01/23/2017 
-- Design Name: 
-- Module Name:    ProcessorToLevel - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ProcessorToLevel is
		Port(mclk: in std_logic:= '0';
		button : in  STD_LOGIC_VECTOR (4 downto 0);
		segment : out  STD_LOGIC_VECTOR (3 downto 0);
		leds: out std_logic_vector(7 downto 0);
		inputSwitches : in  STD_LOGIC_VECTOR (4 downto 0));
end ProcessorToLevel;

architecture Behavioral of ProcessorToLevel is

component PCreg IS PORT(
    d   : IN std_logic_vector(15 downto 0):="0000000000000000";
    load  : IN STD_LOGIC; -- load/enable.
    clr : IN STD_LOGIC; -- async. clear.
    clk : IN STD_LOGIC; -- clock.
	 incr : IN STD_LOGIC;
	 currentPC : IN STD_lOGIC_VECTOR(15 downto 0):="0000000000000000";
    q   : OUT std_logic_vector(15 downto 0)); -- output.
end component;

component Yreg IS PORT(
    d   : IN std_logic_vector(15 downto 0);
    load  : IN STD_LOGIC; -- load/enable.
    clr : IN STD_LOGIC; -- async. clear.
    clk : IN STD_LOGIC; -- clock.
    q   : OUT std_logic_vector(15 downto 0):="0000000000000000" -- output.
);
end component;

component incrementor is
    Port ( PCin : in  STD_LOGIC_VECTOR (15 downto 0);
           PCplusOne : out  STD_LOGIC_VECTOR (15 downto 0);
           incr : in  STD_LOGIC);
end component;

component SevenSegController is
    Port ( input : in  STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";    
			  mclk: in std_logic;
			  segment : out  STD_LOGIC_VECTOR (3 downto 0);
			  leds: out std_logic_vector(7 downto 0));
end component;

component ALU_Behavioural is
    generic (
			  Dwidth : integer := 16);
    Port ( sel : in  STD_LOGIC_VECTOR (2 downto 0);
           x : in  STD_LOGIC_VECTOR (Dwidth-1 downto 0);
           y : in  STD_LOGIC_VECTOR (Dwidth-1 downto 0);
           c_in : in  STD_LOGIC := '0';
           c_out : out  STD_LOGIC;
           overflow : out  STD_LOGIC;
           z : out  STD_LOGIC_VECTOR (Dwidth-1 downto 0));
           --lt : out  STD_LOGIC);
end component;

component lab1mem is
generic (
    Dwidth : integer := 16; -- Each location is 16 bits
    Awidth : integer := 8); -- 8 Address lines (i.e., 64 locations)
port (
    we,clk: in std_logic;
    addr: in std_logic_vector(Awidth-1 downto 0):= "00000000";
    din: in std_logic_vector(Dwidth-1 downto 0);
    dout: out std_logic_vector(Dwidth-1 downto 0)
);
end component;

signal ALUCtrlSig : STD_LOGIC_VECTOR (2 downto 0);
signal aluOut : STD_LOGIC_VECTOR (15 downto 0);
signal PCoutSig : std_logic_vector(15 downto 0);
signal PCinData : STD_LOGIC_VECTOR (15 downto 0);
signal clkdiv : std_logic_vector(0 downto 0);		-- counter for clock divider
signal clk : std_logic;
signal pcdataout : STD_LOGIC_VECTOR (15 downto 0);
signal zeroSig : std_logic;
signal PCinSig : std_logic;
signal itermidateMDRout : STD_LOGIC_VECTOR (15 downto 0);
signal regtoLeds : STD_LOGIC_VECTOR (15 downto 0);
signal yInput : STD_LOGIC_VECTOR (15 downto 0);
signal memDataSig : STD_LOGIC_VECTOR (15 downto 0);
signal writeSigSig : std_logic;
signal carryOut : std_logic;
signal overflowSig : std_logic;
signal memSig : STD_LOGIC_VECTOR (7 downto 0);


begin

	process (mclk)						-- create system clock divder
	begin
		if mclk = '1' and mclk'Event then	
			clkdiv <= clkdiv +1;
		end if;	    
	end process;
	
	clk <= clkdiv(0);
	ALUCtrlSig <= memDataSig(15 downto 13);
	
	yInput(15 downto 13)<= "000";
	yInput(12 downto 0) <= memDataSig(12 downto 0);
	memSig <= PCoutSig(7 downto 0);
	PCRegister : PCreg port map(d=>PCinData, load=>PCinSig , clr=>'0' , clk=>clk , incr=>inputSwitches(0) , q=>PCoutSig , currentPC=>PCoutSig);
	ZRegister : Yreg port map(d=>aluOut , load=>inputSwitches(1) , clr=>'0' , clk=>clk , q=>regtoLeds);
	ALU : ALU_Behavioural port map(sel=>ALUCtrlSig,x=>regtoLeds,y=>yInput,z=>aluOut,C_in=>'0',C_out=> carryOut,overflow=>overflowSig);
	Mem : lab1mem port map(we=>writeSigSig , clk=>clk , addr=>memSig , din=>itermidateMDRout , dout=>memDataSig);--memAddrSig, MDRdataOutSig
	ledoutput : SevenSegController port map(mclk=>mclk,segment=>segment,leds=>leds,input=>regtoLeds);
	
end Behavioral;

