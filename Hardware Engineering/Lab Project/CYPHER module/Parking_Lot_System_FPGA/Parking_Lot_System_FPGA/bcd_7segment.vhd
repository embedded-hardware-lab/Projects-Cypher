
ENTITY LED_7segment IS
  PORT(
    input          : IN   bit_vector(3 DOWNTO 0);   --number to display in BCD
    LED_out : OUT  bit_vector(6 DOWNTO 0));  --outputs to seven segment display
END LED_7segment;

ARCHITECTURE logic OF LED_7segment IS
BEGIN

  --map bcd input to desired output segments
  WITH input SELECT
    LED_out <= 	    "0000001" WHEN "0000",  --0
                    "1001111" WHEN "0001",  --1
                    "0010010" WHEN "0010",  --2
                    "0000110" WHEN "0011",  --3
                    "1001100" WHEN "0100",  --4
                    "0100100" WHEN "0101",  --5
                    "0100000" WHEN "0110",  --6
                    "0001111" WHEN "0111",  --7
                    "0000000" WHEN "1000",  --8
                    "0000100" WHEN "1001",  --9
                    "1111111" WHEN OTHERS;  --blank when not a digit
  
END logic;
