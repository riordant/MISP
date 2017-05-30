ENTITY Instruction_reg IS
	PORT (
		in0 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		sel : IN STD_LOGIC;
		opcode : OUT STD_LOGIC_VECTOR(6 DOWNTO0);
		DR : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		SA : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		Clk : IN STD_LOGIC;
		SB : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END Instruction_reg;
ARCHITECTURE Behavioral OF Instruction_reg IS
BEGIN
	PROCESS (Clk)
	BEGIN
		IF (rising_edge(Clk)) THEN
			IF sel = '1' THEN
				opcode <= in0(15 DOWNTO 9);
				DR <= in0(8 DOWNTO 6);
				SA <= in0(5 DOWNTO 3);
				SB <= in0(2 DOWNTO 0);
			END IF;
		END IF;
	END PROCESS;
END Behavioral