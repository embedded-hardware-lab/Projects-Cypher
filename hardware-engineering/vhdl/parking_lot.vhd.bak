Library IEEE ;
USE IEEE.Std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity parkingLotSystem is
 	port (	rst, clk: in std_logic;
		input : in std_logic_vector(7 downto 0); 
		
		counter : out std_logic_vector(7 downto 0); 
		gate, led : out std_logic;
		ready : in std_logic);
end entity parkingLotSystem;


architecture behavioral of parkingLotSystem is
 	type state is (idle, display, full);
 	signal current_state, next_state: state;				
	signal counter_s: std_logic_vector(7 downto 0):= x"00";
	signal led_s, gate_s : std_logic := '1';  
	signal space_state : std_logic;





	begin
		state_memory: process(clk, rst)
 		begin
 			if rst = '1' then
 				current_state <= idle;
 			elsif (clk = '1' and clk'event) then
 				current_state <= next_state;
 			end if;
 		end process;


		sysInput: process(current_state, input,space_state)
		begin
 			case current_state is
				when idle => 	if input = "00000001" then
							next_state <= display;
						elsif input = "00000010" then
							next_state <= display;
						else 
							next_state <= idle;
						end if;






				when display => if (space_state = '1' and ready = '1') then
							next_state <= idle;
						elsif (space_state = '0' and ready = '1') then
							next_state <= full;
						else
							next_state <= display;
						end if;

	
				when full => 	if input = "00000010" then
							next_state <= display;
						else 
							next_state <= full;
						end if;
 			end case;
		end process;



		ledProcess : process(current_state)
		begin
			case current_state is
				when idle => led_s <= '1';	
	
				when display =>	led_s <= '1';	

				when full => led_s <= '0';	
			end case;
		end process;
		gateProcess : process(current_state)
			begin
				case current_state is
					when idle => gate_s <= '1';	
	
					when display =>	gate_s <= '1';	

					when full => gate_s <= '0';	
				end case;
		end process;

		carCounter : process(current_state, input, clk)
			begin
				case current_state is
					when idle => 	if ( input="00000001" and clk = '0' and clk'event  )  then		-- car enter
								counter_s <= counter_s + '1' ;   -- counting up
							elsif (input="00000010"  and clk = '0' and clk'event  )  then		-- car leave
								counter_s <= counter_s - '1' ;   -- counting down
							end if;
					when display =>	counter_s <= counter_s ;	

					when full => 	if input="00000010"  then		-- car leave
								counter_s <= counter_s - '1' after 100 ps;   -- counting down
							end if;
				end case;
		end process;
		
		space_checker : process(counter_s)
			begin
			if counter_s < "00001101"  then
				space_state <= '1';
			else 
				space_state <= '0';
			end if;
			
		end process;
		
		counter <= counter_s;
		gate <= gate_s;
		led <= led_s;
end architecture;



