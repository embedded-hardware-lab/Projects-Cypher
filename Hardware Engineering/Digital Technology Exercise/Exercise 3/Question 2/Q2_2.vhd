Library IEEE;
USE IEEE.Std_logic_1164.all;
use ieee.numeric_bit_unsigned.all;

entity full_adder_4_bit is
	port(	A : in bit_vector(3 downto 0); 
		B : in bit_vector(3 downto 0); 
		Cin : in bit;
		S: out bit_vector (3 downto 0);
		Cout : out bit);

end entity;

architecture data of full_adder_4_bit is
	signal c0,c1,c2 : bit;

	component full_adder_1_bit
		port(	A,B,Cin : in bit;
			S,Cout : out bit);
	end component;

	begin
		U1 : full_adder_1_bit port map (A =>A(0), B=>B(0), Cin=>Cin, Cout=>c0 , S =>S(0) );
		U2 : full_adder_1_bit port map (A =>A(1), B=>B(1), Cin=>c0, Cout=>c1 , S =>S(1) );
		U3 : full_adder_1_bit port map (A =>A(2), B=>B(2), Cin=>c1, Cout=>c2 , S =>S(2) );	
		U4 : full_adder_1_bit port map (A =>A(3), B=>B(3), Cin=>c2, Cout=>Cout , S =>S(3) );
end architecture;
