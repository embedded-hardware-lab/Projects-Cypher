entity clock_divider_TB is
end clock_divider_TB;

architecture behavioural of clock_divider_TB is

	signal CLK_main_TB : bit;	
	signal CLK_N_TB : bit_vector(7 downto 0);
	signal reset_TB : bit;

	component clock_divider is
		port (	CLK_main : in bit;					
			CLK_N : out bit_vector(7 downto 0);
			reset : in bit);	
	end component;

	begin
	
		divider1 : clock_divider port map (	CLK_main => CLK_main_TB,				
							CLK_N => CLK_N_TB,
							reset => reset_TB );	
	
		clck : process(CLK_main_TB)
			begin
   				CLK_main_TB <= not CLK_main_TB after 0.5 ns;
		end process;

end behavioural;


