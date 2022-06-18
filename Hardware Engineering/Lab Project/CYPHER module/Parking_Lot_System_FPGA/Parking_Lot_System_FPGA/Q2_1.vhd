library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity clock_divider is
	port (	CLK_main : in std_logic;				
		CLK_N: out std_logic_vector(7 downto 0);
		reset : in std_logic );	
end clock_divider;
  
architecture behavioural of clock_divider is
  	
	signal q_internal : std_logic_vector(7 downto 0) ;
	signal qn_internal: std_logic_vector(7 downto 0);

	component D_flip_flop is 
   		port(	Q : out std_logic;   
      			Clk :in std_logic;   
      			D :in  std_logic;
			Q_not : out std_logic;
			rst : in std_logic 
   		);
	end component;
  
	begin

		clk0 :  D_flip_flop port map (	D => qn_internal(0) ,
						Clk =>  CLK_main,
						Q => q_internal(0),
						Q_not => qn_internal(0),
						rst => reset);

		clk1 :  D_flip_flop port map (	D => qn_internal(1),
						Clk => q_internal(0),
						Q => q_internal(1),
						Q_not =>qn_internal(1),
						rst => reset );

		clk2 :  D_flip_flop port map (	D => qn_internal(2) , 
						Clk => q_internal(1),
						Q => q_internal(2),
						Q_not => qn_internal(2),
						rst => reset);

		clk3 :  D_flip_flop port map (	D => qn_internal(3),
						Clk => q_internal(2),
						Q => q_internal(3),
						Q_not => qn_internal(3),
						rst => reset);

		clk4 :  D_flip_flop port map (	D => qn_internal(4),
						Clk => q_internal(3),
						Q => q_internal(4),
						Q_not => qn_internal(4),
						rst => reset);

		clk5 :  D_flip_flop port map (	D => qn_internal(5),
						Clk => q_internal(4),
						Q => q_internal(5),
						Q_not => qn_internal(5),
						rst => reset);

		clk6 :  D_flip_flop port map (	D => qn_internal(6),
						Clk => q_internal(5),
						Q => q_internal(6),
						Q_not =>qn_internal(6),
						rst => reset);

		clk7 :  D_flip_flop port map (	D => qn_internal(7),
						Clk => q_internal(6),
						Q => q_internal(7),
						Q_not => qn_internal(7),
						rst => reset);



		
	CLK_N <= q_internal ;

end behavioural; 
