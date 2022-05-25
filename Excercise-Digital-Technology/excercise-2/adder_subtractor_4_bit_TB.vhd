entity adder_subtractor_4_bit_TB is
end adder_subtractor_4_bit_TB;

architecture data of adder_subtractor_4_bit_TB is

	component adder_subtractor_4_bit
		port(A : in bit_vector(3 downto 0); B : in bit_vector(3 downto 0);Cin, SUB : in bit;
		S: out bit_vector (3 downto 0);Cout : out bit);
	end component;

	signal A_TB: bit_vector(3 downto 0);
	signal B_TB: bit_vector(3 downto 0);
	signal S_TB: bit_vector(3 downto 0);
	signal Cin_TB,SUB_TB: bit;
	signal Cout_TB: bit;

	begin
	DUT1: adder_subtractor_4_bit port map(

A=>A_TB,
B=>B_TB,
Cin=>Cin_TB,
SUB=>SUB_TB,
S=>S_TB,
Cout=>Cout_TB);


A_TB <= "0001", "0010" after 10 ns, "0011" after 20 ns;
B_TB <= "0001" ;
Cin_TB <= '0';
SUB_TB <= '0';




end data;