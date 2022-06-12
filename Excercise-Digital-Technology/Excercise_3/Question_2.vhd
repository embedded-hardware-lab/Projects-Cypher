

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
entity Adder_display is
	Port ( 	Aa : in bit_vector(3 downto 0); 
		Bb : in bit_vector(3 downto 0); 
		Ccin : in bit; 
		output : out bit_vector (6 downto 0));
end Adder_display ;
 
architecture Behavioral of Adder_display is 

	signal c0 : bit_vector(3 downto 0);
	

	component full_adder_4_bit
		port(	A,B : in bit_vector (3 downto 0);
			Cin : in bit;
			S : out bit_vector (3 downto 0);
			Cout : out bit);
	end component;
	component LED_7segment
		port(	input : in bit_vector(3 downto 0);
			LED_out : out bit_vector (6 downto 0));
	end component;

begin
 U1: full_adder_4_bit port map (A=>Aa, B=>Bb, Cin=>Ccin, S=>c0);

 U2: LED_7segment port map (input=>c0, LED_out=>output);





 
	

end Behavioral;
