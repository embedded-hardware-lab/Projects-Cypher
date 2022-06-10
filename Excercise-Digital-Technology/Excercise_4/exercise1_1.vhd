entity D_flip_flop is 
   port(	Q : out bit; 
		Q_not : out bit;    
      		Clk :in bit;   
      		D :in  bit ;
		rst : in bit  
   	);
end D_flip_flop;

architecture Behavioral of D_flip_flop is  
	signal q_s: bit;

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
