library ieee;
use ieee.std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity RAM_tb is 
end RAM_tb;

architecture behavioral of RAM_tb is
		
		signal CLK_tb:std_logic;
	 	signal WE_tb: std_logic;
		signal ADDR_tb: std_logic_vector(3 downto 0);
		signal DATA_IN_tb:std_logic_vector(3 downto 0);
		signal DATA_OUT_tb:std_logic_vector(3 downto 0);
		


component RAM is

	port( 	CLK :in std_logic;
	      	WE: in std_logic;
		ADDR: in std_logic_vector(3 downto 0);
		DATA_IN:in std_logic_vector(3 downto 0);
		DATA_OUT:out std_logic_vector(3 downto 0));


end component ;



		begin

		DUT1: RAM port map( 	CLK => CLK_tb,	
					ADDR => ADDR_tb, 
					WE => WE_tb,		
					DATA_IN => DATA_IN_tb,
					DATA_OUT => DATA_OUT_tb);

		clck : process(CLK_tb)
			begin
   				CLK_tb <= not CLK_tb after 0.5 ns;
		end process;


  		DATA_IN_tb <= "1000" after 0.5 ns;
		ADDR_tb <= "0100" after 0.9 ns;
		WE_tb <= '1';
		
		
		
end behavioral;



		
		
