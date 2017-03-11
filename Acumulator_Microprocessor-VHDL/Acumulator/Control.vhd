----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:36:09 03/30/2015 
-- Design Name: 
-- Module Name:    Control - Behavioral 
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

entity Control is
port(
clk, reset, WMFC	: in std_logic;
Bus_in 				: in std_logic_vector(15 downto 0);
conSigals 			: out STD_LOGIC_VECTOR(25 downto 0);
Jump_out				: out	STD_LOGIC_VECTOR(11 downto 0);
BCLS_out				: out	STD_LOGIC_VECTOR(5 downto 0);
Reg_chooser_info  : out STD_LOGIC_VECTOR(8 downto 0));
end Control;


architecture Behavioral of Control is

	component uCode is
   Port (
	WMFC 				 : in std_logic;
	Control_input	 : in std_logic_vector(5 downto 0);
	op_input			 : in std_logic_vector(3 downto 0);
	Loop_signal		 : out STD_LOGIC_VECTOR(9 downto 0);
	Control_signals : out std_logic_vector(25 downto 0));  
	end component;
	
	component MUX is
	Port ( 
	sel 			: in  STD_LOGIC_VECTOR (1 downto 0);
	Decode 		: in  STD_LOGIC_VECTOR (9 downto 0);
	Loop_signal : in STD_LOGIC_VECTOR (9 downto 0);
	Increment 	: in  STD_LOGIC_VECTOR (9 downto 0);
	Mux_out 		: out  STD_LOGIC_VECTOR (9 downto 0));
	end component;

	component incrementor is
	Port ( 
	uPC_out 			: in STD_LOGIC_VECTOR(9 downto 0);
	increment_out 	: out STD_LOGIC_VECTOR(9 downto 0));
	end component;

	component uPC is 
	port ( 
	clk 		: in STD_LOGIC;
	reset		: in STD_LOGIC;
	uPC_in  	: in STD_LOGIC_VECTOR(9 downto 0);
	uPC_out 	: out STD_LOGIC_VECTOR(9 downto 0));
	end component;
	
	component Decoder is
	Port ( 
	Decode_in 		: in  STD_LOGIC_VECTOR(3 downto 0);
	Increment_sig 	: in STD_LOGIC_VECTOR(5 downto 0);
	Decode_out		: out  STD_LOGIC_VECTOR(9 downto 0));
	end component;
	
	component InstrReg is
	Port ( 
	IR_in		: in	STD_LOGIC_VECTOR(15 downto 0);
	uIR_en 	: in	STD_LOGIC;
	clk		: in 	STD_LOGIC;
	IR_out	: out	STD_LOGIC_VECTOR(3 downto 0);
	IRj_out	: out	STD_LOGIC_VECTOR(11 downto 0);
	IRb_out	: out	STD_LOGIC_VECTOR(5 downto 0);
	Ir_info  : out STD_LOGIC_VECTOR(8 downto 0));
	end component;

	signal UPC2Ucode,increment_signal, decode_signal,Loop_sig,MuxO : std_logic_vector(9 downto 0);
	signal All_conSig : std_logic_vector(25 downto 0);
	signal Opcode : std_logic_vector(3 downto 0);
begin
	
	Ir                   : InstrReg port map(Bus_in, All_conSig(2), clk,Opcode, Jump_out, BCLS_out, Reg_chooser_info);
	Control_Decoder 		: Decoder port map(Opcode, increment_signal(5 downto 0), decode_signal);
	ControlMUX 				: MUX port map(All_conSig(1 downto 0), decode_signal,Loop_sig, increment_signal, MuxO);
	Control_Incrementor	: incrementor port map(UPC2Ucode, increment_signal);
	ControlPC 				: uPC port map(clk, reset, MuxO, UPC2Ucode);
	The_uCode       		: uCode port map(WMFC,UPC2Ucode(5 downto 0), UPC2Ucode(9 downto 6), Loop_sig, All_conSig);
	
	process(All_conSig,clk)
	begin
	
	if rising_edge(clk) then
	conSigals(25)<= All_conSig(25);
	conSigals(24)<= All_conSig(24);
	conSigals(23)<= All_conSig(23);
	conSigals(22)<= All_conSig(22);
	conSigals(21)<= All_conSig(21);
	conSigals(20)<= All_conSig(20);
	conSigals(19)<= All_conSig(19);
	conSigals(18)<= All_conSig(18);
	conSigals(17)<= All_conSig(17);
	conSigals(16)<= All_conSig(16);
	conSigals(15)<= All_conSig(15);
	conSigals(14)<= All_conSig(14);
	conSigals(13)<= All_conSig(13);
	conSigals(12)<= All_conSig(12);
	conSigals(11)<= All_conSig(11);
	conSigals(10)<= All_conSig(10);
	conSigals(9)<= All_conSig(9);
	conSigals(8 downto 5)<= All_conSig(8 downto 5);
	conSigals(4)<= All_conSig(4);
	conSigals(3)<= All_conSig(3);
	conSigals(1 downto 0)<=All_conSig(1 downto 0);
	end if;
	end process;
	
--		if rising_edge(clk) then
--	PC_in <= All_conSig(25);
--	PC_out <= All_conSig(24);
--	MAR_in <= All_conSig(23);
--	MDR_in <= All_conSig(22);
--	MDR_out <= All_conSig(21);
--	Write_enable <= All_conSig(20);
--	Control_memory <= All_conSig(19);
--	Cntl_Reg1_in <= All_conSig(18);
--	Cntl_Reg1_out <= All_conSig(17);
--	Cntl_Reg2_out <= All_conSig(16);
--	Cntl_Reg3_out <= All_conSig(15);
--	Control_Y_in<= All_conSig(14);
--	Z_in<= All_conSig(13);
--	Z_out<= All_conSig(12);
--	ALU_Flag_in<= All_conSig(11);
--	ALU_Flag_out<= All_conSig(10);
--	Control_Mux_Select<= All_conSig(9);
--	Control_ALU <= All_conSig(8 downto 5);
--	Contol_BCLS<= All_conSig(4);
--	Control_Jump<= All_conSig(3);
--	uIR_IR_en<=All_conSig(2);
--	uIR_mux_en<=All_conSig(1 downto 0);
--	end if;
--	end process;

end Behavioral;

