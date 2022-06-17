entity D_flip_flop_TB is
end D_flip_flop_TB;

architecture data of D_flip_flop_TB is

	component D_flip_flop
      		port(	Q : out bit;    
      			Clk :in bit; 
			Q_not : out bit; 
      			D :in  bit;
			rst : in bit   
   		);
	end component;

	signal Q_TB: bit;
	signal Clk_TB: bit := '0';
	signal D_TB: bit:= '0';
	signal Q_not_TB: bit;
	signal rst_TB: bit;	

	begin
	DUT1: D_flip_flop port map(	Q=>Q_TB,
					Q_not => Q_not_TB,
					Clk=>Clk_TB,
					D=>D_TB,
					rst => rst_TB);

	clck:process(Clk_TB)
		begin
   			Clk_TB <= not Clk_TB after 0.5 ns;
	end process;


	input:process(Clk_TB)
		begin
   			D_TB <= not D_TB after 0.75 ns;
	end process;

end data;






