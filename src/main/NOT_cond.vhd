ENTITY NOT_cond IS
	PORT (
		in0 : IN STD_LOGIC;
		in1 : IN STD_LOGIC;
		out0 : OUT STD_LOGIC;
		out1 : OUT STD_LOGIC
	);
END NOT_cond;
ARCHITECTURE Behavioral OF NOT_cond IS
BEGIN
	out0 <= NOT(in0);
	out1 <= NOT(in1);
END Behavioral;