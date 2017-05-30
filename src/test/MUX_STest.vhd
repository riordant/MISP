ENTITY MUX_STest IS
END MUX_STest;
ARCHITECTURE behavior OF MUX_STest IS
	-- Component Declaration for the Unit Under Test
	(UUT)
	COMPONENT MUX_S
		PORT (
			in0 : IN std_logic;
			in1 : IN std_logic;
			in2 : IN std_logic;
			in3 : IN std_logic;
			in4 : IN std_logic;
			in5 : IN std_logic;
			in6 : IN std_logic;
			in7 : IN std_logic;
			sel : IN std_logic_vector(2 DOWNTO 0);
			out0 : OUT std_logic
		);
	END COMPONENT;

	--Inputs
	SIGNAL in0 : std_logic := '0';
	SIGNAL in1 : std_logic := '0';
	SIGNAL in2 : std_logic := '0';
	SIGNAL in3 : std_logic := '0';
	SIGNAL in4 : std_logic := '0';
	SIGNAL in5 : std_logic := '0';
	SIGNAL in6 : std_logic := '0';
	SIGNAL in7 : std_logic := '0';
	SIGNAL sel : std_logic_vector(2 DOWNTO 0) := 
	(OTHERS => '0');
	--Outputs
	SIGNAL out0 : std_logic;
	-- No clocks detected in port list. Replace
	clock > below WITH
	-- appropriate port name
	--constant _period : time := 10 ns;
BEGIN
	-- Instantiate the Unit Under Test (UUT)
	uut : MUX_S
	PORT MAP(
		in0 => in0, 
		in1 => in1, 
		in2 => in2, 
		in3 => in3, 
		in4 => in4, 
		in5 => in5, 
		in6 => in6, 
		in7 => in7, 
		sel => sel, 
		out0 => out0
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
		in2 <= '0';
		in3 <= '1';
		in4 <= '0';
		in5 <= '1';
		in6 <= '0';
		in7 <= '1';
		sel <= "000";
		WAIT FOR 10ns;
		ASSERT out0 = '0';
		sel <= "001";
		WAIT FOR 10ns;
		ASSERT out0 = '1';
		sel <= "010";
		WAIT FOR 10ns;
		ASSERT out0 = '0';
		sel <= "011";
		WAIT FOR 10ns;
		ASSERT out0 = '1';
		sel <= "100";
		WAIT FOR 10ns;
		ASSERT out0 = '0';
		sel <= "101";
		WAIT FOR 10ns;
		ASSERT out0 = '1';
		sel <= "110";
		WAIT FOR 10ns;
		ASSERT out0 = '0';
		sel <= "111";
		WAIT FOR 10ns;
		ASSERT out0 = '1';
		--wait for _period*10;
		-- insert stimulus here
		WAIT;
END PROCESS;
END;