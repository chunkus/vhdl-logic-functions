-- Engineer: Youssef Akil
-- The following code represents the test bench code of the 1-bit logic function bit-slice.

 LIBRARY ieee;  	-- Defining the library to be used.
 USE ieee.std_logic_1164.all;  
 
 ENTITY bitslicer IS  -- Defining entity of test bench.
 END bitslicer;  
 
 -- Defining architecture of the test bench (to verify bit-slice functionality).
 ARCHITECTURE bitslicer_arch of bitslicer IS   
   
   -- Using as component the entity of the bit-slice defined in the vhd source code.
   COMPONENT onebitlogicslice  
   PORT(  
      a : IN std_logic;  
      b : IN std_logic;  
      cntrl : IN std_logic_vector (1 downto 0);  
      output : OUT std_logic  
     );  
     
   END COMPONENT;  
   
   -- Input signals to verify functionality of bit-slice.  
   signal a : std_logic := '0';  
   signal b : std_logic := '0';  
   SIGNAL control : std_logic_vector(1 downto 0) := (others=>'0');  
  
   -- Output signal to verify functionality of bit-slice.
   signal output : std_logic;  
  
 BEGIN  
   -- Instantiate the Unit Under Test (UUT)  
   uut: onebitlogicslice PORT MAP (  
      a => a,  
      b => b,  
      cntrl => control,  
      output => output
     );  
   
   -- Beginning of test to verify functionality of bit-slice.
   stim_proc: process  
   begin            
   
	-- Holds reset state for 100ns.  
	-- Verifying first set of inputs.
  	wait for 100 ns;
  	control <= "00";  
  	a <= '0'; -- check NOT gate input 0 output 1.  
  	
  	-- Waiting 100 ns before verifying second set of inputs.
  	wait for 100 ns; 
  	control <= "01"; 
  	a <= '1'; -- check 1 AND 1 = 1.
  	b <= '1';  
  	
  	-- Waiting 100 ns before verifying third set of inputs.
  	wait for 100 ns;  
  	control <= "10";
  	a <= '1'; -- -- check 1 XOR 0 = 1    
  	b <= '0';  
  	
  	-- Waiting 100 ns before verifying fourth set of inputs.
  	wait for 100 ns;   
  	control <= "11";       
 	a <= '1'; -- check 1 OR 1 = 1    
  	b <= '1';  
  	
  	wait;	-- End of test. Waiting forever.
   	
   	end process;  -- End of test bench verification process.
 
 END;  -- End of test bench.