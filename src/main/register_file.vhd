ENTITY Register_file IS
	PORT (
		s0_Amux9to16 : IN STD_LOGIC_VECTOR(2DOWNTO 0);
		s0_Bmux9to16 : IN STD_LOGIC_VECTOR(2DOWNTO 0);
		s0_dec3to9 : IN STD_LOGIC_VECTOR(2 DOWNTO0);
		TD : IN STD_LOGIC;
		TA : IN STD_LOGIC;
		TB : IN STD_LOGIC;
		loadEnable : IN STD_LOGIC;
		DData : IN STD_LOGIC_VECTOR(15DOWNTO 0);
		Clk : IN STD_LOGIC;
		Adata : OUT STD_LOGIC_VECTOR(15 DOWNTO0);
		Bdata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END Register_file;
ARCHITECTURE Behavioral OF Register_file IS
	--components
	--16 bit register for register file
	COMPONENT reg
		PORT (
			load : IN STD_LOGIC;
			Clk : IN STD_LOGIC;
			in0 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			out0 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
		);
	END COMPONENT;
	--AND gate to control decoder to register load
	BIT
	COMPONENT load_reg
		PORT (
			in0 : IN STD_LOGIC;
			in1 : IN STD_LOGIC;
			out0 : OUT STD_LOGIC
		);
	END COMPONENT;
	--A Data 16 bit 9 to 1 multiplexor
	COMPONENT Amux_9to16bit
		PORT (
			in0 : IN STD_LOGIC_VECTOR(15 DOWNTO0);
			in1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			in2 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			in3 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			in4 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			in5 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			in6 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			in7 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			in8 : IN STD_LOGIC_VECTOR(15 DOWNTO0);
			TA : IN STD_LOGIC;
			s0 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
			out0 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
		);
	END COMPONENT;
	--B Data 16 bit 9 to 1 multiplexor
	COMPONENT Bmux_9to16bit
		PORT (
			in0 : IN STD_LOGIC_VECTOR(15 DOWNTO0);
			in1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			in2 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			in3 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			in4 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			in5 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			in6 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			in7 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			in8 : IN STD_LOGIC_VECTOR(15 DOWNTO0);
			TB : IN STD_LOGIC;
			s0 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
			out0 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
		);
	END COMPONENT;
	--1 bit 3 to 9 decoder
	COMPONENT Decoder_3to9
		PORT (
			in0 : IN STD_LOGIC_VECTOR(2 DOWNTO0);
			TD : IN STD_LOGIC;
			out0 : OUT STD_LOGIC_VECTOR(8 DOWNTO 0)
		);
	END COMPONENT;
	-- signals. and to reg, dec to and, reg to mux
	SIGNAL load_reg0, load_reg1, load_reg2, load_reg3, 
	load_reg4, load_reg5, load_reg6, load_reg7, 
	load_reg8 : std_logic;
	SIGNAL selDec_reg0, selDec_reg1, selDec_reg2, 
	selDec_reg3, 
	selDec_reg4, selDec_reg5, selDec_reg6, 
	selDec_reg7, selDec_reg8 : std_logic;
	SIGNAL reg0_sig, reg1_sig, reg2_sig, reg3_sig, 
	reg4_sig, 
	reg5_sig, reg6_sig, reg7_sig, reg8_sig, 
	mux_2to16bit_sig, 
	Amux_9to16bit_sig, Bmux_9to16bit_sig : 
	std_logic_vector(15 DOWNTO 0);
BEGIN
	gate00 : load_reg
	PORT MAP(
		in0 => loadEnable, 
		in1 => selDec_reg0, 
		out0 => load_reg0
	);
	gate01 : load_reg
	PORT MAP(
		in0 => loadEnable, 
		in1 => selDec_reg1, 
		out0 => load_reg1
	);
	gate02 : load_reg
	PORT MAP(
		in0 => loadEnable, 
		in1 => selDec_reg2, 
		out0 => load_reg2
	);
	gate03 : load_reg
	PORT MAP(
		in0 => loadEnable, 
		in1 => selDec_reg3, 
		out0 => load_reg3
	);
	gate04 : load_reg
	PORT MAP(
		in0 => loadEnable, 
		in1 => selDec_reg4, 
		out0 => load_reg4
	);
	gate05 : load_reg
	PORT MAP(
		in0 => loadEnable, 
		in1 => selDec_reg5, 
		out0 => load_reg5
	);
	gate06 : load_reg
	PORT MAP(
		in0 => loadEnable, 
		in1 => selDec_reg6, 
		out0 => load_reg6
	);
	gate07 : load_reg
	PORT MAP(
		in0 => loadEnable, 
		in1 => selDec_reg7, 
		out0 => load_reg7
	);
	gate08 : load_reg
	PORT MAP(
		in0 => loadEnable, 
		in1 => selDec_reg8, 
		out0 => load_reg8
	);
	reg00 : reg
	PORT MAP(
		in0 => DData, 
		load => load_reg0, 
		Clk => Clk, 
		out0 => reg0_sig
	);
	reg01 : reg
	PORT MAP(
		in0 => DData, 
		load => load_reg1, 
		Clk => Clk, 
		out0 => reg1_sig
	);
	reg02 : reg
	PORT MAP(
		in0 => DData, 
		load => load_reg2, 
		Clk => Clk, 
		out0 => reg2_sig
	);
	reg03 : reg
	PORT MAP(
		in0 => DData, 
		load => load_reg3, 
		Clk => Clk, 
		out0 => reg3_sig
	);
	reg04 : reg
	PORT MAP(
		in0 => DData, 
		load => load_reg4, 
		Clk => Clk, 
		out0 => reg4_sig
	);
	reg05 : reg
	PORT MAP(
		in0 => DData, 
		load => load_reg5, 
		Clk => Clk, 
		out0 => reg5_sig
	);
	reg06 : reg
	PORT MAP(
		in0 => DData, 
		load => load_reg6, 
		Clk => Clk, 
		out0 => reg6_sig
	);
	reg07 : reg
	PORT MAP(
		in0 => DData, 
		load => load_reg7, 
		Clk => Clk, 
		out0 => reg7_sig
	);
	reg08 : reg
	PORT MAP(
		in0 => DData, 
		load => load_reg8, 
		Clk => Clk, 
		out0 => reg8_sig
	);
	--decoder port map
	decoder : Decoder_3to9
	PORT MAP(
		in0 => s0_dec3to9, 
		out0(0) => selDec_reg0, 
		out0(1) => selDec_reg1, 
		out0(2) => selDec_reg2, 
		out0(3) => selDec_reg3, 
		out0(4) => selDec_reg4, 
		out0(5) => selDec_reg5, 
		out0(6) => selDec_reg6, 
		out0(7) => selDec_reg7, 
		out0(8) => selDec_reg8, 
		TD => TD
	);
	--A data mux 8 to 16 bit port map
	Amux9to16 : Amux_9to16bit
	PORT MAP(
		s0 => s0_Amux9to16, 
		in0 => reg0_sig, 
		in1 => reg1_sig, 
		in2 => reg2_sig, 
		in3 => reg3_sig, 
		in4 => reg4_sig, 
		in5 => reg5_sig, 
		in6 => reg6_sig, 
		in7 => reg7_sig, 
		in8 => reg7_sig, 
		out0 => Amux_9to16bit_sig, 
		TA => TA
	);
	--B data mux 8 to 16 bit port map
	Bmux9to16 : Bmux_9to16bit
	PORT MAP(
		s0 => s0_Bmux9to16, 
		in0 => reg0_sig, 
		in1 => reg1_sig, 
		in2 => reg2_sig, 
		in3 => reg3_sig, 
		in4 => reg4_sig, 
		in5 => reg5_sig, 
		in6 => reg6_sig, 
		in7 => reg7_sig, 
		in8 => reg8_sig, 
		out0 => Bmux_9to16bit_sig, 
		TB => TB
	);
	Adata <= Amux_9to16bit_sig;
	Bdata <= Bmux_9to16bit_sig;
END Behavioral;