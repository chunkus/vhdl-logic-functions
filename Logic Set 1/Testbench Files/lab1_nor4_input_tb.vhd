-- Company: Queen Mary University
-- Engineer: Youssef Akil
-- Date created: January 22nd, 2018
-- Design name: lab1_nor4_input
-- Module Name: lab1_nor4_input_tb.vhd
-- Project name: Lab 1 DSD

-- Design goal: 
-- being able to verify the functionality of our four input NOR gate design
-- created with the module lab1_nor4_input.vhd.

library IEEE;				-- Including the standard library IEEE.
use IEEE.std_logic_1164.all;

entity lab1_nor4_input_tb is
end lab1_nor4_input_tb;

-- Stating the architecture of our entity.
architecture test_nor4 of lab1_nor4_input_tb is
	-- Declaring the component for the unit under test (uut).
	component lab1_nor4_input	
	port (	
			A: in std_logic;
			B: in std_logic;
			C: in std_logic;
			D: in std_logic;
			F: out std_logic);
	end component;
	
	-- Input signals being declared and set with initial values.
	signal signal_a: std_logic := '0'; 
	signal signal_b: std_logic := '0';
	signal signal_c: std_logic := '0';
	signal signal_d: std_logic := '0';
	
	-- Output signals being declared.
	signal signal_f: std_logic;
	
begin
	-- Instantiation of the unit under test (UUT).
	UUT: lab1_nor4_input port map (signal_a, signal_b, signal_c, signal_d, signal_f);
	
	test_bench: process		-- Entering process to verify functionality of the NOR 						
	begin					-- gate design.
	
		-- ********************************************** --	
            -- truth table for a 4 input NOR gate:
    
            --    a    b  	c	d  :  f
            -----------------------:-----
            --    0    0  	0	0  :  1		ONLY CASE IN WHICH NOR GIVES OUTPUT 1!!!
            --    0    0  	0	1  :  0
            --    0    x  	x	0  :  0
            --    0    x  	x	x  :  0
            --    1    x  	x	x  :  0
    
            -- input test signals of the correct values to 
            -- signal_a, signal_b, signal_c and signal_d, at 100ns intervals to check
            -- that signal_f gives the expected output.
    -- ********************************************** --
		
	-- NOTE: BECAUSE ONLY ONE CASE OF A 4 BIT COMBINATION GIVES US AN OUTPUT OF 1, WE
	-- HAVE DECIDED TO TEST ONLY 4 DIFFERENT COMBINATIONS OF BITS TO SEE WHETHER THE ONLY
	-- POSSIBILITY OF HAVING AN OUTPUT OF 1 IS TRUE AND TO TEST IF THE OTHER INPUTS 
	-- GIVE 0 AS AN OUTPUT, AS SHOULD THE REST OF THE COMBINATIONS.	
		
		wait for 100 ns;	-- Waiting initially 100 ns before trying first set of bits.
		signal_a <= '0';	-- Checking functionality of (0 nor 0)' nor (0 nor 0)' = 1.
		signal_b <= '0';
		signal_c <= '0';
		signal_d <= '0';  
		
		wait for 100 ns;	-- Waiting initially 100 ns before trying second set of bits.
		signal_a <= '0';	-- Checking functionality of (0 nor 1)' nor (0 nor 0)' = 0.
		signal_b <= '1';
		signal_c <= '0';
		signal_d <= '0';
		
		wait for 100 ns;	-- Waiting initially 100 ns before trying third set of bits.
		signal_a <= '0';	-- Checking functionality of (0 nor 1)' nor (1 nor 0)' = 0.
		signal_b <= '1';
		signal_c <= '1';
		signal_d <= '0';
		
		wait for 100 ns;	-- Waiting initially 100 ns before trying fourth set of bits.
		signal_a <= '1';	-- Checking functionality of (1 nor 0)' nor (1 nor 1)' = 0.
		signal_b <= '0';
		signal_c <= '1';
		signal_d <= '1';                                                                                                      
	
		wait;				-- End of test. Waiting forever.
	
	end process;			-- End of process.
end;						-- End of test bench for lab1_nor4_input.