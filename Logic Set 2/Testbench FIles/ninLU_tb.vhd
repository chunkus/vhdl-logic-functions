-- Saying what librarys are being used
 LIBRARY ieee;  
 USE ieee.std_logic_1164.ALL;
  
  --Creating the entity 
 ENTITY nbitlogicunittestbench IS  
 END nbitlogicunittestbench;  

--Defing the architechture for the entity created
 ARCHITECTURE behavior OF nbitlogicunittestbench IS   
   -- Component Declaration for the Unit Under Test (UUT)  
   COMPONENT nbitlogicunit  
   PORT(  
      	InA : IN std_logic_vector(3 downto 0);  
      	InB : IN std_logic_vector(3 downto 0);  
      	control : IN std_logic_vector(1 downto 0);  
      	output : OUT std_logic_vector(3 downto 0)  
     	);  
   END COMPONENT;  
   
   --Inputs  
   signal InA : std_logic_vector(3 downto 0) := (others => '0');  
   signal InB : std_logic_vector(3 downto 0) := (others => '0');  
   signal control : std_logic_vector(1 downto 0) := (others => '0');  
   
   --Outputs  
   signal output : std_logic_vector(3 downto 0);  
   
   -- No clocks detected in port list. Replace <clock> below with   
   -- appropriate port name   
   constant clock_period : time := 10 ns;  
 
 BEGIN  
	-- Instantiate the Unit Under Test (UUT)  
   uut: nbitlogicunit PORT MAP (  
      InA => InA,  
      InB => InB,  
      control => control,  
      output => output  
     );  

   -- Here we are defining the clock definitions
   stim_proc :process  
   begin  
       
       wait for 100 ns; -- wait for global reset  
  	   InA <= "0000"; -- check not gate input 0 output 1  
  	   control <= "00";   
  	   
  	   wait for 100 ns; -- wait for global reset  
  	   InA <= "1111"; --and gate output should be 1110  
  	   InB <= "1110";  
  	   control <= "01"; 
  	   
  	   wait for 100 ns;  
  	   InA <= "1101"; -- xor gate output should be 1100   
  	   InB <= "0001";  
  	   control <= "10";  
  	   
  	   wait for 100 ns; -- wait for global reset  
  	   InA <= "1010"; -- or gate output should be 1011  
  	   InB <= "1011";  
  	   control <= "11"; 
       
       wait; 	-- End of test. Waiting forever.
        
   end process;  

END;  --The end of the testbench
