 -- Engineer: Youssef Akil 

-- Following is the source code of the n-bit incrementer
-- main source code.

 library IEEE;  -- Defining the library to be used for the code.
 use IEEE.STD_LOGIC_1164.ALL;   
 
 -- Definition of the entity.
 entity n_bitincrementer is
 generic(n : positive := 4);  -- Using generic for the n bits and for the flexibility.
   Port ( 
   		-- Stating the ports of the device.
		-- Input port: ina c_in.
		-- Output ports: sum, c_out 
   	   ina : in STD_LOGIC_VECTOR (n-1 downto 0);  
       c_in : in STD_LOGIC;  
       sum : out STD_LOGIC_VECTOR (n-1 downto 0);  
       c_out : out STD_LOGIC);  
 
 end n_bitincrementer;  -- End of entity.
 
 architecture n_bitincrementer_output of n_bitincrementer is --Beginning of architecture
   
 component lab1_half_adder   --Start of the halfadder component needed from a previous lab
   Port ( 
   	   A : in STD_LOGIC;  
       B : in STD_LOGIC;  
       S : out STD_LOGIC;  
       C : out STD_LOGIC);  
 end component;  --End of halfadder copmenent
 
 -- Intermediate signal declared.
 signal carrytob:std_logic_vector(n-2 downto 0);  

 begin  
 --Port mapping the entity with the component used with the use of For generate statement
 -- which have if statements incorporated in them.
 
 for_generate : for i in n-1 downto 0 generate  -- For loop to consider different instances of i
 	
 	-- If generate to port map the halfadder(0).
 	if1 : if i=0 generate  
 		instance1 : lab1_half_adder port map (A=>ina(i), B=>c_in, S=>sum(i), C=>carrytob(i));  
 	end generate;  -- End of first if statement.
 
 	-- If generate to port map the halfadder(1) and halfadder(2).
 	if2 : if i/=0 and i/=n-1 generate  
 		instance2 : lab1_half_adder port map(A=>ina(i), B=>carrytob(i-1), S=>sum(i), C=>carrytob(i));  
 	end generate;  -- End of second if statement.
 
 	-- If generate to port map last half adder.
 	if3 : if i=n-1 generate  
 		instance3 : lab1_half_adder port map(A=>ina(i), B=>carrytob(i-1), S=>sum(i), C=>c_out);  
 	end generate;  -- End of third if statement.
 
 end generate;  -- End of for generate statement

end n_bitincrementer_output;  --End of architecture