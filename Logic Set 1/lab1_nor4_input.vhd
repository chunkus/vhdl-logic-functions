library IEEE;
use IEEE.std_logic_1164.all;	-- Including the standard library IEEE.

entity lab1_nor4_input is		-- Declaring entity of our module.
	port(	
	        A: in std_logic;	-- A,B,C, and D are the four inputs of the NOR gate. 
			B: in std_logic;
			C: in std_logic;
			D: in std_logic;
			F: out std_logic);	-- F is the output of the NOR gate.
end lab1_nor4_input;			-- End of entity.

architecture nor4_input_arch of lab1_nor4_input is
begin							-- Declaring architecture of our module.
	
	F <= ( (not(A nor B)) nor (not(C nor D))); -- (A nor B) or (C nor D) after 10 ns;	
								-- Stating the operation of the NOR gate to be done on the
								-- inputs A and B after 10 nano seconds.
end nor4_input_arch;			-- End of architecture.
