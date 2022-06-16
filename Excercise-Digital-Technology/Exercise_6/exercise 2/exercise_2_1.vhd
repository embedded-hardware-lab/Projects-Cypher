

entity running_light_8_bit is
	port (	CLK : in bit;		
		RST : in bit;	
		EN : in bit;	
		LED_OUT: out bit_vector(7 downto 0)
	);	
end running_light_8_bit;

architecture behavioural of running_light_8_bit is

	signal clock_s : bit;
	
	component clock_divider is
		port (	CLK_main : in bit;				
			CLK_N: out bit_vector(7 downto 0);
			reset : in bit );	
	end component;	

	begin
		clockDevider1 : clock_divider port map(	CLK_main => clock_s,				
							CLK_N => LED_OUT,
							reset => RST );

		run : process ( EN, clock_s,  CLK)
			begin
				if ( EN = '1') then
					clock_s <= CLK;
				end if;
		end process;
end architecture;
  
