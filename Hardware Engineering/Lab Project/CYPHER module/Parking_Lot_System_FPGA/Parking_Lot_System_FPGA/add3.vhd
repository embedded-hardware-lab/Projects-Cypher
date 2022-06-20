entity add3 is
	port(	input	: in bit_vector(3 downto 0);
			output 	: out bit_vector(3 downto 0));
end entity;

architecture behavioural of add3 is

	signal fix_value : bit_vector(3 downto 0);

	component full_adder_4_bit is
		port(	A 	: in bit_vector(3 downto 0); 
				B 	: in bit_vector(3 downto 0); 
				Cin : in bit;
				S	: out bit_vector (3 downto 0);
				Cout: out bit );

	end component;


	begin 

		adder1 : full_adder_4_bit port map (	A => input, 
												B => fix_value,
												Cin => open, 
												S => output,
												Cout => open );
		valueB : process (fix_value, input) 
			if (input(3) or (input(2) and (input(1) or input(0)))) then fix_value <= 	"0011";
			else fix_value <= 	"0000";
			end if;
		end process;
		
end architecture;

