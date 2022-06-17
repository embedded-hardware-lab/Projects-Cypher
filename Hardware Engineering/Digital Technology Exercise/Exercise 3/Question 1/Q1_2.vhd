LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
entity LED_7Segment_TB IS
end LED_7Segment_TB;
 
architecture behavior OF LED_7Segment_TB IS
 
	component LED_7Segment
		port(input : in std_logic_vector(3 downto 0);
		      LED_out : out std_logic_vector(6 downto 0));
	end component;
 
--Inputs
signal input_TB : std_logic_vector(3 downto 0) := (others => '0');
 
--Outputs
signal LED_out_TB : std_logic_vector(6 downto 0);
 
begin
 
DUT1:LED_7Segment port map(

			input => input_TB,
			LED_out => LED_out_TB);

--Stimulus process
stim_proc: process
begin
 
input_TB <= "0000";
wait for 150 ns;
input_TB <= "0001";
wait for 150 ns;
input_TB <= "0010";
wait for 150 ns;
input_TB <= "0011";
wait for 150 ns;
input_TB <= "0100";
wait for 150 ns;
input_TB <= "0101";
wait for 150 ns;
input_TB <= "0110";
wait for 150 ns;
input_TB <= "0111";
wait for 150 ns;
input_TB <= "1000";
wait for 150 ns;
input_TB <= "1001";
wait for 150 ns;
end process;
 

 
end;
