library ieee;
use ieee.std_logic_1164.all;

entity bitCounter is 
	port (rst, clk: in bit;
	      input: in bit_vector(1 downto 0);
 	      output: out bit_vector(1 downto 0));
end entity bitCounter;

architecture behavioral of bitCounter is
 	type state is (S0, S1, S2, S3); 
 	signal current_state, next_state: state;
	
begin

state_memory: process(clk, rst)
begin
 	if rst = '1' then
 	current_state <= S0;
 	elsif (clk = '1' and clk'event) then
 	current_state <= next_state;
end if;
end process;

input_counter: process(current_state, input)
begin
 	case current_state is
	when S0 => 	if input = "00" then
				next_state <= S0;
			elsif input = "01" then
				next_state <= S0;
			elsif input = "11" then
				next_state <= S1;
			elsif input = "10" then
				next_state <= S3;
			end if;

	when S1 => 	if input = "00" then
				next_state <= S1;
			elsif input = "01" then
				next_state <= S1;
			elsif input = "11" then
				next_state <= S2;
			elsif input = "10" then
				next_state <= S0;
			end if;

	when S2 => 	if input = "00" then
				next_state <= S2;
			elsif input = "01" then
				next_state <= S2;
			elsif input = "11" then
				next_state <= S3;
			elsif input = "10" then
				next_state <= S1;
			end if;

	when S3 => 	if input = "00" then
				next_state <= S3;
			elsif input = "01" then
				next_state <= S3;
			elsif input = "11" then
				next_state <= S0;
			elsif input = "10" then
				next_state <= S2;
			end if;
	
	end case;
end process;

output_comb: process(current_state, input)
begin
 		case current_state is
		when S0 => 	if input = "00" then
					output <= "00";
				elsif input = "01" then
					output <= "00";
				elsif input = "11" then
					output <= "01";
				elsif input = "10" then
					output <= "11";
				end if;

		when S1 => 	if input = "00" then
					output <= "01";
				elsif input = "01" then
					output <= "01";
				elsif input = "11" then
					output <= "10";
				elsif input = "10" then
					output <= "00";
				end if;

		when S2 => 	if input = "00" then
					output <= "10";
				elsif input = "01" then
					output <= "10";
				elsif input = "11" then
					output <= "11";
				elsif input = "10" then
					output <= "01";
				end if;

		when S3 => 	if input = "00" then
					output <= "11";
				elsif input = "01" then
					output <= "11";
				elsif input = "11" then
					output <= "00";
				elsif input = "10" then
					output <= "10";
				end if;	
 		end case;
	end process;

end architecture;

