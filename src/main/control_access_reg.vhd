ENTITY control_access_reg IS
	PORT (
		in0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		Clk : IN STD_LOGIC;
		reset : IN STD_LOGIC;
		sel : IN STD_LOGIC;
		out0 : INOUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END control_access_reg;
ARCHITECTURE Behavioral OF control_access_reg IS
	COMPONENT Arith_fullAdder
		PORT (
			X : IN STD_LOGIC;
			Y : IN STD_LOGIC;
			Cin : IN STD_LOGIC;
			Cout : OUT STD_LOGIC;
			Gout : OUT STD_LOGIC
		);
	END COMPONENT;
	--signals
	SIGNAL Cout_sig, Gout_sig : STD_LOGIC_VECTOR(7 DOWNTO
	0);

BEGIN
	CAR00 : Arith_fullAdder
	PORT MAP(
		X => out0(0), 
		Y => '1', 
		Cin => '0', 
		Cout => Cout_sig(0), 
		Gout => Gout_sig(0)
	);

	CAR01 : Arith_fullAdder
	PORT MAP(
		X => out0(1), 
		Y => '0', 
		Cin => Cout_sig(0), 
		Cout => Cout_sig(1), 
		Gout => Gout_sig(1)
	);

	CAR02 : Arith_fullAdder
	PORT MAP(
		X => out0(2), 
		Y => '0', 
		Cin => Cout_sig(1), 
		Cout => Cout_sig(2), 
		Gout => Gout_sig(2)
	);

	CAR03 : Arith_fullAdder
	PORT MAP(
		X => out0(3), 
		Y => '0', 
		Cin => Cout_sig(2), 
		Cout => Cout_sig(3), 
		Gout => Gout_sig(3)
	);

	CAR04 : Arith_fullAdder
	PORT MAP(
		X => out0(4), 
		Y => '0', 
		Cin => Cout_sig(3), 
		Cout => Cout_sig(4), 
		Gout => Gout_sig(4)
	);

	CAR05 : Arith_fullAdder
	PORT MAP(
		X => out0(5), 
		Y => '0', 
		Cin => Cout_sig(4), 
		Cout => Cout_sig(5), 
		Gout => Gout_sig(5)
	);

	CAR06 : Arith_fullAdder
	PORT MAP(
		X => out0(6), 
		Y => '0', 
		Cin => Cout_sig(5), 
		Cout => Cout_sig(6), 
		Gout => Gout_sig(6)
	);

	CAR07 : Arith_fullAdder
	PORT MAP(
		X => out0(7), 
		Y => '0', 
		Cin => Cout_sig(6), 
		Cout => Cout_sig(7), 
		Gout => Gout_sig(7)
	);
	PROCESS (Clk)
	BEGIN
		IF reset = '1' THEN
			out0 <= "00000000";
		END IF;
		IF (falling_edge(Clk)) THEN
			--if sel = 'U' then out0 <= "00000000";
			IF sel = '0' THEN
				out0 <= Gout_sig;
			ELSIF sel = '1' THEN
				out0 <= in0;
			END IF;
		END IF;
	END PROCESS;
END Behavioral;