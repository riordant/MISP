ENTITY MUX_CTest IS
END MUX_CTest;
ARCHITECTURE behavior OF MUX_CTest IS
	-- Component Declaration for the Unit Under Test
	(UUT)
	COMPONENT MUX_C
		PORT (
			in0 : IN std_logic_vector(7 DOWNTO 0);
			in1 : IN std_logic_vector(7 DOWNTO 0);
			sel : IN std_logic;
			out0 : OUT std_logic_vector(7 DOWNTO 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL in0 : std_logic_vector(7 DOWNTO 0) := 
	(OTHERS => '0');
	SIGNAL in1 : std_logic_vector(7 DOWNTO 0) := 
	(OTHERS => '0');
	SIGNAL sel : std_logic := '0';
	--Outputs
	SIGNAL out0 : std_logic_vector(7 DOWNTO 0);
	-- No clocks detected in port list. Replace
	clock > below WITH
	-- appropriate port name
	--constant _period : time := 10 ns;
BEGIN
	-- Instantiate the Unit Under Test (UUT)
	uut : MUX_C
	PORT MAP(
		in0 => in0, 
		in1 => in1, 
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
		in0 <= "00000000";
		in1 <= "11111111";
		sel <= '0';
		WAIT FOR 10ns;
		ASSERT out0 <= "00000000";
		sel <= '1';
		WAIT FOR 10ns;
		ASSERT out0 <= "11111111";
		--wait for _period*10;
		-- insert stimulus here
		WAIT;
	END PROCESS;
END;