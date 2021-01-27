-- Company : Queen Mary University 
-- Engineer : Aditya Ajaykumar
-- Date : 23 January 2019
-- Module : lab1_fulladder
--project : Lab_1 DSD

LIBRARY ieee;	-- Import std_logic from the IEEE library
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY fulladder_tb IS	-- Declaring entity for the test bench.
END fulladder_tb;

-- Defining the architecture of the entity previously defined.
ARCHITECTURE behavior OF fulladder_tb IS

 COMPONENT fulladder   -- Component Declaration for the Unit Under Test (UUT).
 PORT( 
 		A : in std_logic;
 		B : in std_logic;
		cin : in std_logic;
		s : out std_logic;
		carry : out std_logic);
END COMPONENT;

 --Inputs
 signal A : std_logic := '0';
 signal B : std_logic := '0';
 signal cin : std_logic := '0';
 
 --Outputs
 signal S : std_logic;
 signal carry : std_logic;

BEGIN

 -- Instantiating the Unit Under Test (UUT)
 uut: fulladder PORT MAP ( A => A,
 B => B,
 cin => cin,
 s => S,
 carry => carry);

 test_bench: process  --to check validity of full adder
 begin
	
	-- ********************************************** --	
            -- truth table for a AND gate:
    
            --    a    b   cin	:  sum   carry out
            --------------------:------------------
            --    0    0   	0	:  0		0
            --    0    0   	1	:  1		0
            --    0    1   	0	:  1		0
            --    0    1   	1	:  0		1
            --    1    0   	0	:  1		0
            --    1    0   	1	:  0		1
            --    1    1   	0	:  0		1
            --    1    1   	1	:  1		1
    
            -- input test signals of the correct values to 
            -- A, B and cin, at 100ns intervals to check
            -- that sum and carry out give the expected output
    -- ********************************************** --
 	
 	wait for 100 ns;	-- hold reset state for 100 ns
 	A <= '0';
 	B <= '0';
 	cin <= '0';			-- Checking if A = 0, B = 0, Cin = 0 give SUM = 0, Carry Out = 0.
 	
 	wait for 100 ns;
 	A <= '0';
 	B <= '0';
 	cin <= '1';			-- Checking if A = 0, B = 0, Cin = 0 give SUM = 1, Carry Out = 0.
 	
 	wait for 100 ns;
 	A <= '0';
 	B <= '1';
 	cin <= '0';			-- Checking if A = 0, B = 1, Cin = 0 give SUM = 1, Carry Out = 0.
 	
 	wait for 100 ns;
	A <= '0';
 	B <= '1';
 	cin <= '1';			-- Checking if A = 0, B = 1, Cin = 1 give SUM = 0, Carry Out = 1.
 	
 	wait for 100 ns;    
 	A <= '1';
 	B <= '0';
 	cin <= '0';		    -- Checking if A = 1, B = 0, Cin = 0 give SUM = 1, Carry Out = 0

 	wait for 100 ns;
 	A <= '1';
 	B <= '0';
 	cin <= '1';			-- Checking if A = 1, B = 0, Cin = 1 give SUM = 0, Carry Out = 1.
 	
 	wait for 100 ns;
 	A <= '1';
 	B <= '1';
 	cin <= '0';			-- Checking if A = 1, B = 1, Cin = 0 give SUM = 0, Carry Out = 1

 	wait for 100 ns;
 	A <= '1';
 	B <= '1';
 	cin <= '1';			-- Checking if A = 1, B = 1, Cin = 1 give SUM = 1, Carry Out = 1.
 
	wait;		-- End of test. Waiting forever.
	
	end process;	-- End of process.
END;				-- End of test bench.
