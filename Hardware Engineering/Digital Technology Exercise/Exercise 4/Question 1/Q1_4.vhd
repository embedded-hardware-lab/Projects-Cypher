entity shift_register_8_bit is
	port ( 	D_serial : in bit ;
		Clock : in bit ;
		Q_parallel : out bit_vector(7 downto 0);
		reset : in bit ) ;
end shift_register_8_bit ;

architecture behavioral of shift_register_8_bit is

	signal q_internal : bit_vector(7 downto 0);

	component D_flip_flop
		port(
      			Q : out bit; 
			Q_not : out bit;    
      			Clk :in bit;   
      			D :in  bit ;
			rst : in bit   
   		);
	end component;
		
	begin
	bit7 : D_flip_flop port map (Q=>q_internal(7), Clk=>Clock, D=>D_serial, rst=>reset);
	bit6 : D_flip_flop port map (Q=>q_internal(6), Clk=>Clock, D=>q_internal(7), rst=>reset);
	bit5 : D_flip_flop port map (Q=>q_internal(5), Clk=>Clock, D=>q_internal(6), rst=>reset);
	bit4 : D_flip_flop port map (Q=>q_internal(4), Clk=>Clock, D=>q_internal(5), rst=>reset);
	bit3 : D_flip_flop port map (Q=>q_internal(3), Clk=>Clock, D=>q_internal(4), rst=>reset);
	bit2 : D_flip_flop port map (Q=>q_internal(2), Clk=>Clock, D=>q_internal(3), rst=>reset);
	bit1 : D_flip_flop port map (Q=>q_internal(1), Clk=>Clock, D=>q_internal(2), rst=>reset);
	bit0 : D_flip_flop port map (Q=>q_internal(0), Clk=>Clock, D=>q_internal(1), rst=>reset);
	
	Q_parallel <= q_internal;
	

end behavioral ;