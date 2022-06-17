-- concurrent statements
entity multiplexer_4_1 is
	port ( 	input : in bit_vector(3 downto 0);
		input_select : in bit_vector(1 downto 0);
		output : out bit);

end entity;

architecture behavioural of multiplexer_4_1 is
	begin
		output <= 	(input(0) and not input_select(0) and  not input_select(1)) or 
				(input(1) and not input_select(0) and  input_select(1)) or
				(input(2) and input_select(0) and  not input_select(1)) or
				(input(3) and input_select(0) and  input_select(1));
end architecture;