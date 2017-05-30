ENTITY FunctionUnit_16bit IS
	PORT (
		A : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		B : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		FSselect : IN STD_LOGIC_VECTOR(4 DOWNTO0);
		C : OUT STD_LOGIC;
		V : OUT STD_LOGIC;
		N : OUT STD_LOGIC;
		Z : OUT STD_LOGIC;
		F : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END FunctionUnit_16bit;
ARCHITECTURE Behavioral OF FunctionUnit_16bit IS
	COMPONENT ALU_16bit
		PORT (
			A : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			B : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			Cin : IN STD_LOGIC;
			S : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
			C : OUT STD_LOGIC;
			V : OUT STD_LOGIC;
			N : OUT STD_LOGIC;
			Z : OUT STD_LOGIC;
			G : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT Shifter_16bit
		PORT (
			B : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			S : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			H : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
		);
	END COMPONENT;
	COMPONENT FU_mux2to1
		PORT (
			in0 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			in1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			S : IN STD_LOGIC;
			out0 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
		);
	END COMPONENT;
	--signals
	SIGNAL Gout_sig, Hout_sig, Fout_sig : 
	STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL Cout_sig, Vout_sig, Nout_sig, Zout_sig : 
	STD_LOGIC;
BEGIN
	ALU : ALU_16bit
	PORT MAP(
		A => A, 
		B => B, 
		S(2) => FSselect(1), 
		S(1) => FSselect(2), 
		S(0) => FSselect(3), 
		Cin => FSselect(4), 
		C => Cout_sig, 
		V => Vout_sig, 
		N => Nout_sig, 
		Z => Zout_sig, 
		G => Gout_sig
	);

	Shifter : Shifter_16bit
	PORT MAP(
		B => B, 
		S(0) => FSselect(1), 
		S(1) => FSselect(2), 
		H => Hout_sig
	);

	Mux : FU_mux2to1
	PORT MAP(
		in0 => Gout_sig, 
		in1 => Hout_sig, 
		S => FSselect(0), 
		out0 => Fout_sig
	);
	C <= Cout_sig;
	V <= Vout_sig;
	N <= Nout_sig;
	Z <= Zout_sig;
	F <= Fout_sig;
END Behavioral;