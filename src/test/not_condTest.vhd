ENTITY not_condTest IS
END not_condTest;
ARCHITECTURE behavior OF not_condTest IS
	-- Component Declaration for the Unit Under Test
	(UUT)
	COMPONENT NOT_cond
		PORT (
			in0 : IN std_logic;
			in1 : IN std_logic;
			out0 : OUT std_logic;
			out1 : OUT std_logic
		);
	END COMPONENT;

	--Inputs
	SIGNAL in0 : std_logic := '0';
	SIGNAL in1 : std_logic := '0';
	--Outputs
	SIGNAL out0 : std_logic;
	SIGNAL out1 : std_logic;
	-- No clocks detected in port list. Replace
	clock > below WITH
	-- appropriate port name
	--constant _period : time := 10 ns;
BEGIN
	-- Instantiate the Unit Under Test (UUT)
	uut : NOT_cond
	PORT MAP(
		in0 => in0, 
		in1 => in1, 
		out0 => out0, 
		out1 => out1
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
		-- hold reset state for 100 ns.
		WAIT FOR 100 ns;
		in0 <= '0';
		in1 <= '1';
		WAIT FOR 5ns;
		ASSERT out0 <= '1';
		ASSERT out1 <= '0';
		WAIT;
	END PROCESS;
E