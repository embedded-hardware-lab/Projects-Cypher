entity multiplexer_4_1_TB is
end entity;

architecture behavioural of multiplexer_4_1_TB is 

	signal input_TB : bit_vector(3 downto 0);
	signal output_TB : bit;
	signal input_select_TB : bit_vector(1 downto 0);

	component multiplexer_4_1 is
		port ( 	input : in bit_vector(3 downto 0);
			input_select : in bit_vector(1 downto 0);
			output : out bit);

	end component;

	begin

	mux1 : multiplexer_4_1 port map (	input => input_TB,
						input_select => input_select_TB,
						output => output_TB);
	
	selectTest : process(input_TB,input_select_TB)
		begin
		input_select_TB(0)<= not input_select_TB(0) after 0.5 ns;
		input_select_TB(1) <=not input_select_TB(1) after 1.0 ns;


	end process;

	inputTest : process(input_TB,input_select_TB)
		begin
		input_TB(0) <= not input_TB(0) after 0.3 ns;
		input_TB(1) <= not input_TB(1) after 0.6 ns;
		input_TB(2) <= not input_TB(2) after 0.9 ns;
		input_TB(3) <= not input_TB(3) after 1.2 ns;
	end process;
		
end architecture;










