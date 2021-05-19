library IEEE;		-- Defining the library to be used.
use IEEE.std_logic_1164.all;

-- Defining the entity for the shift control logic.
entity Shift_Control is
port(
		A : in std_logic;	-- Signals A, B and C represent the 3 input vector signal.
		B : in std_logic;
		C : in std_logic;
		X : out std_logic;
		Y : out std_logic 	-- Signals X and Y represent the 2 output vector signal.
	);

end Shift_Control;			-- End of the entity definition.

-- Defining the architecture of the shift control logic (how it will function).
architecture Shift_Control_arch of Shift_Control is
begin

	-- The following two boolean functions will define the output value on output X and
	-- output Y.
	X <= (not C) and (A or B);	-- Here input C (Input(0)) is negated.
	Y <= C and (A or B);		-- Here input C (Input(0)) is not negated.

end Shift_Control_arch;
