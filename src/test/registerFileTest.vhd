ENTITY registerFileTest IS
END registerFileTest;
ARCHITECTURE behavior OF registerFileTest IS
	-- Component Declaration for the Unit Under Test
	(UUT)
	COMPONENT Register_file
		PORT (
			s0_Amux9to16 : IN std_logic_vector(2 DOWNTO0);
			s0_Bmux9to16 : IN std_logic_vector(2 DOWNTO0);
			s0_dec3to9 : IN std_logic_vector(2 DOWNTO0);
			loadEnable : IN std_logic;
			TD : IN STD_LOGIC;
			TA : IN STD_LOGIC;
			TB : IN STD_LOGIC;
			DData : IN std_logic_vector(15 DOWNTO 0);
			Clk : IN std_logic;
			Adata : OUT std_logic_vector(15 DOWNTO 0);
			Bdata : OUT std_logic_vector(15 DOWNTO 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL s0_Amux9to16 : std_logic_vector(2 DOWNTO 0)
	(OTHERS => '0');
	SIGNAL s0_Bmux9to16 : std_logic_vector(2 DOWNTO 0)
	(OTHERS => '0');
	SIGNAL s0_dec3to9 : std_logic_vector(2 DOWNTO 0)
	(OTHERS => '0');
	SIGNAL loadEnable : std_logic := '0';
	SIGNAL DData : std_logic_vector(15 DOWNTO 0) := 
	(OTHERS => '0');
	SIGNAL Clk : std_logic := '0';
	SIGNAL TD : std_logic := '0';
	SIGNAL TA : std_logic := '0';
	SIGNAL TB : std_logic := '0';
	--Outputs
	SIGNAL Adata : std_logic_vector(15 DOWNTO 0);
	SIGNAL Bdata : std_logic_vector(15 DOWNTO 0);
	-- Clock period definitions
	CONSTANT Clk_period : TIME := 10 ns;
BEGIN
	-- Instantiate the Unit Under Test (UUT)
	uut : Register_file
	PORT MAP(
		s0_Amux9to16 => s0_Amux9to16, 
		s0_Bmux9to16 => s0_Bmux9to16, 
		s0_dec3to9 => s0_dec3to9, 
		loadEnable => loadEnable, 
		DData => DData, 
		TD => TD, 
		TA => TA, 
		TB => TB, 
		Clk => Clk, 
		Adata => Adata, 
		Bdata => Bdata
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
		DData <= "1111111111111111";
		TD <= '0';
		TA <= '0';
		TB <= '0';
		s0_dec3to9 <= "000";
		loadEnable <= '1';
		s0_Amux9to16 <= "000";
		s0_Bmux9to16 <= "000";
		WAIT FOR 20ns;
		ASSERT AData = "1111111111111111";
		ASSERT BData = "1111111111111111";
		WAIT FOR Clk_period * 10;
		-- insert stimulus here
		WAIT;
	END PROCESS;
END;