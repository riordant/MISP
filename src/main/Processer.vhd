ENTITY Processer IS
	PORT (
		reset : IN STD_LOGIC;
		Clk : IN STD_LOGIC;
		Datapath_out : OUT STD_LOGIC_VECTOR(15DOWNTO 0);
		PCouttest : OUT STD_LOGIC_VECTOR(15DOWNTO 0);
		CARouttest : OUT STD_LOGIC_VECTOR(7DOWNTO 0);
		TBouttest : OUT STD_LOGIC_VECTOR(15DOWNTO 0)
	);
END Processer;
ARCHITECTURE Behavioral OF Processer IS
	COMPONENT Program_counter
		PORT (
			in0 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			reset : IN std_logic;
			PI : IN STD_LOGIC;
			PL : IN STD_LOGIC;
			Clk : IN STD_LOGIC;
			out0 : INOUT STD_LOGIC_VECTOR(15 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT extend
		PORT (
			in0 : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
			out0 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT NOT_cond
		PORT (
			in0 : IN STD_LOGIC;
			in1 : IN STD_LOGIC;
			out0 : OUT STD_LOGIC;
			out1 : OUT STD_LOGIC
		);
	END COMPONENT;
	COMPONENT MUX_S
		PORT (
			in0 : IN STD_LOGIC;
			in1 : IN STD_LOGIC;
			in2 : IN STD_LOGIC;
			in3 : IN STD_LOGIC;
			in4 : IN STD_LOGIC;
			in5 : IN STD_LOGIC;
			in6 : IN STD_LOGIC;
			in7 : IN STD_LOGIC;
			sel : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
			out0 : OUT STD_LOGIC
		);
	END COMPONENT;
	COMPONENT instruction_reg
		PORT (
			in0 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			sel : IN STD_LOGIC;
			opcode : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			DR : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
			SA : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
			Clk : IN STD_LOGIC;
			SB : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT MUX_C
		PORT (
			in0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			in1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			sel : IN STD_LOGIC;
			out0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT control_access_reg
		PORT (
			in0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			Clk : IN STD_LOGIC;
			reset : IN STD_LOGIC;
			out0 : INOUT STD_LOGIC_VECTOR(7DOWNTO 0);
			sel : IN STD_LOGIC
		);
	END COMPONENT;
	COMPONENT control_memory
		PORT (
			MW : OUT std_logic;
			MM : OUT std_logic;
			RW : OUT std_logic;
			MD : OUT std_logic;
			FS : OUT std_logic_vector(4 DOWNTO 0);
			MB : OUT std_logic;
			TB : OUT std_logic;
			TA : OUT std_logic;
			TD : OUT std_logic;
			PL : OUT std_logic;
			PI : OUT std_logic;
			IL : OUT std_logic;
			MC : OUT std_logic;
			MS : OUT std_logic_vector(2 DOWNTO 0);
			NA : OUT std_logic_vector(7 DOWNTO 0);
			IN_CAR : IN std_logic_vector(7 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT zeroFill
		PORT (
			in0 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
			out0 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT MUX_M
		PORT (
			in0 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			in1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			sel : IN STD_LOGIC;
			out0 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT Memory
		PORT (
			address : IN unsigned(15 DOWNTO 0);
			write_data : IN std_logic_vector(15 DOWNTO 0);
			MW : IN std_logic;
			read_data : OUT std_logic_vector(15 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT register_file
		PORT (
			s0_Amux9to16 : IN STD_LOGIC_VECTOR(2 DOWNTO0);
			s0_Bmux9to16 : IN STD_LOGIC_VECTOR(2DOWNTO 0);
			s0_dec3to9 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
			TD : IN STD_LOGIC;
			TA : IN STD_LOGIC;
			TB : IN STD_LOGIC;
			loadEnable : IN STD_LOGIC;
			DData : IN STD_LOGIC_VECTOR(15 DOWNTO0);
			Clk : IN STD_LOGIC;
			Adata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			Bdata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT FunctionUnit_16bit
		PORT (
			A : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			B : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			FSselect : IN STD_LOGIC_VECTOR(4 DOWNTO0);
			C : OUT STD_LOGIC;
			N : OUT STD_LOGIC;
			V : OUT STD_LOGIC;
			Z : OUT STD_LOGIC;
			F : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT Datapath_Bmux2to1
		PORT (
			in0 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			in1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			S : IN STD_LOGIC;
			out0 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT Datapath_Dmux2to1
		PORT (
			in0 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			in1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			S : IN STD_LOGIC;
			out0 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
		);
	END COMPONENT;
	--signals
	SIGNAL MUXS_sig, not_c_sig, not_z_sig, Cout_sig, 
	Nout_sig, Vout_sig, Zout_sig : STD_LOGIC;
	SIGNAL DR_sig, SA_sig, SB_sig : STD_LOGIC_VECTOR(2
	DOWNTO 0);
	SIGNAL opcode_sig : STD_LOGIC_VECTOR(6 DOWNTO 0);
	SIGNAL MUXC_sig, CAR_sig : STD_LOGIC_VECTOR(7 DOWNTO
	0);
	SIGNAL PCout_sig, MemMout_sig, extend_sig, 
	zeroFill_sig, BusA_sig, BusB_sig, 
	muxB_sig, muxM_sig, FU_sig, 
	BusD_sig : STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL CM_sig : STD_LOGIC_VECTOR(27 DOWNTO 0);
BEGIN
	--port maps
	-- PROGRAM COUNTER
	PC : program_counter
	PORT MAP(
		in0 => extend_sig, 
		reset => reset, 
		PI => CM_sig(14), 
		PL => CM_sig(13), 
		Clk => Clk, 
		out0 => PCout_sig
	);

	--EXTEND
	PCExtend : extend
	PORT MAP(
		in0(5 DOWNTO 3) => DR_sig, 
		in0(2 DOWNTO 0) => SB_sig, 
		out0 => extend_sig
	);

	--INVERTER
	inverter : NOT_cond
	PORT MAP(
		in0 => Cout_sig, 
		in1 => Zout_sig, 
		out0 => not_c_sig, 
		out1 => not_z_sig
	);

	--MUX S
	MUXS : MUX_S
	PORT MAP(
		in0 => '0', 
		in1 => '1', 
		in2 => Cout_sig, 
		in3 => Vout_sig, 
		in4 => Zout_sig, 
		in5 => Nout_sig, 
		in6 => not_c_sig, 
		in7 => not_z_sig, 
		sel(0) => CM_sig(17), 
		sel(1) => CM_sig(18), 
		sel(2) => CM_sig(19), 
		out0 => MUXS_sig
	);

	--INSTRUCTION REGISTER
	IR : instruction_reg
	PORT MAP(
		in0 => MemMout_sig, 
		sel => CM_sig(15), 
		opcode => opcode_sig, 
		DR => DR_sig, 
		SA => SA_sig, 
		SB => SB_sig, 
		Clk => Clk
	);
	--MUX C
	MUXC : MUX_C
	PORT MAP(
		in0(0) => CM_sig(20), 
		in0(1) => CM_sig(21), 
		in0(2) => CM_sig(22), 
		in0(3) => CM_sig(23), 
		in0(4) => CM_sig(24), 
		in0(5) => CM_sig(25), 
		in0(6) => CM_sig(26), 
		in0(7) => CM_sig(27), 
		in1(6 DOWNTO 0) => opcode_sig, 
		in1(7) => '0', 
		sel => CM_sig(16), 
		out0 => MUXC_sig
	);
	--CONTROL ACCESS REGISTER
	CAR : control_access_reg
	PORT MAP(
		in0 => MUXC_sig, 
		Clk => Clk, 
		reset => reset, 
		sel => MUXS_sig, 
		out0 => CAR_sig
	);

	--CONTROL MEMORY
	CM : control_memory
	PORT MAP(
		MW => CM_sig(0), 
		MM => CM_sig(1), 
		RW => CM_sig(2), 
		MD => CM_sig(3), 
		FS(0) => CM_sig(4), 
		FS(1) => CM_sig(5), 
		FS(2) => CM_sig(6), 
		FS(3) => CM_sig(7), 
		FS(4) => CM_sig(8), 
		MB => CM_sig(9), 
		TB => CM_sig(10), 
		TA => CM_sig(11), 
		TD => CM_sig(12), 
		PL => CM_sig(13), 
		PI => CM_sig(14), 
		IL => CM_sig(15), 
		MC => CM_sig(16), 
		MS(0) => CM_sig(17), 
		MS(1) => CM_sig(18), 
		MS(2) => CM_sig(19), 
		NA(0) => CM_sig(20), 
		NA(1) => CM_sig(21), 
		NA(2) => CM_sig(22), 
		NA(3) => CM_sig(23), 
		NA(4) => CM_sig(24), 
		NA(5) => CM_sig(25), 
		NA(6) => CM_sig(26), 
		NA(7) => CM_sig(27), 
		IN_CAR => CAR_sig
	);
	--REGISTER FILE
	registerfile : register_file
	PORT MAP(
		s0_dec3to9 => DR_sig, 
		S0_Amux9to16 => SA_sig, 
		S0_Bmux9to16 => SB_sig, 
		TD => CM_sig(12), 
		TA => CM_sig(11), 
		TB => CM_sig(10), 
		loadEnable => CM_sig(2), 
		Clk => Clk, 
		DData => BusD_sig, 
		AData => BusA_sig, 
		BData => BusB_sig
	);
	--ZERO FILL
	fillWithZero : zeroFill
	PORT MAP(
		in0 => SB_sig, 
		out0 => zeroFill_sig
	);
	--B MUX
	MUXB : Datapath_Bmux2to1
	PORT MAP(
		in0 => BusB_sig, 
		in1 => zeroFill_sig, 
		S => CM_sig(9), 
		out0 => muxB_sig
	);
	--M MUX
	MUXM : MUX_M
	PORT MAP(
		in0 => busA_sig, 
		in1 => PCout_sig, 
		sel => CM_sig(1), 
		out0 => muxM_sig
	);
	--FUNCTIONAL UNIT
	FunctionUnit : FunctionUnit_16bit
	PORT MAP(
		A => BusA_sig, 
		B => muxB_sig, 
		FSselect(4) => CM_sig(8), 
		FSselect(3) => CM_sig(7), 
		FSselect(2) => CM_sig(6), 
		FSselect(1) => CM_sig(5), 
		FSselect(0) => CM_sig(4), 
		C => Cout_sig, 
		N => Nout_sig, 
		V => Vout_sig, 
		Z => Zout_sig, 
		F => FU_sig
	);
	--MEMORY M
	MemoryM : Memory
	PORT MAP(
		address => unsigned(muxM_sig), 
		write_data => muxB_sig, 
		MW => CM_sig(0), 
		read_data => MemMout_sig
	);
	--MUX D
	MUXD : Datapath_Dmux2to1
	PORT MAP(
		in0 => FU_sig, 
		in1 => MemMout_sig, 
		S => CM_sig(3), 
		out0 => BusD_sig
	);

	CARouttest <= CAR_sig;
	Datapath_out <= BusD_sig;
	PCOuttest <= PCout_sig;
	TBouttest <= memMout_sig;
END Behavioral;