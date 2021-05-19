library IEEE;		-- Defining the library to be used.
use IEEE.std_logic_1164.all;

-- Defining the entity of the 4-to-1 MUX.
entity mux_4to1 is	
port(
	A, B, C, D : in std_logic;	-- The four inputs of the MUX.
	CA,CB : in std_logic;		-- The two selectors of the MUX.
	Y	   : out std_logic );	-- The output of the 4-to-1 MUX.

end mux_4to1;	-- End of 4-to-1 MUX entity.

-- Defining the architecture of the 4-to-1 MUX entity.
architecture mux_4to1_arch of mux_4to1 is
begin

	-- Following is the boolean equation the 4-to-1 MUX follows, based on its truth table
	-- in order to function correctly.
	Y <= (A and ((not CB)and(not CA))) or (B and ((not CB)and CA)) or (C and (CB and (not CA))) or (D and (CB and CA));

end mux_4to1_arch;	-- End of the 4-to-1 MUX architecture.
