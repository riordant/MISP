ENTITY FunctionUnit_16bitTest IS
END FunctionUnit_16bitTest;
ARCHITECTURE behavior OF FunctionUnit_16bitTest IS
	-- Component Declaration for the Unit Under Test
	(UUT)
	COMPONENT FunctionUnit_16bit
		PORT (
			A : IN std_logic_vector(15 DOWNTO 0);
			B : IN std_logic_vector(15 DOWNTO 0);
			FSselect : IN std_logic_vector(4 DOWNTO 0);
			C : OUT std_logic;
			V : OUT std_logic;
			N : OUT std_logic;
			Z : OUT std_logic;
			F : OUT std_logic_vector(15 DOWNTO 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL A : std_logic_vector(15 DOWNTO 0) := 
	(OTHERS => '0');
	SIGNAL B : std_logic_vector(15 DOWNTO 0) := 
	(OTHERS => '0');
	SIGNAL FSselect : std_logic_vector(4 DOWNTO 0) := 
	(OTHERS => '0');
	--Outputs
	SIGNAL C : std_logic;
	SIGNAL V : std_logic;
	SIGNAL N : std_logic;
	SIGNAL Z : std_logic;
	SIGNAL F : std_logic_vector(15 DOWNTO 0);
	-- No clocks detected in port list. Replace
	clock > below WITH
	-- appropriate port name
	--constant _period : time := 10 ns;
BEGIN
	-- Instantiate the Unit Under Test (UUT)
	uut : FunctionUnit_16bit
	PORT MAP(
		A => A, 
		B => B, 
		FSselect => FSselect, 
		C => C, 
		V => V, 
		N => N, 
		Z => Z, 
		F => F
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
		A <= "0000000000000000";
		B <= "1000000000000001";
		--THE FS SELECTS ARE INPUTTED BACKWARDS.
		--EG. 00101 IS SUBTRACT, BUT VECTOR INPUT
		WILL BE "10100".
			--COULD CHANGE, BUT EASIER IN THE LONG RUN.
			A <= "1000000000000001";
			--INCREMENT A
			FSselect <= "10000";
			WAIT FOR 10ns;
			ASSERT F = "1000000000000010";
			ASSERT Z = '0';
			ASSERT V = '0';
			ASSERT N = '1';
			ASSERT C = '0';
			--ADD A + B (00010)
			FSselect <= "01000";
			WAIT FOR 10ns;
			ASSERT F = "0000000000000010";
			ASSERT Z = '0';
			ASSERT V = '1';
			ASSERT N = '0';
			ASSERT C = '1';
			--A + B + 1
			FSselect <= "00011";
			WAIT FOR 10ns;
			ASSERT F = "0000000000000100";
			-- A + not B
			B <= "1111111111111110";
			FSselect <= "00100";
			WAIT FOR 10ns;
			ASSERT F = "0000000000000010";
			-- A - B
			A <= "0000000000000010";
			B <= "0000000000000001";
			FSselect <= "00101";
			WAIT FOR 10ns;
			ASSERT F = "0000000000000001";
			-- A - 1
			FSselect <= "00110";
			WAIT FOR 10ns;
			ASSERT F = "0000000000000001";
			-- TRANSFER A
			FSselect <= "00111";
			WAIT FOR 10ns;
			ASSERT F = "0000000000000010";
			-- AND
			FSselect <= "01000";
			WAIT FOR 10ns;
			ASSERT F = "0000000000000000";
			--OR
			A <= "0000000000000100";
			FSselect <= "01010";
			WAIT FOR 10ns;
			ASSERT F = "0000000000000101";
			--XOR
			A <= "0000000000001000";
			FSselect <= "01100";
			WAIT FOR 10ns;
			ASSERT F = "0000000000001001";
			--NOT A
			FSselect <= "01110";
			WAIT FOR 10ns;
			ASSERT F = "1111111111110111";
			B <= "0000000000001111";
			--B TRANSFER
			FSselect <= "10000";
			WAIT FOR 10ns;
			ASSERT F = "0000000000001111";
			--SHIFT B RIGHT
			FSselect <= "10100";
			WAIT FOR 10ns;
			ASSERT F = "0000000000000111";
			--SHIFT B LEFT
			FSselect <= "11000";
			WAIT FOR 10ns;
			ASSERT F = "0000000000011110";
			--wait for _period*10;
			-- insert stimulus here
			WAIT;
	END PROCESS;
	END;