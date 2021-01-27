-- Engineer: Daniyal Naeem
-- The following code is the test bench code of an n-bit 2-input MUX.

library ieee;  	-- Defining library to use.
use ieee.std_logic_1164.all;  
 

entity nBit2InMuxTB is  -- Defining entity of the n-bit 2-input MUX test bench.
end nBit2InMuxTB;  -- End of test bench entity.

-- Defining the architecture of the n-bit 2-input MUX test bench (to verify its 
-- functionality).
architecture behavior of nBit2InMuxTB is   

-- Component Declaration of the n-bit 2-input MUX.  
component nbittwoinputmux  
port(  
      InA : IN std_logic_vector(3 downto 0);  
      InB : IN std_logic_vector(3 downto 0);  
      Control : IN std_logic;  
      Output : OUT std_logic_vector(3 downto 0)  
     );  
   
end component;  -- End of the component defined.
   
--Input signals used to verify functionality of the n-bit 2-input MUX.
signal InA : std_logic_vector(3 downto 0) := (others => '0');  
signal InB : std_logic_vector(3 downto 0) := (others => '0');  
signal Control : std_logic := '0';  
   
--Output signal used to verify functionality of the n-bit 2-input MUX.
signal Output : std_logic_vector(3 downto 0);  

begin  
-- Instantiate the Unit Under Test (UUT).  
   uut: nbittwoinputmux port map (  
      InA => InA,  
      InB => InB,  
      Control => Control,  
      Output => Output  
     );  
   
-- Defining the verification process to verify n-bit 2-input MUX functionality.   
stim_proc: process  
begin            
	
	-- hold reset state for 100 ns.  
    wait for 100 ns;       -- Waiting 100 nano seconds before verify first set of inputs.
    InA <= "0001";  
    InB <= "0011";  
    Control <= '0';  
    wait for 100 ns;       -- Waiting 100 nano seconds before verify second set of inputs.
    InA <= "0110";  
    InB <= "1011";  
    Control <= '0';  
    wait for 100 ns;       -- Waiting 100 nano seconds before verify third set of inputs.
    InA <= "1110";  
    InB <= "0001";  
    Control <= '1';  
    wait for 100 ns;  	   -- Waiting 100 nano seconds before verify fourth set of inputs.
    InA <= "1101";  
    InB <= "0101";  
    Control <= '1';  
    
    wait;  	-- End of test. Waiting forever.
    
end process;  	-- End of process to verify n-bit 2-input MUX functionality.
end;  			-- End of the test bench.
