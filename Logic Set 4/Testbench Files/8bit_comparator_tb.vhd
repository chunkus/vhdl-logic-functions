library IEEE;	-- Libraries to be used.
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Declaring entity.
entity eightbit_comparator_tb is
end eightbit_comparator_tb;

-- Defining entity.
architecture behavior of eightbit_comparator_tb is 

-- Component Declaration for the Unit Under Test (UUT) (8-bit comparator).
component eightbit_comparator 
port ( 
		InA : in std_logic_vector(7 downto 0);
        InB : in std_logic_vector(7 downto 0);
        Output : out std_logic
    );
    
end component; 

-- Input signals to test.
signal InA : std_logic_vector(7 downto 0) := (others => '0');
signal InB : std_logic_vector(7 downto 0) := (others => '0');

-- Output signal to test.
signal Output : std_logic;

begin 
    -- Instantiate the Unit Under Test (UUT)  
   uut: eightbit_comparator port map (
         InA => InA,
         InB => InB,
         Output => Output
         );

-- Following is the truth table for a comparator.
--	A	B	:	A<B	 A=B  A>B
------------:------------------
--	0	0	:	 0	  1	   0	
--	0	1	:	 1	  0	   0		
--	1	0	:	 0	  0	   1		
--	1	1	:	 0	  1	   0		
	

-- Verifying functionality of test bench.  
   test_bench: process  
   begin            

            wait for 100 ns;
            InA <= "10101010";	-- Verifying if output is 1 (the two inputs are the same).
            InB <= "10101010";
            
            wait for 100 ns;
            InA <= "01100110";	-- Verifying if output is 0 (the two inputs are different).
            InB <= "11011010";
            
            wait;	-- End of test. Waiting forever.
        
  end process;	-- End of process.

end;  -- End of test bench code.          
