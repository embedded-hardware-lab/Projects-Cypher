-- sequencial statements
entity multiplexer_4_1_s is
	port ( 	input : in bit_vector(3 downto 0);
		input_select : in bit_vector(1 downto 0);
		output : out bit);

end entity;

architecture behavioural of multiplexer_4_1_s is
	begin
		with (input_select) select
		output <= 	input(0)  when "00",
				input(1)  when "01",
				input(2)  when "10",
				input(3)  when "11";
end architecture;