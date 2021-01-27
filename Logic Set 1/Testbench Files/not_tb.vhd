--------------------------------------------------------------------------------
-- Engineer: Tobi Adebari
-- Dependencies:	not1.vhd
--------------------------------------------------------------------------------
-- Saying what librarys are being used
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

--Creating the entity
ENTITY not1_tb IS
END not1_tb;

--Defining said entitie's architecture
ARCHITECTURE test_arch OF not1_tb IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT not1
	PORT(
		a : IN std_logic;
		f : OUT std_logic
		);
	END COMPONENT;

	--Inputs
	SIGNAL sig_a :  std_logic := '0';

	--Outputs
	SIGNAL sig_f :  std_logic;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: not1 PORT MAP(
		a => sig_a,
		f => sig_f
	);

	tb : PROCESS
	BEGIN
		
-- ********************************************** --
		-- truth table for a NOT gate:

		--     a   :  f
		--------------:-----
		--	    0	  :  1
		--		1	  :  1

		-- input test signals of the correct values to 
		-- sig_a at 100ns intervals to check
		-- that sig_f gives the expected output

-- ********************************************** --

		wait for 100 ns;		-- Wait for global reset

		sig_a <= '0';         -- check 0 = 1

		wait for 100 ns;

		sig_a <= '1';			-- check 1 = 0
		
		wait; -- end of test: will wait forever

	END PROCESS;

END;
























