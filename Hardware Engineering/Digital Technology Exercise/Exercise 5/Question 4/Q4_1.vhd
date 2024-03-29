library ieee;
use ieee.std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity ROM is 
	port( 	CLK:in std_logic;
		ADDR: in std_logic_vector(3 downto 0);
		DATA_OUT:out std_logic);
end ROM;



architecture behavioral of ROM is
type rom_type is array (15 downto 0) of std_logic;
constant ROMT:rom_type :=
('0','1','1','0',
'1','0','1','0',
'0','1','0','0',
'0','0','1','1');




begin
process (CLK)
begin
if(CLK'event and CLK ='1') then
DATA_OUT <= ROMT(to_integer(unsigned(ADDR)));
end if;
end process;



end behavioral;



