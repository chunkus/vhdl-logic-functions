-- Engineer: Luca Santarelli

-- Source code for an n-bit Register File Cell (RFC).

library ieee;	-- Including library to be used.
use ieee.std_logic_1164.all;

-- Entity of the n-bit RFC.
entity n_bit_RFC is
generic (width : positive := 4);	-- Defining generic value to be easily modified if necessary.
port (
		-- Data_in, REA, REB, WE, CLK are the input ports of the n-bit RFC.
		-- OutA, OutB are the output ports of the n-bit RFC.
		Data_in : in std_logic_vector (width-1 downto 0);
		REA : in std_logic;
		REB : in std_logic;
		WE : in std_logic;
		CLK : in std_logic;
		OutA : out std_logic_vector (width-1 downto 0);
		OutB : out std_logic_vector (width-1 downto 0)
);
-- End of the entity.
end n_bit_RFC;

-- Defining the n-bit RFC architecture.
architecture n_bit_RFC_arch of n_bit_RFC is

-- Including as a component that of the RFC.
component register_file_cell is
port(
	DIN : in std_logic;
	REA : in std_logic;
	REB : in std_logic;
	WE : in std_logic;
	CLK : in std_logic;
	OA : out std_logic;
	OB : out std_logic
);
-- End of the component.
end component;

begin
-- Using a for generate to port map all RFC for this n-bit RFC based on the number of bits used.
	for_generate :  for i in width-1 downto 0 generate
	-- Port mapping the RFC component with the n-bit RFC entity.
		instance : register_file_cell port map (DIN=>Data_in(i), REA=>REA, REB=>REB, WE=>WE, CLK=>CLK, OA=>OutA(i), OB=>OutB(i));

	end generate;	-- End of the for generate.

end n_bit_RFC_arch;	-- End of the n-bit RFC architecture.