library IEEE;
Use IEEE.std_logic_1164.all;			-- Stating the library to be used.

entity xor_gate_test_bench is 			-- Creating entity for the test bench.
end xor_gate_test_bench;				-- End of entity.

-- Stating the architecture of the entity, to be used.
architecture test_arch of xor_gate_test_bench is 

	-- Declaring the component for the Unit Under Test (UUT).
	component myxor
	Port ( 
			A : in std_logic;
          	B : in std_logic;
          	F : out std_logic);
	
	end component;		-- End of component.

	-- Inputs.
	signal sig_a : std_logic := '0'; 
	signal sig_b : std_logic := '0';

	-- Output.
	signal sig_f : std_logic;

	begin 
	uut: myxor port map (sig_a, sig_b, sig_f);

	tb : process
    	begin
    	-- ********************************************** --	
            -- truth table for an XOR gate:
    
            --    a    b  :  f
            --------------:-----
            --    0     0 :  0
            --    0     1 :  1
            --    1     0 :  1
            --    1     1 :  0
    
            -- input test signals of the correct values to 
            -- sig_a and sig_b at 100 ns intervals to check
            -- that sig_f gives the expected output.
    -- ********************************************** --
                
                 wait for 100 ns;		-- Waiting for global reset.
                 sig_a <= '0';
                 sig_b <= '0';			-- Check if 0 XOR 0 = 0
                 
                 wait for 100 ns;
                 sig_a <= '0';
                 sig_b <= '1';			-- Check if 0 XOR 1 = 1
                 
                 wait for 100 ns;
                 sig_a <= '1';
                 sig_b <= '0';			-- Check if 1 XOR 0 = 1
                 
                 wait for 100 ns;
                 sig_a <= '1';
                 sig_b <= '1';			-- Check if 1 XOR 1 = 0
	
                 wait;					-- Waiting for ever. End of test.
       
       end process;						-- End of process.
end;									-- End of test bench.
