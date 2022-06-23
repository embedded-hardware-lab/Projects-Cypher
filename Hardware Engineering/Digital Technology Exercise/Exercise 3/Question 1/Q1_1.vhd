
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_textio.all;

entity segment_LED_7 is

		port(A,B,C :in std_logic;
			Fa,Fb,Fc,Fd,Fe,Ff,Fg: out std_logic);
end entity;

architecture behavior of segment_LED_7 is


begin

Fa <= ((not A) and (not C)) or B or (A and C);
Fb <= ((not B) and (not C)) or (not A) or (B and C);
Fc <= A or (not B) or C;
Fd <= ((not A) and (not C)) or ((not A) and B) or (B and (not c)) or (A and (not B) and C);
Fe <= ((not A) and (not C)) or (B and (not C));
Ff <= ((not B) and (not C)) or (A and (not C)) or (A and (not B));
Fg <= ((not A) and B) or (A and (not C)) or (A and (not B));

end behavior;
