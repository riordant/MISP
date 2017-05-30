ENTITY ControlMemoryTest IS
	END ControlMemoryTest;
	ARCHITECTURE behavior OF ControlMemoryTest IS
		-- Component Declaration for the Unit Under Test
		(UUT)COMPONENT control_memory
		PORT (MW : OUT std_logic;
			MM : OUT std_logic;
			RW : OUT std_logic;
			MD : OUT std_logic;
			FS : OUT std_logic_vector(4 DOWNTO 0);
			MB : OUT std_logic;
			TB : OUT std_logic;
			TA : OUT std_logic;
			TD : OUT std_logic;
			PL : OUT std_logic;
			PI : OUT std_logic;
			IL : OUT std_logic;
			MC : OUT std_logic;
			MS : OUT std_logic_vector(2 DOWNTO 0);
			NA : OUT std_logic_vector(7 DOWNTO 0);
			IN_CAR : IN std_logic_vector(7 DOWNTO 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL IN_CAR : std_logic_vector(7 DOWNTO 0) := 
	(OTHERS => '0');
	--Outputs
	SIGNAL MW : std_logic;
	SIGNAL MM : std_logic;
	SIGNAL RW : std_logic;
	SIGNAL MD : std_logic;
	SIGNAL FS : std_logic_vector(4 DOWNTO 0);
	SIGNAL MB : std_logic;
	SIGNAL TB : std_logic;
	SIGNAL TA : std_logic;
	SIGNAL TD : std_logic;
	SIGNAL PL : std_logic;
	SIGNAL PI : std_logic;
	SIGNAL IL : std_logic;
	SIGNAL MC : std_logic;
	SIGNAL MS : std_logic_vector(2 DOWNTO 0);
	SIGNAL NA : std_logic_vector(7 DOWNTO 0);
	-- No clocks detected in port list. Replace
	clock > below WITH
	-- appropriate port name
	--constant _period : time := 10 ns;
BEGIN
	-- Instantiate the Unit Under Test (UUT)
	uut : control_memory
	PORT MAP(
		MW => MW, 
		MM => MM, 
		RW => RW, 
		MD => MD, 
		FS => FS, 
		MB => MB, 
		TB => TB, 
		TA => TA, 
		TD => TD, 
		PL => PL, 
		PI => PI, 
		IL => IL, 
		MC => MC, 
		MS => MS, 
		NA => NA, 
		IN_CAR => IN_CAR
	);
	-- Clock process definitions
	--_process :process
	--begin
	-- <= '0';
	--wait for _period/2;
	-- <= '1';
	--wait for _period/2;
	--end process;
	-- Stimulus process
	stim_proc : PROCESS
	BEGIN
		WAIT FOR 100 ns;
		--wait for _period*10;
		IN_CAR <= "00000010";
		WAIT FOR 50ns;
		WAIT;
	END PROCESS;
END;