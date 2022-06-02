Library IEEE ;
USE IEEE.Std_logic_1164.all;

entity parkingLot is
	port(rst, clk : in std_logic; input : in std_logic_vector(7 downto 0); output, counter : out std_logic_vector(7 downto 0); gate, led : out std_logic);
end entity parkingLot;

architecture behaviour of parkingLot is
	type state is (idle, display, full);
	signal current_state, next_state:state;
	signal counter_s: std_logic_vector(7 downto 0);

	begin

	counter <= counter_s;
	state_memory: process(rst, clk)
	begin
		if rst = '1' then
			current_state <= idle;
		elsif (clk ='1' and  clk'event) then
			current_state <= next_state;
		end if;
	end process;


	systemInput: process(current_state,input)
		begin
			case current_state is
				when idle=>	if input="00000011" then
						next_state<=idle;
						else next_state <= display;
						end if;

				when display =>	if input="00000100"then
						next_state<=full;
						elsif (input<="00000101") then
						next_state <= idle;
						else next_state <= display;
 						end if;

				
				when full =>	if input="00000111"then
						next_state<=full;
						elsif (input<="00000010") then
						next_state <= display;
 						end if;
			end case;
		end process;

	systemOutput : process(current_state, input)
		begin
			case current_state is 
				when idle => 	if input="00000011" then 
							led <= '1';
					     	elsif input = "00000001" then
							counter_s<= counter_s  and "00000001"; 
						elsif input = "00000010" then
							counter_s<= not( not counter_s  and "00000001");
						end if;

				when display =>	if input="00000100" then
					 		gate<= '1';
						elsif input = "00000101" then
					 		gate<= '0';
						end if;
				
				when full =>	if input="00000111"then
						led<='0';
						elsif input = "00000010" then
							counter_s<= not( not counter_s  and "00000001");
 						end if;
			end case;
		end process;

end architecture; 






