ENTITY extend IS
	PORT (
		in0 : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		out0 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END extend;
ARCHITECTURE Behavioral OF extend IS
BEGIN
	PROCESS (in0(5))
	BEGIN
		IF in0(5) = '1' THEN
			out0(15 DOWNTO 6) <= "1111111111";
			out0(5 DOWNTO 0) <= in0;
		ELSIF in0(5) = '0' THEN
			out0(15 DOWNTO 6) <= "0000000000";
			out0(5 DOWNTO 0) <= in0;
		END IF;
	END PROCESS;
END Behavioral;