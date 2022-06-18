entity counterUpDown_4_bit is 
	port ( 	CLK, RESET, EN: in bit;
		counter: out bit_vector(3 downto 0);
		upDown : in bit );
end entity;

architecture behavioural of counterUpDown_4_bit is
	signal q_internal : bit_vector(3 downto 0) ;
	signal qn_internal: bit_vector(3 downto 0);
	signal d0, d1, d2, d3 : bit;
	signal flip_flop_clock : bit;

	component D_flip_flop is 
   		port(	Q : out bit;    
      			Clk :in bit;   
      			D :in  bit;
			Q_not : out bit;
			rst : in bit);
	end component;
		
  
	begin


	counterClock : process(CLK, EN)

		begin
			if (CLK = '1' and CLK'event ) then
				if EN = '1' then
					flip_flop_clock <= not flip_flop_clock;
				end if;
			end if;
	end process;

	clk0 :  D_flip_flop port map (	D => d0, 
					Clk =>  flip_flop_clock,
					Q => q_internal(0),
					Q_not => qn_internal(0),
					rst => RESET );

	clk1 :  D_flip_flop port map (	D => d1,
					Clk => flip_flop_clock,
					Q => q_internal(1),
					Q_not => qn_internal(1),
					rst => RESET );

	clk2 :  D_flip_flop port map (	D => d2 , 
					Clk => flip_flop_clock,
					Q => q_internal(2),
					Q_not => qn_internal(2),
					rst => RESET );

	clk3 :  D_flip_flop port map (	D => d3,
					Clk => flip_flop_clock,
					Q => q_internal(3),
					Q_not => qn_internal(3),
					rst => RESET );

	counterUpDown : process(upDown, q_internal, qn_internal,CLK )
		begin
			if upDown = '1' then
				d0 <= qn_internal(0);
				d1 <= q_internal(0) xor q_internal(1);
				d2 <= (q_internal(2) and qn_internal(0))or(q_internal(2)and qn_internal(1))or( qn_internal(2) and q_internal(1) and q_internal(0)); 
				d3 <= ( q_internal(3) and qn_internal(2)) or ( q_internal(3) and qn_internal(0)) or (q_internal(3) and qn_internal(1)) or (qn_internal(3) and q_internal(2) and q_internal(1) and q_internal(0));

				report "all signed";
			else 
				d0 <= qn_internal(0);
				d1 <= (qn_internal(1) and qn_internal(0)) or(q_internal(1) and q_internal(0));
				d2 <= ( q_internal(2) and q_internal(0)) or (q_internal(2) and q_internal(1)) or ( qn_internal(2)and qn_internal(1) and qn_internal(0));
				d3 <= (q_internal(3) and q_internal(0 )) or (q_internal(3) and q_internal(1)) or ( q_internal(3) and q_internal(2)) or ( qn_internal(3)and qn_internal(2) and qn_internal(1) and qn_internal(0));

			end if;
	end process;

		counter <= q_internal;

end architecture;
