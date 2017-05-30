LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-- Uncomment the following library declaration if
using
-- arithmetic functions with Signed or Unsigned
values
--USE ieee.numeric_std.ALL;
ENTITY CARTest IS
END CARTest;
ARCHITECTURE behavior OF CARTest IS
	-- Component Declaration for the Unit Under Test
	(UUT)
	COMPONENT control_access_reg
		PORT (
			in0 : IN std_logic_vector(7 DOWNTO 0);
			sel : IN std_logic;
			reset : IN std_logic;
			Clk : IN std_logic;
			out0 : INOUT std_logic_vector(7 DOWNTO 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL in0 : std_logic_vector(7 DOWNTO 0) := 
	(OTHERS => '0');
	SIGNAL sel : std_logic := '0';
	SIGNAL Clk : std_logic := '0';
	SIGNAL reset : std_logic := '0';
	--Outputs
	SIGNAL out0 : std_logic_vector(7 DOWNTO 0);
	-- No clocks detected in port list. Replace
	clock > below WITH
	-- appropriate port name
	CONSTANT Clk_period : TIME := 10 ns;
BEGIN
	-- Instantiate the Unit Under Test (UUT)
	uut : control_access_reg
	PORT MAP(
		in0 => in0, 
		sel => sel, 
		out0 => out0, 
		reset => reset, 
		Clk => Clk
	);
	--Clock process definitions
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
		sel <= 'U';
		reset <= '1';
		ASSERT out0 <= "00000000";
		WAIT FOR 10ns;
		reset <= '0';
		sel <= '1';
		WAIT FOR 10ns;
		ASSERT out0 = "00000110";
		WAIT FOR Clk_period * 10;
		WAIT;
	END PROCESS;
END;