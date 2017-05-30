ENTITY Program_counter IS
	PORT (
		in0 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		reset : IN std_logic;
		PI : IN STD_LOGIC;
		PL : IN STD_LOGIC;
		Clk : IN STD_LOGIC;
		out0 : INOUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END Program_counter;
ARCHITECTURE Behavioral OF Program_counter IS
	COMPONENT Arith_fullAdder
		PORT (
			X : IN STD_LOGIC;
			Y : IN STD_LOGIC;
			Cin : IN STD_LOGIC;
			Cout : OUT STD_LOGIC;
			Gout : OUT STD_LOGIC
		);
	END COMPONENT;
	SIGNAL p, PICout_sig, PIGout_sig, PLCout_sig, PLGout_sig
	std_logic_vector(15 DOWNTO 0);
	SIGNAL temp : std_logic_vector(1 DOWNTO 0);
BEGIN
	--PI PORT MAPS
	PI00 : Arith_fullAdder
	PORT MAP(
		X => out0(0), 
		Y => '1', 
		Cin => '0', 
		Cout => PICout_sig(0), 
		Gout => PIGout_sig(0)
	);
	PI01 : Arith_fullAdder
	PORT MAP(
		X => out0(1), 
		Y => '0', 
		Cin => PICout_sig(0), 
		Cout => PICout_sig(1), 
		Gout => PIGout_sig(1)
	);
	PI02 : Arith_fullAdder
	PORT MAP(
		X => out0(2), 
		Y => '0', 
		Cin => PICout_sig(1), 
		Cout => PICout_sig(2), 
		Gout => PIGout_sig(2)
	);
	PI03 : Arith_fullAdder
	PORT MAP(
		X => out0(3), 
		Y => '0', 
		Cin => PICout_sig(2), 
		Cout => PICout_sig(3), 
		Gout => PIGout_sig(3)
	);
	PI04 : Arith_fullAdder
	PORT MAP(
		X => out0(4), 
		Y => '0', 
		Cin => PICout_sig(3), 
		Cout => PICout_sig(4), 
		Gout => PIGout_sig(4)
	);
	PI05 : Arith_fullAdder
	PORT MAP(
		X => out0(5), 
		Y => '0', 
		Cin => PICout_sig(4), 
		Cout => PICout_sig(5), 
		Gout => PIGout_sig(5)
	);
	PI06 : Arith_fullAdder
	PORT MAP(
		X => out0(6), 
		Y => '0', 
		Cin => PICout_sig(5), 
		Cout => PICout_sig(6), 
		Gout => PIGout_sig(6)
	);
	PI07 : Arith_fullAdder
	PORT MAP(
		X => out0(7), 
		Y => '0', 
		Cin => PICout_sig(6), 
		Cout => PICout_sig(7), 
		Gout => PIGout_sig(7)
	);
	PI08 : Arith_fullAdder
	PORT MAP(
		X => out0(8), 
		Y => '0', 
		Cin => PICout_sig(7), 
		Cout => PICout_sig(8), 
		Gout => PIGout_sig(8)
	);
	PI09 : Arith_fullAdder
	PORT MAP(
		X => out0(9), 
		Y => '0', 
		Cin => PICout_sig(8), 
		Cout => PICout_sig(9), 
		Gout => PIGout_sig(9)
	);
	PI10 : Arith_fullAdder
	PORT MAP(
		X => out0(10), 
		Y => '0', 
		Cin => PICout_sig(9), 
		Cout => PICout_sig(10), 
		Gout => PIGout_sig(10)
	);
	PI11 : Arith_fullAdder
	PORT MAP(
		X => out0(11), 
		Y => '0', 
		Cin => PICout_sig(10), 
		Cout => PICout_sig(11), 
		Gout => PIGout_sig(11)
	);
	PI12 : Arith_fullAdder
	PORT MAP(
		X => out0(12), 
		Y => '0', 
		Cin => PICout_sig(11), 
		Cout => PICout_sig(12), 
		Gout => PIGout_sig(12)
	);
	PI13 : Arith_fullAdder
	PORT MAP(
		X => out0(13), 
		Y => '0', 
		Cin => PICout_sig(12), 
		Cout => PICout_sig(13), 
		Gout => PIGout_sig(13)
	);
	PI14 : Arith_fullAdder
	PORT MAP(
		X => out0(14), 
		Y => '0', 
		Cin => PICout_sig(13), 
		Cout => PICout_sig(14), 
		Gout => PIGout_sig(14)
	);
	PI15 : Arith_fullAdder
	PORT MAP(
		X => out0(15), 
		Y => '0', 
		Cin => PICout_sig(14), 
		Cout => PICout_sig(15), 
		Gout => PIGout_sig(15)
	);
	--PL port maps
	PL00 : Arith_fullAdder
	PORT MAP(
		X => out0(0), 
		Y => in0(0), 
		Cin => '0', 
		Cout => PLCout_sig(0), 
		Gout => PLGout_sig(0)
	);
	PL01 : Arith_fullAdder
	PORT MAP(
		X => out0(1), 
		Y => in0(1), 
		Cin => PLCout_sig(0), 
		Cout => PLCout_sig(1), 
		Gout => PLGout_sig(1)
	);
	PL02 : Arith_fullAdder
	PORT MAP(
		X => out0(2), 
		Y => in0(2), 
		Cin => PLCout_sig(1), 
		Cout => PLCout_sig(2), 
		Gout => PLGout_sig(2)
	);
	PL03 : Arith_fullAdder
	PORT MAP(
		X => out0(3), 
		Y => in0(3), 
		Cin => PLCout_sig(2), 
		Cout => PLCout_sig(3), 
		Gout => PLGout_sig(3)
	);
	PL04 : Arith_fullAdder
	PORT MAP(
		X => out0(4), 
		Y => in0(4), 
		Cin => PLCout_sig(3), 
		Cout => PLCout_sig(4), 
		Gout => PLGout_sig(4)
	);
	PL05 : Arith_fullAdder
	PORT MAP(
		X => out0(5), 
		Y => in0(5), 
		Cin => PLCout_sig(4), 
		Cout => PLCout_sig(5), 
		Gout => PLGout_sig(5)
	);
	PL06 : Arith_fullAdder
	PORT MAP(
		X => out0(6), 
		Y => in0(6), 
		Cin => PLCout_sig(5), 
		Cout => PLCout_sig(6), 
		Gout => PLGout_sig(6)
	);
	PL07 : Arith_fullAdder
	PORT MAP(
		X => out0(7), 
		Y => in0(7), 
		Cin => PLCout_sig(6), 
		Cout => PLCout_sig(7), 
		Gout => PLGout_sig(7)
	);
	PL08 : Arith_fullAdder
	PORT MAP(
		X => out0(8), 
		Y => in0(8), 
		Cin => PLCout_sig(7), 
		Cout => PLCout_sig(8), 
		Gout => PLGout_sig(8)
	);
	PL09 : Arith_fullAdder
	PORT MAP(
		X => out0(9), 
		Y => in0(9), 
		Cin => PLCout_sig(8), 
		Cout => PLCout_sig(9), 
		Gout => PLGout_sig(9)
	);
	PL10 : Arith_fullAdder
	PORT MAP(
		X => out0(10), 
		Y => in0(10), 
		Cin => PLCout_sig(9), 
		Cout => PLCout_sig(10), 
		Gout => PLGout_sig(10)
	);
	PL11 : Arith_fullAdder
	PORT MAP(
		X => out0(11), 
		Y => in0(11), 
		Cin => PLCout_sig(10), 
		Cout => PLCout_sig(11), 
		Gout => PLGout_sig(11)
	);
	PL12 : Arith_fullAdder
	PORT MAP(
		X => out0(12), 
		Y => in0(12), 
		Cin => PLCout_sig(11), 
		Cout => PLCout_sig(12), 
		Gout => PLGout_sig(12)
	);
	PL13 : Arith_fullAdder
	PORT MAP(
		X => out0(13), 
		Y => in0(13), 
		Cin => PLCout_sig(12), 
		Cout => PLCout_sig(13), 
		Gout => PLGout_sig(13)
	);
	PL14 : Arith_fullAdder
	PORT MAP(
		X => out0(14), 
		Y => in0(14), 
		Cin => PLCout_sig(13), 
		Cout => PLCout_sig(14), 
		Gout => PLGout_sig(14)
	);
	PL15 : Arith_fullAdder
	PORT MAP(
		X => out0(15), 
		Y => in0(15), 
		Cin => PLCout_sig(14), 
		Cout => PLCout_sig(15), 
		Gout => PLGout_sig(15)
	);
	PROCESS (Clk)
	BEGIN
		IF (rising_edge(Clk)) THEN
			IF reset = '1' THEN
				out0 <= "0000000000000000";
			ELSIF PI = '1' THEN
				out0 <= PIGout_sig;
			ELSIF PL = '1' THEN
				out0 <= PLGout_sig;
			END IF;
		END IF;
	END PROCESS;
END Behavioral;