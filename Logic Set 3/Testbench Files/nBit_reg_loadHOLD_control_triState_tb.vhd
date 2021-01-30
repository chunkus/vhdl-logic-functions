-- Company : Queen Mary University 
-- Engineer : Aditya Ajaykumar
-- Date : 14 February 2019
-- Module : lab3_nbitregloadholdcontroltristatetest
--project : Lab3_DSD_nbitregloadholdcontroltristatetest

-- Following code is the test bench code for an n-bit register with load/hold control and tri state enable output.

LIBRARY ieee;  -- Defining the library to be used with the code.
 USE ieee.std_logic_1164.ALL;  
 
 -- Declaring the entity of the test bench.
 ENTITY nbitregloadholdtristatebuffertest IS  
 END nbitregloadholdtristatebuffertest;  -- End of the test bench entity.
 
 -- Defining the architecture of the test bench.
 ARCHITECTURE behavior OF nbitregloadholdtristatebuffertest IS   
   
   -- Component Declaration for the Unit Under Test (UUT).
   COMPONENT nbitregloadholdcontroltristate  
   PORT(  
      dinputs : IN std_logic_vector(3 downto 0);  
      loadhold : IN std_logic;  
      CLK : IN std_logic;  
      reset : IN std_logic;  
      outputenable : IN std_logic;  
      qoutputs : OUT std_logic_vector(3 downto 0)  
     );  
   END COMPONENT;  -- End of the Unit Under Test (UUT) component.
   
   --Input signals used for the test bench. 
   signal dinputs : std_logic_vector(3 downto 0) := (others => '0');  
   signal loadhold : std_logic := '0';  
   signal CLK : std_logic := '0';  
   signal reset : std_logic := '0';  
   signal outputenable : std_logic := '0';  
   
   -- Output signal used for the test bench.
   signal qoutputs : std_logic_vector(3 downto 0);  
   
   -- Clock period definition.  
   constant CLK_period : time := 50 ns;  
 
 BEGIN  
      -- Instantiating the Unit Under Test (UUT)  
   uut: nbitregloadholdcontroltristate PORT MAP (  
      dinputs => dinputs,  
      loadhold => loadhold,  
      CLK => CLK,  
      reset => reset,  
      outputenable => outputenable,  
      qoutputs => qoutputs  
     );  
     
  -- Process for the definition of the clock's functioning.
  clk_process :process  
   begin  
           CLK <= '0';  
           wait for CLK_period/2;  
           CLK <= '1';  
           wait for CLK_period/2;  
   end process;  -- End of the clock's process.
   
   -- Process to verify the device's working.  
   stim_proc: process  
   begin            
    
    wait for 100 ns;       
 	outputenable <= '0';  -- outputenable is '0' thus the output is the high impedance 'Z'.
    dinputs <= "1001" ;   -- The following inputted input won't be displayed in the output.
    
    wait for 100 ns;       
    outputenable<='1';    -- outputenable is '1' thus output will display previous inputted value (1001) once loaded.
    loadhold <= '1';  	  -- loadhold is '1' so the inputted value will be loaded .
    
    wait for 100 ns;        
    loadhold <= '0';  	  -- Previously inputted value is held.
      
    wait for 100 ns;        
    outputenable<='0';    -- outputenable is '0' thus the output is the high impedance 'Z'.
    loadhold <= '0';  	  -- This high impedance will be held since loadhold is '0'.
    
    wait for 100 ns;        
    outputenable<='1';    
    loadhold <= '0';  	  
    
    wait for 100 ns;       
    reset <= '1';  -- Resetting output to '0'.
    
    wait for 100 ns;        
    reset <= '0';  -- Setting reset pin to '0', nothing is affected on the output.

    wait; 	-- End of test. Waiting forever. 
   
   end process;  -- End of testing.
 
 END;  -- End of the test bench.
