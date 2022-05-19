entity adder_subtractor_4_bit is
	port(A : in bit_vector(3 downto 0); B : in bit_vector(3 downto 0);Cin, SUB : in bit;
		S: out bit_vector (3 downto 0);Cout : out bit);

	--port(A1,B1 ,A2,B2,A3,B3,A4,B4,Cin, SUB : in bit;
		--S1,S2,S3,S4,Cout : out bit);
end entity;

architecture data of adder_subtractor_4_bit is
	signal b1o,b2o,b3o,b4o,cio,coi : bit;
	signal
	component full_adder_4_bit
		port(A : in bit_vector(3 downto 0); B : in bit_vector(3 downto 0); Cin : in bit;
		S: out bit_vector (3 downto 0);Cout : out bit);
	end component;

	begin
		U1 : full_adder_4_bit port map (A =>A, S =>S,B(0)=>b1o,B(1)=>b2o, B(2)=>b3o, B(3)=>b4o,  Cin=>cio, Cout=>coi );
		U2 : b1o <= B(0) xor SUB;
		U3 : b2o <= B(1) xor SUB;
		U4 : b3o <= B(2) xor SUB;
		U5 : b4o <= B(3) xor SUB;
		U6 : cio <= Cin xor SUB;
		U7 : Cout <= coi xor SUB;


		--U1 : full_adder_4_bit port map (A1 =>A1, A2 =>A2,A3 =>A3,A4 =>A4, B1=>b1o,B2=>b2o, B3=>b3o, B4=>b4o,  Cin=>cio, Cout=>coi , S1 =>S1,S2 =>S2,S3 =>S3,S4 =>S4 );
		--U2 : b1o <= B1 xor SUB;
		--U3 : b2o <= B2 xor SUB;
		--U4 : b3o <= B3 xor SUB;
		--U5 : b4o <= B4 xor SUB;
		--U6 : cio <= Cin xor SUB;
		--U7 : Cout <= coi xor SUB;
	
end architecture;
