library ieee;
use ieee.std_logic_1164.all;

entity bitCounter_TB is 
end bitCounter_TB;

architecture Behavioral of bitCounter_TB is
component bitCounter
	port (rst, clk: in bit;
	      input: in bit_vector(1 downto 0);
 	      output: out bit_vector(1 downto 0));
end component;
signal input_TB: bit_vector(1 downto 0);
signal output_TB: bit_vector(1 downto 0);
signal CLK_TB : bit;
signal rst_TB : bit;

begin
DUT1 : bitCounter port map (input=>input_TB,
			    CLK => CLK_TB, 
			    rst => rst_TB,
			    output=>output_TB);
clck : process(CLK_TB)
		begin
   			CLK_TB <= not CLK_TB after 0.5 ns;
	end process;

end Behavioral;
