library IEEE;				-- Including the standard library IEEE.
use IEEE.std_logic_1164.all;

entity lab1_half_adder_tb is
end lab1_half_adder_tb;

architecture test_half_adder of lab1_half_adder_tb is
	-- Declaring the component for the unit under test (uut).
	component lab1_half_adder	
	port (	
			A: in std_logic;
			B: in std_logic;
			S: out std_logic;
			C: out std_logic);
	end component;
	
	-- Input signals being declared and set with initial values.
	signal sig_a: std_logic := '0'; 
	signal sig_b: std_logic := '0';
	
	-- Output signals being declared.
	signal sig_sum	: std_logic;
	signal sig_carry: std_logic;
	
begin
	-- Instantiation of the unit under test (UUT).
	UUT: lab1_half_adder port map (sig_a, sig_b, sig_sum, sig_carry);
	
	test_bench: process		-- Entering process to verify functionality of the half						
	begin					-- adder design.
	
		-- ********************************************** --	
            -- truth table for a Half Adder.
    
            --    a    b  : sum	: carry
            --------------:-----:------
            --    0    0  :  0  :	0	
            --    0    1  :  1	:	0
            --    1    0  :  1	:	0
            --    1    1  :  0	:	1
    
            -- input test signals of the correct values to 
            -- sig_a and sig_b at 100ns intervals to check
            -- that sig_sum and sig_carry each give the 
            -- expected output.
    -- ********************************************** --
		
		wait for 100 ns;	-- Waiting initially 100 ns before trying first two bits.
		sig_a <= '0';		-- Checking 0 xor 0 = 0 (s), 0 and 0 = 0 (c).
		sig_b <= '0';
	
		wait for 100 ns;	-- Waiting 100 ns before testing second set of bits.
		sig_a <= '0';
		sig_b <= '1';		-- Checking 0 xor 1 = 1 (s), 0 and 1 = 0 (c).
	
		wait for 100 ns;	-- Waiting 100 ns before testing third set of bits.
		sig_a <= '1';		-- Checking 1 xor 0 = 1 (s), 1 and 0 = 0 (c).
		sig_b <= '0';			
	
		wait for 100 ns;	-- Waiting 100 ns before testing last set of bits.
		sig_a <= '1';
		sig_b <= '1';		-- Checking 1 xor 1 = 0 (s), 1 and 1 = 1 (c).
	
		wait;	
	
	end process;			-- End of process.
	
end;						-- End of test bench for lab1_half_adder.
	
	
