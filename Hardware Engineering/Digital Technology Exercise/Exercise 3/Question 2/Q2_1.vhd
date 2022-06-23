

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
entity Adder_display is
	Port ( 	Aa : in std_logic_vector(3 downto 0); 
		Bb : in std_logic_vector(3 downto 0); 
		Ccin : in bit; 
		output : out std_logic_vector (6 downto 0));
end Adder_display ;
 
architecture Behavioral of Adder_display is 

	signal c0 : std_logic_vector(3 downto 0);
	

	component full_adder_4_bit
		port(	A,B : in std_logic_vector (3 downto 0);
			Cin : in bit;
			S : out std_logic_vector (3 downto 0);
			Cout : out bit);
	end component;
	component segment_LED_7
		port(A,B,C :in std_logic;
			Fa,Fb,Fc,Fd,Fe,Ff,Fg: out std_logic);
	end component;

begin
 U1: full_adder_4_bit port map (A=>Aa, B=>Bb, Cin=>Ccin, S=>c0);



 U2: segment_LED_7 port map (A=>c0(0),B=>c0(1),C=>c0(2),Fa=>output(0),Fb=>output(1),Fc=>output(2),
				Fd=>output(3),Fe=>output(4),Ff=>output(5),
				Fg=>output(6) );





 
	

end Behavioral;
