
entity counter is
	port (	CLK : in bit;				
		SEG : out bit_vector(6 downto 0);
		EN  : in bit ;
		UpDown  : in bit ;
		RST  : in bit ;	
		sel : out bit );
end counter;
  
architecture behavioural of counter is
  	
	signal Q_s: bit_vector(3 downto 0) ;
	signal counter_clock : bit_vector(7 downto 0) ;
	signal counter_clock2 : bit_vector(7 downto 0) ;
	signal counter_clock3 : bit_vector(7 downto 0) ;

	component counter_4_bit is 
		port ( 	CLK, RESET, EN: in bit;
			counter: out bit_vector(3 downto 0));
	end component;

	component counterUpDown_4_bit is 
		port ( 	CLK, RESET, EN: in bit;
			counter: out bit_vector(3 downto 0);
			upDown : in bit );
	end component;

	component LED_7segment is
		Port ( 	input : in bit_vector (3 downto 0);
			LED_out : out bit_vector (6 downto 0));
	end component;

	component clock_divider is
		port (	CLK_main : in bit;				
			CLK_N: out bit_vector(7 downto 0);
			reset : in bit );	
	end component;

	
  
	begin

	clockDivider1 : clock_divider port map(	CLK_main => CLK,			
						CLK_N => counter_clock,
						reset => RST );	
						
	clockDivider2 : clock_divider port map(	CLK_main => counter_clock(7),			
						CLK_N => counter_clock2,
						reset => RST );	
						
	clockDivider3 : clock_divider port map(	CLK_main => counter_clock2(7),			
						CLK_N => counter_clock3,
						reset => RST );

	counter1 : counterUpDown_4_bit port map (	CLK => counter_clock3(7), 
						RESET => RST, 
						EN => EN,
						counter => Q_s,
						upDown => UpDown); 

	display1 : LED_7segment port map (	input => Q_s,
						LED_out => SEG);

	sel <= '0' ;
end behavioural; 


