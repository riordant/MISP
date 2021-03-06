ENTITY extendTest IS
END extendTest;
ARCHITECTURE behavior OF extendTest IS
	-- Component Declaration for the Unit Under Test
	(UUT)
	COMPONENT extend
		PORT (
			in0 : IN std_logic_vector(5 DOWNTO 0);
			out0 : OUT std_logic_vector(15 DOWNTO 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL in0 : std_logic_vector(5 DOWNTO 0) := 
	(OTHERS => '0');
	--Outputs
	SIGNAL out0 : std_logic_vector(15 DOWNTO 0);
	-- No clocks detected in port list. Replace
	clock > below WITH
	-- appropriate port name
	--constant _period : time := 10 ns;
BEGIN
	-- Instantiate the Unit Under Test (UUT)
	uut : extend
	PORT MAP(
		in0 => in0, 
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
		in0 <= "101010";
		WAIT FOR 10ns;
		ASSERT out0 = "1111111111101010";
		in0 <= "001010";
		WAIT FOR 10ns;
		ASSERT out0 = "0000000000001010";
		--wait for _period*10;
		-- insert stimulus here
		WAIT;
	END PROCESS;
END;