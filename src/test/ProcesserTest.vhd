ENTITY ProcesserTest IS
END ProcesserTest;
ARCHITECTURE behavior OF ProcesserTest IS
	-- Component Declaration for the Unit Under Test
	(UUT)
	COMPONENT Processer
		PORT (
			reset : IN std_logic;
			Clk : IN std_logic;
			Datapath_out : OUT std_logic_vector(15DOWNTO 0);
			PCouttest : OUT std_logic_vector(15DOWNTO 0);
			CARouttest : OUT std_logic_vector(7DOWNTO 0);
			TBouttest : OUT STD_LOGIC_VECTOR(15DOWNTO 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL reset : std_logic := '0';
	SIGNAL Clk : std_logic := '0';
	--Outputs
	SIGNAL TBouttest : STD_LOGIC_VECTOR(15 DOWNTO
	0);
	SIGNAL Datapath_out : std_logic_vector(15 DOWNTO
	0);
	SIGNAL PCouttest : std_logic_vector(15 DOWNTO
	0);
	SIGNAL CARouttest : std_logic_vector(7 DOWNTO 0);
	-- Clock period definitions
	CONSTANT Clk_period : TIME := 10 ns;
BEGIN
	-- Instantiate the Unit Under Test (UUT)
	uut : Processer
	PORT MAP(
		reset => reset, 
		Clk => Clk, 
		Datapath_out => Datapath_out, 
		PCouttest => PCouttest, 
		CARouttest => CARouttest, 
		TBouttest => TBouttest
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
		reset <= '1';
		WAIT FOR 10ns;
		reset <= '0';
		-- insert stimulus here
		WAIT;
	END PROCESS;
END;