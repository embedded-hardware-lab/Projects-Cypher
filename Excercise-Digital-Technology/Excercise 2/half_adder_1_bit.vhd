Library IEEE;
USE IEEE.Std_logic_1164.all;


entity half_adder_1_bit is
	port(	A,B : in std_logic;
		S,C: out std_logic);
end entity;

architecture data of half_adder_1_bit is
	begin
		S <= A xor B;
		C <= A and B;
end architecture;