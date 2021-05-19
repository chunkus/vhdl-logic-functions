library IEEE;
use IEEE.std_logic_1164.all;	-- Including the standard library IEEE.

entity lab1_nor2_input is		-- Declaring entity of our module.
	port(	
			A: in std_logic;	-- A and B are the two input signals of the NOR gate. 
			B: in std_logic;		
			F: out std_logic);	-- F is the output signal of the NOR gate.
end lab1_nor2_input;			-- End of entity.

architecture nor2_input_arch of lab1_nor2_input is
begin							-- Declaring architecture of our module.
	
	F <= A nor B after 10 ns;	-- Stating the operation of the NOR gate to be done on the
								-- inputs A and B after 10 nano seconds.
end nor2_input_arch;			-- End of architecture.
