entity adder_subtractor_4_bit is
	port(	A : in bit_vector(3 downto 0); 
		B : in bit_vector(3 downto 0);
		Cin, SUB : in bit;
		S: out bit_vector (3 downto 0);
		Cout : out bit);
end entity;

architecture data of adder_subtractor_4_bit is
	signal cio,coi : bit;
	signal bOut : bit_vector(3 downto 0); 
	
	component full_adder_4_bit
		port(	A : in bit_vector(3 downto 0); 
			B : in bit_vector(3 downto 0); 
			Cin : in bit;
			S: out bit_vector (3 downto 0);
			Cout : out bit);
	end component;

	begin
		U1 : full_adder_4_bit port map (A =>A, S =>S ,B => bOUT,  Cin=>cio, Cout=>coi );
		U2 : bOUT(0) <= B(0) xor SUB;
		U3 : bOUT(1) <= B(1) xor SUB;
		U4 : bOUT(2) <= B(2) xor SUB;
		U5 : bOUT(3) <= B(3) xor SUB;
		U6 : cio <= Cin xor SUB;
		U7 : Cout <= coi xor SUB;
	
end architecture;