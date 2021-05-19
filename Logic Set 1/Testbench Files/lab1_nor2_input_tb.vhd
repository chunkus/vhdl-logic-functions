library IEEE;				-- Including the standard library IEEE.
use IEEE.std_logic_1164.all;

entity lab1_nor2_input_tb is
end lab1_nor2_input_tb;

architecture test_nor2 of lab1_nor2_input_tb is
	-- Declaring the component for the unit under test (uut).
	component lab1_nor2_input	
	port (	
			A: in std_logic;
			B: in std_logic;
			F: out std_logic);
	end component;
	
	-- Input signals being declared and set with initial values.
	signal sig_a: std_logic := '0'; 
	signal sig_b: std_logic := '0';
	
	-- Output signals being declared.
	signal sig_f: std_logic;
	
begin
	-- Instantiation of the unit under test (UUT).
	UUT: lab1_nor2_input port map (sig_a, sig_b, sig_f);
	
	test_bench: process		-- Entering process to verify functionality of the NOR 						
	begin					-- gate design.
	
	-- ********************************************** --	
            -- truth table for a NOR gate:
    
            --    a    b  :  f
            --------------:-----
            --    0     0 :  1
            --	  0     1 :  0
            --    1     0 :  0
            --	  1     1 :  0
    
            -- input test signals of the correct values to 
            -- sig_a and sig_b at 100 ns intervals to check
            -- that sig_f gives the expected output
    -- ********************************************** --
		
		wait for 100 ns;	-- Waiting initially 100 ns before trying first two bits.
		sig_a <= '0';		-- Checking functionality of 0 NOR 0 = 1.
		sig_b <= '0';
	
		wait for 100 ns;	-- Waiting 100 ns before testing second set of bits.
		sig_a <= '0';
		sig_b <= '1';		-- Checking functionality of 0 NOR 1 = 0.
	
		wait for 100 ns;	-- Waiting 100 ns before testing third set of bits.
		sig_a <= '1';		-- Checking functionality of 1 NOR 0 = 0.
		sig_b <= '0';			
	
		wait for 100 ns;	-- Waiting 100 ns before testing last set of bits.
		sig_a <= '1';
		sig_b <= '1';		-- Checking functionality of 1 NOR 1 = 0.
	
		wait;	
	
	end process;			-- End of process.
	
end;						-- End of test bench for lab1_nor2_input.	
