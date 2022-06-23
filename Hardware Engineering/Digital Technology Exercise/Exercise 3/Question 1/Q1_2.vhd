

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_textio.all;



entity segment_LED_7_tb is
end segment_LED_7_tb;

architecture behavior of segment_LED_7_tb is

component segment_LED_7 is

		port(A,B,C :in std_logic;
			Fa,Fb,Fc,Fd,Fe,Ff,Fg: out std_logic);
end component;

signal A_tb,B_tb,C_tb: std_logic;
signal Fa_tb,Fb_tb,Fc_tb,Fd_tb,Fe_tb,Ff_tb,Fg_tb : std_logic;



begin


DUT1 : segment_LED_7 port map (A=>A_tb,B=>B_tb,C=>C_tb,Fa=>Fa_tb,Fb=>Fb_tb,Fc=>Fc_tb,Fd=>Fd_tb,Fe=>Fe_tb,Ff=>Ff_tb,Fg=>Fg_tb);



stim_proc : process

begin

A_tb <= '0';
B_tb <= '0';
C_tb <= '0';

wait for 200 ps;


A_tb <= '0';
B_tb <= '0';
C_tb <= '1';

wait for 200 ps;



A_tb <= '0';
B_tb <= '1';
C_tb <= '0';

wait for 200 ps;


A_tb <= '0';
B_tb <= '1';
C_tb <= '1';

wait for 200 ps;


A_tb <= '1';
B_tb <= '0';
C_tb <= '0';

wait for 200 ps;


A_tb <= '1';
B_tb <= '0';
C_tb <= '1';

wait for 200 ps;


A_tb <= '1';
B_tb <= '1';
C_tb <= '0';

wait for 200 ps;


A_tb <= '1';
B_tb <= '1';
C_tb <= '1';

wait for 200 ps;
 
end process;

end behavior;