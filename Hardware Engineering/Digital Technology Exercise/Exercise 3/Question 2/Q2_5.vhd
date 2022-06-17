LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
entity Adder_display_TB IS
end Adder_display_TB;
 
architecture behavior OF Adder_display_TB IS
 
	component Adder_display
		port(	Aa : in bit_vector(3 downto 0); 
			Bb : in bit_vector(3 downto 0); 
			Ccin : in bit; 
			output : out bit_vector (6 downto 0));
	end component;
 
--Inputs
signal Aa_TB : bit_vector(3 downto 0) := (others => '0');
signal Bb_TB : bit_vector(3 downto 0) := (others => '0');
signal Ccin_TB : bit;

 
--Outputs
signal output_TB : bit_vector(6 downto 0);
 
begin
 
DUT1:Adder_display port map(	
				Aa=>Aa_TB,
				Bb=>Bb_TB,
				Ccin=>Ccin_TB,
				output=>output_TB);

end behavior;


			
