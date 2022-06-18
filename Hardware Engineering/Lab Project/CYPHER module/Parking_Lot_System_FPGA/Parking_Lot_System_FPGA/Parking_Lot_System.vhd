library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity parkingLotSystem is
 	port (	rst, clk: in std_logic;
		input : in std_logic_vector(3 downto 0); 
		
		counter : out std_logic_vector(7 downto 0); 
		led_red : out std_logic;
		gate_close : out std_logic;
		led_green : out std_logic;
		gate_open : out std_logic;
		ready : in std_logic;
		
		digit3port : out bit_vector(6 downto 0);
		digit2port : out bit_vector(6 downto 0);
		digit1port : out bit_vector(6 downto 0);
		single_port : out bit_vector(6 downto 0);
		sel_single_port : out bit_vector(3 downto 0)
		);
		
end entity parkingLotSystem;


architecture behavioral of parkingLotSystem is
 	type state is (idle, display, full);
 	signal current_state, next_state: state;				
	signal counter_s: std_logic_vector(7 downto 0):= x"00";
	signal counter_s_bit: bit_vector(7 downto 0);
	signal led_s, gate_s : std_logic := '1';  
	signal space_state : std_logic;
	
	signal clk2 : std_logic_vector (7 downto 0);
	signal clk3 : std_logic_vector (7 downto 0);
	signal clk4 : std_logic_vector (7 downto 0);
	signal clk5 : std_logic_vector (7 downto 0);
	signal clk6 : std_logic_vector (7 downto 0);

	signal bcd_3 : bit_vector(3 downto 0);
	signal bcd_2 : bit_vector(3 downto 0);
	signal bcd_1 : bit_vector(3 downto 0);
	signal bcd_full : bit_vector(11 downto 0);

	signal digit3port_s :  bit_vector(6 downto 0);
	signal digit2port_s :  bit_vector(6 downto 0);
	signal digit1port_S :  bit_vector(6 downto 0);


	component bcd_8_bit is
    		port (	input_8_bit:    in  bit_vector (7 downto 0);
        		bcd:    out bit_vector (11 downto 0)
    	);
	end component;

	component LED_7segment is
	Port ( 	input : in bit_vector (3 downto 0);
		LED_out : out bit_vector (6 downto 0));
	end component;

	component bcd_shifter is
	port (		rst : in std_logic; 
			clk : in std_logic; 
				bcd1 : in bit_vector (6 downto 0);
			bcd2 : in bit_vector (6 downto 0);
			bcd3 : in bit_vector (6 downto 0);
			bcd_out : out bit_vector (6 downto 0);
			sel : out bit_vector (3 downto 0));
	end component ;
	
	component clock_divider is
		port (	CLK_main : in std_logic;				
			CLK_N: out std_logic_vector(7 downto 0);
			reset : in std_logic );	
	end component;


	begin
		converter1 : bcd_8_bit port map ( 	input_8_bit => counter_s_bit,
							bcd => bcd_full );

		digit3 : LED_7segment port map (	input => bcd_3,
							LED_out => digit3port_s);
		digit2 : LED_7segment port map (	input => bcd_2,
							LED_out => digit2port_s);
		digit1 : LED_7segment port map (	input => bcd_1,
							LED_out => digit1port_S);
							
		clkDv1 : clock_divider port map(	CLK_main => clk,				
													CLK_N => clk2,
													reset => rst );	
													
		clkDv2 : clock_divider port map(	CLK_main => clk2(7),				
													CLK_N => clk3,
													reset => rst );
		clkDv3 : clock_divider port map(	CLK_main => clk3(7),				
													CLK_N => clk4,
													reset => rst );
													
		clkDv4 : clock_divider port map(	CLK_main => clk4(7),				
													CLK_N => clk5,
													reset => rst );


		shifter1 : bcd_shifter port map (	rst => rst,
							clk => clk4(2),
							bcd1 => digit1port_s,
							bcd2 => digit1port_s,
							bcd3 => digit1port_s,
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


		sysInput: process(current_state, input,space_state, next_state, ready)
		begin
 			case current_state is
				when idle => 	if input = "0001" then
							next_state <= display;
						elsif input = "0010" then
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

	
				when full => 	if input = "0010" then
							next_state <= display;
						else 
							next_state <= full;
						end if;
 			end case;
		end process;



		ledProcess : process(current_state, led_s)
		begin
			case current_state is
				when idle => led_s <= '1';	
	
				when display =>	led_s <= '1';	

				when full => led_s <= '0';	
			end case;
		end process;
		gateProcess : process(current_state, gate_s)
			begin
				case current_state is
					when idle => gate_s <= '1';	
	
					when display =>	gate_s <= '1';	

					when full => gate_s <= '0';	
				end case;
		end process;

		carCounter : process(current_state, input, clk, counter_s)
			begin
				if  (clk = '0' and clk'event ) then 

					case current_state is
						when idle => 	if (rst = '1') then counter_s <= "00000000";
											elsif (input="0001")  then		-- car enter
												counter_s <= counter_s + '1' ;   -- counting up
											elsif (input="0010")  then		-- car leave
												counter_s <= counter_s - '1' ;   -- counting down
											end if;
						when display =>	if (rst = '1') then counter_s <= "00000000";
												else counter_s <= counter_s ;	
												end if;

						when full => 	if (rst = '1') then counter_s <= "00000000";
											elsif input="0010"  then		-- car leave
												counter_s <= counter_s - '1';   -- counting down
											end if;
				end case;		

				end if;

		end process;
		
		space_checker : process(counter_s, space_state)
			begin
			if counter_s < "1101"  then
				space_state <= '1';
			else 
				space_state <= '0';
			end if;
			
		end process;
		

		counter_s_bit <= to_bitvector(counter_s);
		counter <= counter_s;
		gate_open <= gate_s;
		led_green <= led_s;
		gate_close <= not gate_s;
		led_red <= not led_s;

		bcd_3 <= bcd_full(11 downto 8);
		bcd_2 <= bcd_full(7 downto 4);
		bcd_1 <=  bcd_full(3 downto 0);

		digit3port <= digit3port_s ;
		digit2port <=digit2port_s ;
		digit1port <= digit1port_s ;

end architecture;
