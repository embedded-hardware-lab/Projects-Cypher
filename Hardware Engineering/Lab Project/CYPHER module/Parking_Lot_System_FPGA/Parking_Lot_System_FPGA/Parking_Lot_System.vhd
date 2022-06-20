library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity parkingLotSystem is
 	port (	rst				: in std_logic;
			clk				: in std_logic;
			input 			: in std_logic_vector(3 downto 0); 
			ready 			: in std_logic;
			led_red 		: out std_logic;
			led_green 		: out std_logic;
			gate_close 		: out std_logic;
			gate_open 		: out std_logic;
			
			digit3port		: out bit_vector(6 downto 0);
			digit2port 		: out bit_vector(6 downto 0);
			digit1port 		: out bit_vector(6 downto 0);
			single_port 	: out bit_vector(6 downto 0);
			sel_single_port : out bit_vector(3 downto 0)
		);
end entity parkingLotSystem;


architecture behavioral of parkingLotSystem is
 	type state is ( idle, display, full);
 	signal current_state, next_state	: state;				
	signal counter_s		: std_logic_vector(7 downto 0);
	signal counter_s_bit	: bit_vector(7 downto 0);
	signal led_s, gate_s 	: std_logic 	:= '1';  
	signal space_state 		: std_logic;
	
	signal clockScalers : std_logic_vector(30 downto 0);
	signal counterClk : std_logic;
	signal bcd_full : bit_vector(11 downto 0);
	signal digit3,digit2,digit1 : bit_vector(6 downto 0);
	
	
	component bcd_8_bit is
    		port (	input_8_bit	: in  bit_vector (7 downto 0);
					bcd			: out bit_vector (11 downto 0)
			);
	end component;

	component LED_7segment is
		port( 	input 	: in bit_vector (3 downto 0);
				LED_out : out bit_vector (6 downto 0)
			);
	end component;

	component bcd_shifter is
		port(	rst 	: in std_logic; 
				clk 	: in std_logic; 
				bcd1 	: in bit_vector (6 downto 0);
				bcd2 	: in bit_vector (6 downto 0);
				bcd3 	: in bit_vector (6 downto 0);
				bcd_out : out bit_vector (6 downto 0);
				sel 	: out bit_vector (3 downto 0)
			);
	end component ;
	
	begin
		converter1 : bcd_8_bit port map ( 	input_8_bit => counter_s_bit,
											bcd => bcd_full );

		digit3c : LED_7segment port map (	input => bcd_full(11 downto 8),
											LED_out => digit3);
		digit2c : LED_7segment port map (	input => bcd_full(7 downto 4),
											LED_out => digit2);
		digit1c : LED_7segment port map (	input => bcd_full(3 downto 0),
											LED_out => digit1);
							


		shifter1 : bcd_shifter port map(	rst => rst,
											clk => clockScalers(18),
											bcd1 => digit1,
											bcd2 => digit2,
											bcd3 => digit3,
											bcd_out => single_port,
											sel => sel_single_port);
											
								

		state_memory: process(clk, rst, next_state, current_state)
			begin
				if rst = '1' then
					current_state <= idle;
				elsif (clk = '1' and clk'event) then
					current_state <= next_state;
				end if;
		end process;
			
		clockDivider : process (clk, rst) 
			begin
				if (rst = '1') then
					clockScalers <= (others=>'0');
				elsif (clk'event and clk = '1') then
					clockScalers <= clockScalers + '1';
				end if; 
		end process;

		stateInput: process(clk, current_state, input,space_state, next_state, ready)
			begin
			
			if (clk = '1' and clk'event) then
				case current_state is

					when idle => 	if input = "0001" then	next_state <= display;
									elsif input = "0010" then next_state <= display;
									else next_state <= idle;
									end if;

					when display =>	if (space_state = '1' and ready = '1') then next_state <= idle;
									elsif (space_state = '0' and ready = '1') then next_state <= full;
									else	next_state <= display;
									end if;
		
					when full => 	if input = "0010" then	next_state <= display;
									else next_state <= full;
									end if;
				end case;
			end if;
		end process;
		

		indicatorProcess : process(clk, current_state, led_s)
			begin
				if (clk = '1' and clk'event) then
					case current_state is
						when idle => led_s <= '1';	
			
						when display =>	led_s <= '1';	

						when full => led_s <= '0';	
					end case;
				end if;
		end process;
		
		gateProcess : process(clk, current_state, gate_s)
			begin
				if (clk = '1' and clk'event) then
						case current_state is
							when idle => gate_s <= '1';	
			
							when display =>	gate_s <= '1';	

							when full => gate_s <= '0';	
						end case;
				end if;
		end process;

		carCounter : process(current_state, input, counterClk, counter_s, rst)
			variable count_mem : std_logic_vector(7 downto 0);
			begin
				
				if (rst = '1') then count_mem := "00000000";
				elsif  (counterClk = '0' and counterClk'event ) then 

					case current_state is
						when idle => 		if (input="0001")  then	count_mem := count_mem + '1' ;   -- counting up
											elsif (input="0010")  then	count_mem := count_mem - '1' ;   -- counting down
											else count_mem := count_mem;
											end if;
						when display =>		count_mem := count_mem ;

						when full => 		if input="0010"  then count_mem := count_mem - '1';   -- counting down
											else count_mem := count_mem;
											end if;
					end case;
				end if;
				counter_s<= count_mem;
		end process;
		
		space_checker : process(counter_s, clk, space_state)
			begin
			if (clk = '1' and clk'event) then
				if counter_s < "11111111"  then space_state <= '1';
				else space_state <= '0';
				end if;
			end if;
		end process;
		
		
		counter_s_bit <= to_bitvector(counter_s);
		gate_open <= gate_s;
		gate_close <= not gate_s;
		led_green <= led_s;
		led_red <= not led_s;
		
		counterClk <= clockScalers(0);
		
		digit1port <= digit1;
		digit2port <= digit2;
		digit3port <= digit3;

end architecture;
