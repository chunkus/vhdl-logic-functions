--------------------------------------------------------------------------------
-- Engineer: Tobi Adebari
-- The following code is Test Bench code for testing the source code of a 4-bit Arithmetic
-- Unit.
--------------------------------------------------------------------------------

-- Saying what librarys are being used
 library ieee;  
 use ieee.std_logic_1164.all;  

--Creating the entity 
 entity four_bit_arithmetic_unit_tb is  
 end four_bit_arithmetic_unit_tb;  
 
--Defing the architechture for the entity created
 architecture behavior of four_bit_arithmetic_unit_tb is   
 
 --Creating the subcircuit/component used
   component four_bit_arithmetic_unit  
   port(  
      InA : in std_logic_vector(3 downto 0);  --Creating the ports for the component
      InB : in std_logic_vector(3 downto 0);  
      Control : in std_logic_vector(1 downto 0);  
      Sum : out std_logic_vector(3 downto 0);  
      C_out : out std_logic  
     );  
   end component;  

   --inputs  
   signal InA : std_logic_vector(3 downto 0) := (others => '0');  
   signal InB : std_logic_vector(3 downto 0) := (others => '0');  
   signal control : std_logic_vector(1 downto 0) := (others => '0');  

   --outputs  
   signal sum : std_logic_vector(3 downto 0);  
   signal c_out : std_logic;  

 begin  
 
   -- Declaring the unit which we are simulating
   uut: four_bit_arithmetic_unit port map (   
      InA => InA,  
      InB => InB,  
      Control => control,  
      Sum => sum,  
      C_out => c_out  
     );  

   -- starting process  
   start_proc: process  
   begin    
   
   	-- Following is the truth table of how a 4-bit arithmetic unit should function.
   	        
   	--  CONTROL : OPERATION  
 	--  C1 C0     
 	--  0 0    	  ADD 1 to input A  
 	--  0 1    	  ADD input A + input B  
 	--  1 0    	  SUB 1 to input A  
 	--  1 1    	  SUB input A - input B
   
    -- hold reset state for 100 ns.  
    	   wait for 100 ns;       
           Control <= "00";          -- test Inc A by 1 
           InA <= "0000";  
           
           wait for 100 ns;  
           Control <= "01";          -- test A + B  
           InA <= "0001";  
           InB <= "1111";  
           
           wait for 100 ns;  
           Control<= "10";           -- test Dec A  
           InA <= "1110";  
           InB <= "0000";  
           
           wait for 100 ns;  
           Control <= "11";          -- test A - B  
           InA <= "1111";  
           InB <= "0001";  
           
    wait;  -- End of test. Waiting forever.               
   
   end process;  -- End of test process.

 end;  	-- End of test bench testing.