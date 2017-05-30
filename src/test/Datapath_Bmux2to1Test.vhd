ENTITY Datapath_Bmux2to1Test IS
END Datapath_Bmux2to1Test;
ARCHITECTURE behavior OF Datapath_Bmux2to1Test IS
	-- Component Declaration for the Unit Under Test
	(UUT)
	COMPONENT Datapath_Bmux2to1
		PORT (
			in0 : IN std_logic_vector(15 DOWNTO 0);
			in1 : IN std_logic_vector(15 DOWNTO 0);
			S : IN std_logic;
			out0 : OUT std_logic_vector(15 DOWNTO 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL in0 : std_logic_vector(15 DOWNTO 0) := 
	(OTHERS => '0');
	SIGNAL in1 : std_logic_vector(15 DOWNTO 0) := 
	(OTHERS => '0');
	SIGNAL S : std_logic := '0';
	--Outputs
	SIGNAL out0 : std_logic_vector(15 DOWNTO 0);
	-- No clocks detected in port list. Replace
	clock > below WITH
	-- appropriate port name
	--constant _period : time := 10 ns;
BEGIN
	-- Instantiate the Unit Under Test (UUT)
	uut : Datapath_Bmux2to1
	PORT MAP(
		in0 => in0, 
		in1 => in1, 
		S => S, 
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
		in0 <= "0000000000000000";
		in1 <= "1111111111111111";
		S <= '0';
		WAIT FOR 10ns;
		ASSERT out0 <= "0000000000000000";
		S <= '1';
		WAIT FOR 10ns;
		ASSERT out0 <= "1111111111111111";
		--wait for _period*10;
		-- insert stimulus here
		WAIT;
	END PROCESS;
END;