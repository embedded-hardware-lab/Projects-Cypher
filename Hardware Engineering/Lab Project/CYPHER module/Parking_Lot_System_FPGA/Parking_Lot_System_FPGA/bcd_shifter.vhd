
entity bcd_shifter is
	port (	rst 	: in std_logic; 
			clk 	: in std_logic; 
			bcd1 	: in bit_vector (6 downto 0);
			bcd2 	: in bit_vector (6 downto 0);
			bcd3 	: in bit_vector (6 downto 0);
			bcd_out : out bit_vector (6 downto 0);
			sel 	: out bit_vector (3 downto 0));
end entity ;


architecture behavioral of bcd_shifter is

	type state is (S0, S1, S2); 
	signal current_state, next_state: state;
	signal An : bit_vector(3 downto 0);	

	begin
		state_memory: process(clk, rst)
			begin
				if rst = '1' then	
					current_state <= S0;
				elsif (clk = '1' and clk'event) then
					current_state <= next_state;
				end if;
		end process;
		chooseInput : process(clk,current_state, bcd1,bcd2,bcd3,An)
		begin
			if (clk = '0' and clk'event) then
				case current_state is
					when S0 => 	An <= "1110";	
					when S1 => 	An <= "1101";
					when S2 => 	An <= "1011";
				end case;
			end if;
		end process;

		nextState : process (clk)
		begin
			if (clk = '0' and clk'event) then
			case current_state is
				when S0 => 	next_state <= S1;	
				when S1 => 	next_state <= S2;
				when S2 => 	next_state <= S0;
			end case;
			end if;
		end process;

		output : process(clk,current_state, bcd1,bcd2,bcd3,An)
		begin
			if (clk = '0' and clk'event) then
				case current_state is
					when S0 => 	bcd_out <= bcd1;		
					when S1 => 	bcd_out <= bcd2;
					when S2 => 	bcd_out <= bcd3;
				end case;
			end if;
		end process;

		sel <= An;

end architecture;
