library IEEE;
Use IEEE.std_logic_1164.all;

entity or_gate_test_bench is 		-- Creating the entity for the test bench.
end or_gate_test_bench;

-- Creating the architecture which will contain the component of the myor.vhd file.
architecture test_arch of or_gate_test_bench is 
component myor						-- Stating the component to be used in the test bench.
Port ( 
          A : in std_logic;
          B : in std_logic;
          F : out std_logic);
end component;

-- Input signals to be used.
signal sig_a : std_logic := '0';
signal sig_b : std_logic := '0';

-- Output signal to be used.
signal sig_f : std_logic;

begin 

-- Instantiating the unit under test (uut).
uut: myor port map (sig_a, sig_b, sig_f);


tb : process
      begin
      
    -- ********************************************** --	
            -- truth table for a OR gate:
    
            --    a    b  :  f
            --------------:-----
            --    0     0 :  0
            --    0     1 :  1
            --    1     0 :  1
            --    1     1 :  1
    
            -- input test signals of the correct values to 
            -- sig_a and sig_b at 100ns intervals to check
            -- that sig_f gives the expected output.
    -- ********************************************** --
		wait for 100 ns;		-- Waiting for global reset.
		sig_a <= '0';		
		sig_b <= '0';		-- Checking 0 OR 0 = 0.
                
		wait for 100 ns;
		sig_a <= '0';
		sig_b <= '1';		-- Checking 0 OR 1 = 1.
                
		wait for 100 ns;
		sig_a <= '1';
		sig_b <= '0';		-- Checking 1 OR 0 = 1.
                
		wait for 100 ns;
		sig_a <= '1';
		sig_b <= '1';		-- Checking 1 OR 1 = 1.
		
		wait;				-- End of test. Will wait forever.
       
    	end process;		-- End of process (tb).
end;						-- End of test bench.
