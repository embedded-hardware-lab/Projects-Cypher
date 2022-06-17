entity counterUpDown_4_bit_TB is 
end entity;

architecture behavioural of counterUpDown_4_bit_TB is

	component counterUpDown_4_bit is 
		port ( 	CLK, RESET, EN: in bit;
			counter: out bit_vector(3 downto 0);
			upDown : in bit );
	end component;

	signal CLK_TB : bit;
	signal RESET_TB : bit;
	signal EN_TB :bit ;
	signal counter_TB: bit_vector(3 downto 0);
	signal upDown_TB : bit;

	begin

	counter1 : counterUpDown_4_bit port map( 	CLK => CLK_TB, 
							RESET => RESET_TB,
							EN => EN_TB,
							counter => counter_TB,
							upDown => upDown_TB);


	RESET_TB <= '0';
	EN_TB <= '1', '0' after 15 ns;
	upDown_TB <= '1' , '0' after 6 ns;  -- 1 for up

	
	clck : process(CLK_TB)
		begin
   			CLK_TB <= not CLK_TB after 0.5 ns;
	end process;

end architecture;

	
