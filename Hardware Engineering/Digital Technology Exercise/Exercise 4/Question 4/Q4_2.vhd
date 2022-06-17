
entity counter_4_bit_TB is 
end entity;

architecture behavioural of counter_4_bit_TB is

	component counter_4_bit is 
		port ( 	CLK, RESET, EN: in bit;
			counter: out bit_vector(3 downto 0));
	end component;

	signal CLK_TB, RESET_TB, EN_TB:  bit;
	signal counter_TB:  bit_vector(3 downto 0);

	begin 
	
	counter1 : counter_4_bit port map( 	CLK => CLK_TB, 
						RESET => RESET_TB, 
						EN => EN_TB,
						counter => counter_TB);

	EN_TB <= '1' after 2 ns;
	RESET_TB <= '1' after 20 ns;
	
	clck : process(CLK_TB)
		begin
   			CLK_TB <= not CLK_TB after 0.5 ns;
	end process;

	





end architecture;