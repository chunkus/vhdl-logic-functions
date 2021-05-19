-- Saying what librarys are being used
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

--Creating the entity
ENTITY and2_tb IS
END and2_tb;

--Defining said entitie's architecture
ARCHITECTURE test_arch OF and2_tb IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT and2
	PORT(
		a : IN std_logic;
		b : IN std_logic;          
		f : OUT std_logic
		);
	END COMPONENT;

	--Inputs
	SIGNAL sig_a :  std_logic := '0';
	SIGNAL sig_b :  std_logic := '0';

	--Outputs
	SIGNAL sig_f :  std_logic;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: and2 PORT MAP(
		a => sig_a,
		b => sig_b,
		f => sig_f
	);

	tb : PROCESS
	BEGIN
-- ********************************************** --	
            -- truth table for a AND gate:
    
            --    a    b  :  f
            --------------:-----
            --        0     0      :  0
            --        0     1      :  0
            --        1     0      :  0
            --        1     1      :  1
    
            -- input test signals of the correct values to 
            -- sig_a and sig_b at 100ns intervals to check
            -- that sig_f gives the expected output
    -- ********************************************** --
		
		wait for 100 ns;		-- Wait for global reset

		sig_a <= '0';
		sig_b <= '0';			-- check 0 nand 0 = 1

		wait for 100 ns;

		sig_a <= '1';			-- check 0 nand 1 = 1

		wait for 100 ns;

 		sig_a <= '0';
		sig_b <= '1';			-- check 1 nand 0 = 1

		wait for 100 ns;

		sig_a <= '1';	 		-- check 1 nand 1 = 0
		
		wait; -- end of test: will wait forever

	END PROCESS;

END;
























