library ieee;
use ieee.std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity RAM is 
	port( 	CLK :in std_logic;
	      	WE: in std_logic;
		ADDR: in std_logic_vector(3 downto 0);
		DATA_IN:in std_logic;
		DATA_OUT:out std_logic);
end RAM;

architecture behavioral of RAM is
type ram_type is array (15 downto 0) of std_logic;
signal RAMT:ram_type;

begin
process (CLK)
begin
if(CLK'event and CLK ='1') then
if (WE='1') then
RAMT(to_integer(unsigned(ADDR))) <= DATA_IN;
end if;
end if;
end process;
DATA_OUT <= RAMT(to_integer(unsigned(ADDR)));
end behavioral;



		
		