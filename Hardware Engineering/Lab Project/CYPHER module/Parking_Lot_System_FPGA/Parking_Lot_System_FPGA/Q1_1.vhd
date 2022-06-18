library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity D_flip_flop is 
   port(	Q : out std_logic; 
		Q_not : out std_logic;    
      		Clk :in std_logic;   
      		D :in  std_logic ;
		rst : in std_logic  
   	);
end D_flip_flop;

architecture Behavioral of D_flip_flop is  
	signal q_s: std_logic;

	begin  
 		process(Clk,rst)
 			begin 	if rst = '1' then
					q_s <= '0'; 
    				elsif(Clk = '1' and Clk'event) then
   					q_s <= D; 
    				end if;       
 		end process;
		Q <= q_s;  
		Q_not <= not q_s;
end Behavioral;
