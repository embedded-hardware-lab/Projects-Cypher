library ieee;
use ieee.std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity ROM_tb is 
end ROM_tb;

architecture behavioral of ROM_tb is
		
		signal CLK_tb:std_logic;
	        signal ADDR_tb: std_logic_vector(3 downto 0);
		signal DATA_OUT_tb:std_logic;
		


component ROM is 
	port( 	CLK:in std_logic;
		ADDR: in std_logic_vector(3 downto 0);
		DATA_OUT:out std_logic);
end component;



		begin

		DUT1: ROM port map( 	CLK => CLK_tb,	
					ADDR => ADDR_tb, 
					DATA_OUT => DATA_OUT_tb);

		clck : process(CLK_tb)
			begin
   				CLK_tb <= not CLK_tb after 0.5 ns;

		end process;

		
		stim_process:process
		
		
		begin
			
		wait for 100 ps; 
		  ADDR_tb <= "0000" ;
		 wait for 200 ps; 
		  ADDR_tb <= "0001" ;
		  wait for 300 ps; 
		  ADDR_tb <= "0010" ;
		 wait for 400 ps; 
		  ADDR_tb <= "0011" ;
 		wait for 500 ps; 
		  ADDR_tb <= "0100" ;
 		wait for 600 ps; 
		  ADDR_tb <= "0101";
 		wait for 700 ps; 
		  ADDR_tb <= "0110" ;
 		wait for 800 ps; 
		  ADDR_tb <= "0111" ;
 		wait for 900 ps; 
		  ADDR_tb <= "1001" ;
		 wait for 1000 ps; 
		  ADDR_tb <= "1010" ;
		wait for 1100 ps; 
		  ADDR_tb <= "1011" ;
 		wait for 1200 ps; 
		  ADDR_tb <= "1100"; 
		 wait for 1300 ps; 
		  ADDR_tb <= "1101" ;
 		wait for 1400 ps; 
		  ADDR_tb <= "1110";
 		wait for 1500 ps; 
		  ADDR_tb <= "1111" ;
 

		
  
		
		
		
		end process;
		
		
		
end behavioral;

