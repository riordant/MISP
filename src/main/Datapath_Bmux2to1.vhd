ENTITY Datapath_Bmux2to1 IS
	PORT (
		in0 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		in1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		S : IN STD_LOGIC;
		out0 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END Datapath_Bmux2to1;
ARCHITECTURE Behavioral OF Datapath_Bmux2to1 IS
BEGIN
	out0 <= in0 WHEN S <= '0' ELSE
	        in1 WHEN S <= '1';
END Behavioral;