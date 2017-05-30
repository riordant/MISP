ENTITY InstructionRegTest IS
END InstructionRegTest;
ARCHITECTURE behavior OF InstructionRegTest IS
	-- Component Declaration for the Unit Under Test
	(UUT)
	COMPONENT Instruction_reg
		PORT (
			in0 : IN std_logic_vector(15 DOWNTO 0);
			sel : IN std_logic;
			opcode : OUT std_logic_vector(6 DOWNTO 0);
			DR : OUT std_logic_vector(2 DOWNTO 0);
			SA : OUT std_logic_vector(2 DOWNTO 0);
			Clk : IN std_logic;
			SB : OUT std_logic_vector(2 DOWNTO 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL in0 : std_logic_vector(15 DOWNTO 0) := 
	(OTHERS => '0');
	SIGNAL Clk : std_logic := '0';
	SIGNAL sel : std_logic := '0';
	--Outputs
	SIGNAL opcode : std_logic_vector(6 DOWNTO 0);
	SIGNAL DR : std_logic_vector(2 DOWNTO 0);
	SIGNAL SA : std_logic_vector(2 DOWNTO 0);
	SIGNAL SB : std_logic_vector(2 DOWNTO 0);
	-- Clock period definitions
	CONSTANT Clk_period : TIME := 10 ns;
BEGIN
	-- Instantiate the Unit Under Test (UUT)
	uut : Instruction_reg
	PORT MAP(
		in0 => in0, 
		Clk => Clk, 
		sel => sel, 
		opcode => opcode, 
		DR => DR, 
		SA => SA, 
		SB => SB
	);
	-- Clock process definitions
	Clk_process : PROCESS
	BEGIN
		Clk <= '0';
		WAIT FOR Clk_period/2;
		Clk <= '1';
		WAIT FOR Clk_period/2;
	END PROCESS;
	-- Stimulus process
	stim_proc : PROCESS
	BEGIN
		-- hold reset state for 100 ns.
		WAIT FOR 100 ns;

		in0 <= "0101010101010101";
		sel <= '0';
		WAIT FOR 10ns;
		ASSERT opcode = "UUUUUUU";
		ASSERT DR = "UUU";
		ASSERT SA = "UUU";
		ASSERT SB = "UUU";
		sel <= '1';
		WAIT FOR 10ns;
		ASSERT opcode = "0101010";
		ASSERT DR = "101";
		ASSERT SA = "010";
		ASSERT SB = "101";
		sel <= '0';
		WAIT FOR 10ns;
		ASSERT opcode = "0101010";
		ASSERT DR = "101";
		ASSERT SA = "010";
		ASSERT SB = "101";
		in0 <= "1111111111111111";
		WAIT FOR 10ns;
		ASSERT opcode = "0101010";
		ASSERT DR = "101";
		ASSERT SA = "010";
		ASSERT SB = "101";
		sel <= '1';
		WAIT FOR 10ns;
		ASSERT opcode = "1111111";
		ASSERT DR = "111";
		ASSERT SA = "111";
		ASSERT SB = "111";
		WAIT FOR Clk_period * 10;
		-- insert stimulus here
		WAIT;
	END PROCESS;
END;