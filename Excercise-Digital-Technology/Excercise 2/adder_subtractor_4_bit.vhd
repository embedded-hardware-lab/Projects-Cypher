Library IEEE;
USE IEEE.Std_logic_1164.all;

entity adder_subtractor_4_bit is
	port(	A : in std_logic_vector(3 downto 0); 
		B : in std_logic_vector(3 downto 0);
		Cin, SUB : in std_logic;
		S: out std_logic_vector (3 downto 0);
		Cout : out std_logic);
end entity;

architecture data of adder_subtractor_4_bit is
	signal b1o,b2o,b3o,b4o,cio,coi : std_logic;
	
	component full_adder_4_bit
		port(	A : in std_logic_vector(3 downto 0); 
			B : in std_logic_vector(3 downto 0); Cin : in std_logic;
			S: out std_logic_vector (3 downto 0);Cout : out std_logic);
	end component;

	begin
		U1 : full_adder_4_bit port map (A =>A, S =>S,B(0)=>b1o,B(1)=>b2o, B(2)=>b3o, B(3)=>b4o,  Cin=>cio, Cout=>coi );
		U2 : b1o <= B(0) xor SUB;
		U3 : b2o <= B(1) xor SUB;
		U4 : b3o <= B(2) xor SUB;
		U5 : b4o <= B(3) xor SUB;
		U6 : cio <= Cin xor SUB;
		U7 : Cout <= coi xor SUB;
	
end architecture;
