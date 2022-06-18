entity running_light_8_bit is
	port (	CLK : in bit;		
		RST : in bit;	
		EN : in bit;	
		LED_OUT: out bit_vector(7 downto 0)
	);	
end running_light_8_bit;

architecture behavioural of running_light_8_bit is

	signal clock_s : bit;
	signal clock_s2 : bit_vector(7 downto 0);
	signal clock_s3 : bit_vector(7 downto 0);
	signal clock_s4 : bit_vector(7 downto 0);
	signal clock_s5 : bit_vector(7 downto 0);
	
	component clock_divider is
		port (	CLK_main : in bit;				
			CLK_N: out bit_vector(7 downto 0);
			reset : in bit );	
	end component;	

	begin
		clockDevider1 : clock_divider port map(	CLK_main => clock_s,				
							CLK_N => clock_s2,
							reset => RST );
		clockDevider2 : clock_divider port map(	CLK_main => clock_s2(7),				
							CLK_N => clock_s3,
							reset => RST );
		clockDevider3 : clock_divider port map(	CLK_main => clock_s3(7),				
							CLK_N => clock_s4,
							reset => RST );
		clockDevider4 : clock_divider port map(	CLK_main => clock_s4(7),				
							CLK_N => clock_s5,
							reset => RST );
		clockDevider5 : clock_divider port map(	CLK_main => clock_s5(7),				
							CLK_N => LED_OUT,
							reset => RST );
		
		runclk1 : process (CLK,EN, clock_s)
		begin
			if (CLK = '1' and CLK'event ) then
				if (EN = '1') then
					clock_s <= not clock_s;
				end if;
			end if;
		end process;
		

		
			
end architecture;
  
