ibrary IEEE; 
use IEEE.STD_LOGIC_1164.ALL;     --Including the standard library IEEE.


entity mux_2to1 is      --Declaration of entity
port (
		SEL : in STD_LOGIC ; 
		A : in STD_LOGIC;
		B : in STD_LOGIC;      --Input and selection line declaration
		Y : out STD_LOGIC);    --Output declaration

end mux_2to1; --End of entity

architecture  mux_2to1_arch of mux_2to1 is     --Declaration of architecture
begin

	Y <= A when (SEL = '1') else B;    --comparision of selection line with inputs A and B

end mux_2to1_arch;     --End of architecture 
