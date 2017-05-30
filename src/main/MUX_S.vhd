ENTITY MUX_S IS
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
END MUX_S;
ARCHITECTURE Behavioral OF MUX_S IS
BEGIN
	out0 <= in0 WHEN sel = "000" ELSE
	        in1 WHEN sel = "001" ELSE
	        in2 WHEN sel = "010" ELSE
	        in3 WHEN sel = "011" ELSE
	        in4 WHEN sel = "100" ELSE
	        in5 WHEN sel = "101" ELSE
	        in6 WHEN sel = "110" ELSE
	        in7 WHEN sel = "111" ELSE
	        'U' AFTER 5ns;
END Behavioral;