entity counterUpDown_4_bit_display is 
	port ( 	CLK_in, RESET_in, EN_in: in bit;
		upDown_in : in bit );
end entity;

architecture behavioural of counterUpDown_4_bit_display is
	signal counter_output : bit_vector(3 downto 0) ;
	
	component counterUpDown_4_bit is 
		port ( 	CLK, RESET, EN: in bit;
			counter: out bit_vector(3 downto 0);
			upDown : in bit );
	end component;

	component counterUpDown_4_bit is    -------ghghjkdfhgkdjfhgdjfsgkdjfsg
		port ( 	CLK, RESET, EN: in bit;
			counter: out bit_vector(3 downto 0);
			upDown : in bit );
	end component;
	

  
	begin

	counter1 : counterUpDown_4_bit port map ( 	CLK => CLK_in, 
							RESET => RESET_in, 
							EN => EN_in,
							counter => counter_output,
							upDown => upDown_in
						);

	display1 :  port map ( 	CLK => CLK_in,   -----fgfhgjdfshgjkdsfhgjdfshgjsdfhgkjdfg
							
						);

end architecture;