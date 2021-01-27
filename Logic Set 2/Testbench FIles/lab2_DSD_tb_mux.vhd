-- Company : Queen Mary University 
-- Engineer : Aditya Ajaykumar
-- Date : 7 February 2019
-- Module : lab2_tb_mux
--project : Lab2_DSD

LIBRARY ieee;		-- Defining the libraries to be used.
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY tb_mux IS	-- Defining the entity of the test bench.
END tb_mux;			-- End of the test bench.

ARCHITECTURE test_arch OF tb_mux IS 

-- Component Declaration for the Unit Under Test (UUT) corresponding to the entity used
-- in the 4-to-1 MUX vhdl source code.
component mux_4to1 is
port(
	A, B, C, D : in std_logic;
	CA,CB : in std_logic;
	Y	   : out std_logic );

end component;
	
	-- Input signals.
	SIGNAL sig_a :  std_logic := '0';
	SIGNAL sig_b :  std_logic := '0';
	SIGNAL sig_c :  std_logic := '0';
	SIGNAL sig_d :  std_logic := '0';
	SIGNAL sig_s0 :  std_logic := '0';
	SIGNAL sig_s1 :  std_logic := '0';

	-- Output signals.
	SIGNAL sig_y :  std_logic;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: mux_4to1 PORT MAP(
		A => sig_a,
		B => sig_b,
		C => sig_c,
		D => sig_d,
		CA => sig_s0,
		CB => sig_s1,
		Y => sig_y
	);

	tb : PROCESS
	BEGIN
		
	
		-- truth table for a 4 to 1 mux using s0 and s1 as selection lines and Y as output:

		--    	s0   s1 :  Y
		----------------:----
		--		0	 0	:  A
		--		0	 1	:  B
		--		1	 0	:  C
		--		1	 1	:  D

		-- Verifying all 4 possible inputs of the selectors.
		
		-- Verifying S0 = S1 = 0 to select input A on the output.
		wait for 100 ns;		-- output as A
		sig_s0 <= '0';
		sig_s1 <= '0';	
		sig_a <= '0';	
		wait for 100 ns;
		sig_a <= '1';
		
		-- Verifying S0 = 0, S1 = 1 to select input B on the output.
		wait for 100 ns;		-- output as B
		sig_s0 <= '0';
		sig_s1 <= '1';	
		sig_b <= '0';
		wait for 100 ns;
		sig_b <= '1';
		
		-- Verifying S0 = 1, S1 = 0 to select input C on the output.
		wait for 100 ns;		--output as C
		sig_s0 <= '1';
		sig_s1 <= '0';	
		sig_c <= '0';	
		wait for 100 ns;
		sig_c <= '1';
		
		-- Verifying S0 = S1 = 1 to select input D on the output.
		wait for 100 ns;		--output as D
		sig_s0 <= '1';
		sig_s1 <= '1';	
		sig_d <= '0';	
		wait for 100 ns;
		sig_d <= '1';
		
		wait; -- End of test. Wait forever.

	END PROCESS;	-- End of test bench process.

END;	-- End of test bench code.