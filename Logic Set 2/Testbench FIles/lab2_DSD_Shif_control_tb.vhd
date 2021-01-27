-- Company : Queen Mary University 
-- Engineer : Aditya Ajaykumar
-- Date : 7 February 2019
-- Module : lab2_Shift_Control_tb
--project : Lab2_DSD

LIBRARY ieee;		-- Defining the libraries to be used in the test bench.
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY Shift_Control_tb IS	-- Defining the entity for the test bench file.
END Shift_Control_tb;		-- End of test bench entity.

-- Defining the architecture of the test bench.
ARCHITECTURE test_arch OF Shift_Control_tb IS 

	-- Component Declaration for the Unit Under Test (UUT)
	-- The component used is the entity of the shift control unit VHDL source code.
	COMPONENT Shift_Control
	PORT(
		A : IN std_logic;  
		B : IN std_logic;  
		C : IN std_logic;  
		X : OUT std_logic;  		
		Y : OUT std_logic
		);
	END COMPONENT;

	-- Input signals to be used for verification.
	SIGNAL sig_a :  std_logic := '0';
	SIGNAL sig_b :  std_logic := '0';
	SIGNAL sig_c :  std_logic := '0';

	-- Output signals to be used for verification.
	SIGNAL sig_x :  std_logic;
	SIGNAL sig_y :  std_logic;

BEGIN
	-- Instantiate the Unit Under Test (UUT)
	uut: Shift_Control PORT MAP(
		A => sig_a,
		B => sig_b,
		C => sig_c,
		X => sig_x,
		Y => sig_y
	);

	-- Beginning of the test bench process to verify functionality of the shift control logic.
	tb : PROCESS
	BEGIN
		
		-- truth table for a 3 input shift control logic.

		--    	A   B   C :  X 	Y
		------------------:-------
		--		0	0	0 :  0	0
		--		0	0	1 :  0	0
		--		0	1	0 :  1	0
		--		0	1	1 :  0	1
		--		1	0	0 :  1	0
		--		1	0	1 :  0	1
		--		1	1	0 :  1	0
		--		1	1	1 :  0	1

		-- Waiting 100 nano seconds before verifying first set of combinations.
		wait for 100 ns;
		sig_a <= '0';	-- Seeing if A = 0, B = 0, C = 0 give X = 0, Y = 0.
		sig_b <= '0';	
		sig_c <= '0';	
		
		-- Waiting 100 nano seconds before verifying second set of combinations.
		wait for 100 ns;
		sig_a <= '0';	-- Seeing if A = 0, B = 0, C = 1 give X = 0, Y = 0.
		sig_b <= '0';
		sig_c <= '1';
		
		-- Waiting 100 nano seconds before verifying third set of combinations.
		wait for 100 ns;
		sig_a <= '0';	-- Seeing if A = 0, B = 1, C = 0 give X = 1, Y = 0.
		sig_b <= '1';
		sig_c <= '0';
		
		-- Waiting 100 nano seconds before verifying fourth set of combinations.
		wait for 100 ns;
		sig_a <= '0';	-- Seeing if A = 0, B = 1, C = 1 give X = 0, Y = 1.
		sig_b <= '1';
		sig_c <= '1';
		
		-- Waiting 100 nano seconds before verifying fifth set of combinations.
		wait for 100 ns;
		sig_a <= '1';	-- Seeing if A = 1, B = 0, C = 0 give X = 1, Y = 0.
		sig_b <= '0';	
		sig_c <= '0';	
		
		-- Waiting 100 nano seconds before verifying sixth set of combinations.
		wait for 100 ns;
		sig_a <= '1';	-- Seeing if A = 1, B = 0, C = 1 give X = 0, Y = 1.
		sig_b <= '0';
		sig_c <= '1';
		
		-- Waiting 100 nano seconds before verifying seventh set of combinations.
		wait for 100 ns;
		sig_a <= '1';	-- Seeing if A = 1, B = 1, C = 0 give X = 1, Y = 0.
		sig_b <= '1';
		sig_c <= '0';
		
		-- Waiting 100 nano seconds before verifying eighth set of combinations.
		wait for 100 ns;
		sig_a <= '1';	-- Seeing if A = 1, B = 1, C = 1 give X = 0, Y = 1.
		sig_b <= '1';
		sig_c <= '1';
		
		wait; -- end of test

	END PROCESS;	-- End of verification process.

END;	-- End of test bench for the shift control logic