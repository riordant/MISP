LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
-- Uncomment the following library declaration if
using
-- arithmetic functions with Signed or Unsigned
values
--USE ieee.numeric_std.ALL;
ENTITY MemoryTest IS
END MemoryTest;
ARCHITECTURE behavior OF MemoryTest IS
	-- Component Declaration for the Unit Under Test
	(UUT)
	COMPONENT Memory
		PORT (
			address : IN unsigned(15 DOWNTO 0);
			write_data : IN std_logic_vector(15 DOWNTO0);
			MW : IN std_logic;
			read_data : OUT std_logic_vector(15 DOWNTO0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL address : unsigned(15 DOWNTO 0) := (OTHERS
	'0');
	SIGNAL write_data : std_logic_vector(15 DOWNTO 0)
	(OTHERS => '0');
	SIGNAL MW : std_logic := '0';
	--Outputs
	SIGNAL read_data : std_logic_vector(15 DOWNTO 0)
	(OTHERS => '0');
	-- No clocks detected in port list. Replace
	clock > below WITH
	-- appropriate port name
	--constant _period : time := 10 ns;
BEGIN
	-- Instantiate the Unit Under Test (UUT)
	uut : Memory
	PORT MAP(
		address => address, 
		write_data => write_data, 
		MW => MW, 
		read_data => read_data
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
		address <= "0000000000000000";
		MW <= '0';
		WAIT FOR 100ns;
		write_data <= "0000000000001111";
		MW <= '1';
		WAIT FOR 100ns;
		MW <= '0';
		WAIT FOR 10ns;
		ASSERT read_data = "0000000000001111";
		--wait for _period*10;
		-- insert stimulus here
		WAIT;
	END PROCESS;
END;