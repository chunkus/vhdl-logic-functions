library IEEE;
use IEEE.std_logic_1164.all;		-- Stating the library to be used.

-- two input XOR named myxor --

entity myxor is						-- Creating entity for the XOR gate.
 
port ( 
		A : in std_logic;			-- Creating of ports.
    	B : in std_logic;
        F : out std_logic);

end myxor;							-- End of entity.

-- ARCHITECTURE --

-- Creating the architecture for the entity previously created.
architecture myxor_arch of myxor is

begin
    f <= a xor b after 7 ns;		-- Stating how the gate works and starting it after
									-- 7 nano seconds.

end myxor_arch;						-- End of architecture.
