Library IEEE;
USE IEEE.Std_logic_1164.all;

entity adder_subtractor_4_bit_TB is
end adder_subtractor_4_bit_TB;

architecture data of adder_subtractor_4_bit_TB is

	component adder_subtractor_4_bit
		port(	A : in std_logic_vector(3 downto 0); 
			B : in std_logic_vector(3 downto 0);
			Cin, SUB : in std_logic;
			S: out std_logic_vector (3 downto 0);
			Cout : out std_logic);
	end component;

	signal A_TB: std_logic_vector(3 downto 0);
	signal B_TB: std_logic_vector(3 downto 0);
	signal S_TB: std_logic_vector(3 downto 0);
	signal Cin_TB,SUB_TB: std_logic;
	signal Cout_TB: std_logic;

	begin
	DUT1: adder_subtractor_4_bit port map(	A=>A_TB,
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