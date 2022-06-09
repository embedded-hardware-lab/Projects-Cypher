library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
  
entity clock_divider is
	port (	CLK_in : in bit;					-- master clock
		CLK_N: out bit_vector(7 downto 0));	-- output clock (8 variation)
end clock_divider;
  
architecture behavioural of clock_divider is
  	
	signal q_f0 : bit ;
	signal qn_f0 : bit;
	signal q_f1 : bit;
	signal qn_f1 : bit;
	signal q_f2 : bit;
	signal qn_f2 : bit;
	signal q_f3 : bit;
	signal qn_f3 : bit;
	signal q_f4 : bit;
	signal qn_f4 : bit;
	signal q_f5 : bit;
	signal qn_f5 : bit;
	signal q_f6 : bit;
	signal qn_f6 : bit;
	signal q_f7 : bit;
	signal qn_f7 : bit;

	component D_flip_flop is 
   		port(	Q : out bit;    
      			Clk :in bit;   
      			D :in  bit;
			Q_not : out bit 
   		);
	end component;
  
	begin

		d0 :  D_flip_flop port map (	D => qn_f0 ,
						Clk =>  CLK_in,
						Q => q_f0,
						Q_not => qn_f0);

		d1 :  D_flip_flop port map (	D => qn_f1,
						Clk => q_f0,
						Q => q_f1,
						Q_not =>qn_f1 );

		d2 :  D_flip_flop port map (	D => qn_f2 , 
						Clk => q_f1,
						Q => q_f2,
						Q_not => qn_f2);

		d3 :  D_flip_flop port map (	D => qn_f3,
						Clk => q_f2,
						Q => q_f3,
						Q_not => qn_f3);

		d4 :  D_flip_flop port map (	D => qn_f4,
						Clk => q_f3,
						Q => q_f4,
						Q_not => qn_f4);

		d5 :  D_flip_flop port map (	D => qn_f5,
						Clk => q_f4,
						Q => q_f5,
						Q_not => qn_f5);

		d6 :  D_flip_flop port map (	D => qn_f6,
						Clk => q_f5,
						Q => q_f6,
						Q_not =>qn_f6);

		d7 :  D_flip_flop port map (	D => qn_f7,
						Clk => q_f6,
						Q => q_f7,
						Q_not => qn_f7);



		
	CLK_N(0) <= q_f0 ;
	CLK_N(1) <= q_f1 ;
	CLK_N(2) <= q_f2 ;
	CLK_N(3) <= q_f3 ;
	CLK_N(4) <= q_f4 ;
	CLK_N(5) <= q_f5 ;
	CLK_N(6) <= q_f6 ;
	CLK_N(7) <= q_f7 ;
end behavioural; 
