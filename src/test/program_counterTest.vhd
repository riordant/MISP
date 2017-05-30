ENTITY program_counterTest IS
END program_counterTest;
ARCHITECTURE behavior OF program_counterTest IS
	-- Component Declaration for the Unit Under Test
	(UUT)
	COMPONENT Program_counter
		PORT (
			in0 : IN std_logic_vector(15 DOWNTO 0);
			reset : IN std_logic;
			PI : IN std_logic;
			PL : IN std_logic;
			Clk : IN std_logic;
			out0 : INOUT std_logic_vector(15 DOWNTO 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL in0 : std_logic_vector(15 DOWNTO 0) := 
	(OTHERS => '0');
	SIGNAL reset : std_logic := '0';
	SIGNAL PI : std_logic := '0';
	SIGNAL PL : std_logic := '0';
	SIGNAL Clk : std_logic := '0';
	--Outputs
	SIGNAL out0 : std_logic_vector(15 DOWNTO 0);
	-- Clock period definitions
	CONSTANT Clk_period : TIME := 10 ns;
BEGIN
	-- Instantiate the Unit Under Test (UUT)
	uut : Program_counter
	PORT MAP(
		in0 => in0, 
		reset => reset, 
		PI => PI, 
		PL => PL, 
		Clk => Clk, 
		out0 => out0
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
		--wait for Clk_period*10;
		reset <= '1';
		WAIT FOR 5ns;
		reset <= '0';
		--out0 <= "0000000000000000";
		--in0 <= "0000000000000010";
		--PI <= '1';
		--wait for 10ns;
		--assert out0 = "0000000000000001";
		--PI <= '0';
		--wait for 10ns;
		reset <= '1';
		WAIT FOR 10ns;
		reset <= '0';
		--PI <= '0';
		--wait for 10ns;
		--PL <= '1';
		--wait for 10ns;
		--assert out0 = "0000000000000010";
		WAIT;
	END PROCESS;
END;