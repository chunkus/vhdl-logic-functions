-- Company: Queen Mary University
-- Engineer: Youssef Akil
-- Date created: January 22nd, 2018
-- Design name: lab1_or3_input
-- Module Name: lab1_or3_input_tb.vhd
-- Project name: Lab 1 DSD

-- Design goal: 
-- being able to verify the functionality of our three input OR gate design
-- created with the module lab1_or3_input.vhd.

library IEEE;				-- Including the standard library IEEE.
use IEEE.std_logic_1164.all;

entity lab1_or3_input_tb is
end lab1_or3_input_tb;

-- Stating the architecture of our entity.
architecture test_or3 of lab1_or3_input_tb is
	-- Declaring the component for the unit under test (uut).
	component lab1_or3_input	
	port (	
	        A: in std_logic;
			B: in std_logic;
			C: in std_logic;
			F: out std_logic);
	end component;					-- End of component.
	
	-- Input signals being declared and set with initial values.
	signal signal_a: std_logic := '0'; 
	signal signal_b: std_logic := '0';
	signal signal_c: std_logic := '0';
	
	-- Output signals being declared.
	signal signal_f: std_logic;
	
begin
	-- Instantiation of the unit under test (UUT).
	UUT: lab1_or3_input port map (signal_a, signal_b,signal_c, signal_f);
	
	test_bench: process		-- Entering process to verify functionality of the NOR 						
	begin					-- gate design.
	
		-- ********************************************** --	
            -- truth table for a 3 input OR gate:
    
            --    a  b  c :  f
            --------------:-----
            --	  0  0  0 :  0
            --    0  0  1 :  1
            --    0  1  0 :  1
            --    0  1  1 :  1
            --    1  0  0 :  1
            --    1  0  1 :  1
            --    1  1  0 :  1
            --    1  1  1 :  1
    
            -- input test signals of the correct values to 
            -- signal_a, signal_b and signal_c at 100ns intervals to check
            -- that signal_f gives the expected output.
    -- ********************************************** --
		
		wait for 100 ns;	-- Waiting initially 100 ns before trying first three bits.
		signal_a <= '0';	-- Checking functionality of 0 or 0 or 0 = 0.
		signal_b <= '0';
		signal_c <= '0';
	
		wait for 100 ns;	-- Waiting 100 ns before testing second set of bits.
		signal_a <= '0';	-- Checking functionality of 0 or 0 or 1 = 1.
		signal_b <= '0';
		signal_c <= '1';	
	
		wait for 100 ns;	-- Waiting 100 ns before testing third set of bits.
        signal_a <= '0';    -- Checking functionality of 0 or 1 or 0 = 1.
    	signal_b <= '1';
		signal_c <= '0';    
                
		wait for 100 ns;	-- Waiting 100 ns before testing fourth set of bits.
		signal_a <= '0';    -- Checking functionality of 0 or 1 or 1 = 1.
		signal_b <= '1';
		signal_c <= '1';    
                        
		wait for 100 ns;	-- Waiting 100 ns before testing fifth set of bits.
		signal_a <= '1';   	-- Checking functionality of 1 or 0 or 0 = 1.
		signal_b <= '0';
		signal_c <= '0';    
                                
		wait for 100 ns;	-- Waiting 100 ns before testing sixth set of bits.
		signal_a <= '1';    -- Checking functionality of 1 or 0 or 1 = 1.
		signal_b <= '0';
		signal_c <= '1';    
                                        
		wait for 100 ns;	-- Waiting 100 ns before testing seventh set of bits.
		signal_a <= '1';    -- Checking functionality of 1 or 1 or 0 = 1.
		signal_b <= '1';
		signal_c <= '0';    
                                                
		wait for 100 ns;	-- Waiting 100 ns before testing eighth set of bits.
		signal_a <= '1';    -- Checking functionality of 1 or 1 or 1 = 1.
		signal_b <= '1';
		signal_c <= '1';    
	
		wait;				-- End of test. Will wait forever.
	
	end process;			-- End of process.
	
end;						-- End of test bench for lab1_or3_input.