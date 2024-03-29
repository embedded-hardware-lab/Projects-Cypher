entity D_flip_flop_8_bit is
	port ( 	D : in bit_vector(7 downto 0) ;
		Clock : in bit ;
		Q : out bit_vector(7 downto 0);
		reset : in bit );

end D_flip_flop_8_bit ;

architecture behavioral of D_flip_flop_8_bit is

	component D_flip_flop
		port(
      			Q : out bit; 
			Q_not : out bit;    
      			Clk :in bit;   
      			D :in  bit;
			rst : in bit     
   		);
	end component;
		
	begin
	bit1 : D_flip_flop port map (Q=>Q(0), Clk=>Clock, D=>D(0), rst=>reset);
	bit2 : D_flip_flop port map (Q=>Q(1), Clk=>Clock, D=>D(1), rst=>reset);
	bit3 : D_flip_flop port map (Q=>Q(2), Clk=>Clock, D=>D(2), rst=>reset);
	bit4 : D_flip_flop port map (Q=>Q(3), Clk=>Clock, D=>D(3), rst=>reset);
	bit5 : D_flip_flop port map (Q=>Q(4), Clk=>Clock, D=>D(4), rst=>reset);
	bit6 : D_flip_flop port map (Q=>Q(5), Clk=>Clock, D=>D(5), rst=>reset);
	bit7 : D_flip_flop port map (Q=>Q(6), Clk=>Clock, D=>D(6), rst=>reset);
	bit8 : D_flip_flop port map (Q=>Q(7), Clk=>Clock, D=>D(7), rst=>reset);
	

end behavioral ;