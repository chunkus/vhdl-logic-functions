-- Engineer: Daniyal Naeem.
-- Source code for an 8-bit comparator.

library IEEE;	-- Libraries to be used.
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Entity declaration.
entity eightbit_comparator is
Port ( 	
		-- InA, InB are the input ports (8-bit wide).
		-- Output is the output port.
		InA : in std_logic_vector(7 downto 0);
        InB : in std_logic_vector(7 downto 0);
        Output : out std_logic
    );
end eightbit_comparator;	-- End of entity.

-- ARCHITECTURE of the previous defined entity.
architecture behavioral of eightbit_comparator is 

begin 
-- Defining what value the output will have:
-- Output = 1 when inputs are the same, otherwise Output = 0 when inputs are different.
Output <= '1' when (InA = InB) else '0';

end behavioral;	-- End of the architecture.