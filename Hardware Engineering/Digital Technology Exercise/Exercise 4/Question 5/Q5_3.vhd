entity counterUpDown_4_bit_display is 
	port ( 	CLK_in, RESET_in, EN_in: in bit;
		upDown_in : in bit ;
		LED_out : out bit_vector(6 downto 0));
end entity;

architecture behavioural of counterUpDown_4_bit_display is
	signal counter_output : bit_vector(3 downto 0) ;
	
	component counterUpDown_4_bit is 
		port ( 	CLK, RESET, EN: in bit;
			counter: out bit_vector(3 downto 0);
			upDown : in bit );
	end component;

	component LED_7segment is
		Port ( 	input : in bit_vector (3 downto 0);
			LED_out : out bit_vector (6 downto 0));
	end component;
	

  
	begin

	counter1 : counterUpDown_4_bit port map ( 	CLK => CLK_in, 
							RESET => RESET_in, 
							EN => EN_in,
							counter => counter_output,
							upDown => upDown_in
						);

	display1 :  LED_7segment port map ( 	input => counter_output, 
						LED_out => LED_out );

end architecture;