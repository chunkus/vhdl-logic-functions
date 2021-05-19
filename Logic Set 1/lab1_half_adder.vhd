library IEEE;
use IEEE.std_logic_1164.all;	-- Including the standard library IEEE.

entity lab1_half_adder is		-- Declaring entity of our module.
	port(	
			A: in std_logic;	-- A and B are the two inputs of the half adder. 
			B: in std_logic;		
			S: out std_logic;	-- S is the output for the sum and C for the carry.
			C: out std_logic);	
end lab1_half_adder;			-- End of entity.

architecture half_adder_arch of lab1_half_adder is
begin							-- Declaring architecture of our module.
	
	S <= A xor B after 10 ns;	-- Stating the operation of full adder XOR and AND gates
	C <= A and b after 10 ns;	-- to be done on the inputs A and B after 10 nano seconds.	
								-- To have the Sum an XOR logic is applied on the inputs
								-- A and B. To have the carry an AND logic is applied on 
								-- the inputs A and B.

end half_adder_arch;			-- End of architecture.
