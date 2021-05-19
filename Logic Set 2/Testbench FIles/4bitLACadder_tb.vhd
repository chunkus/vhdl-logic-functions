library IEEE;		-- Defining the library to be used.
use ieee.std_logic_1164.all;

entity four_bit_LAC_tb is		-- Defining the entity.
end four_bit_LAC_tb;			-- Ending of the entity.


-- Defining the architecture of the test bench file.
architecture fourbitLAC_arch of four_bit_LAC_tb is
	component LAC4bitAdd is		-- Using as a component the entity of the 4-bit LAC adder.
	port (
			InA : in std_logic_vector (3 downto 0); 
			InB : in std_logic_vector (3 downto 0); 
			C_in : in std_logic;							
			Sum : out std_logic_vector (3 downto 0);		
			C_out : out std_logic
			);

end component;		-- Ending of the 4-bit LAC adder component.

-- Input signals to of the 4-bit LAC to be used, based on diagram.
signal InA : std_logic_vector (3 downto 0) := "0000"; 
signal InB : std_logic_vector (3 downto 0) := "0000"; 
signal C_in : std_logic := '0'; 

-- Output signals to of the 4-bit LAC to be used, based on diagram.
signal Sum : std_logic_vector (3 downto 0); 
signal C_out : std_logic;

begin
	-- Instantiating the Unit Under Test (UUT).
	UTT: LAC4bitAdd port map (InA=>InA, InB=>InB, C_in=>C_in, Sum=>Sum, C_out=>C_out);

-- Beginning of the process needed to verify the functionality of the 4-bit LAC adder.
test_bench: process 	
begin
	
	wait for 100 ns;	-- Waiting 100 nano seconds before testing first set of values.
	InA <= "0000";  	
    InB <= "0000";  	-- Verifying 4-bit LAC adder with the following inputs.
    C_in <= '0';  
    
    wait for 100 ns;  	-- Waiting 100 nano seconds before testing second set of values.
	InA <= "0000";  
    InB <= "0001";  	-- Verifying 4-bit LAC adder with the following inputs.
    C_in <= '0';  	
           
    wait for 100 ns;  	-- Waiting 100 nano seconds before testing third set of values.
    InA <= "0001";  
    InB <= "0001";  	-- Verifying 4-bit LAC adder with the following inputs.
    C_in <= '0'; 
           
	wait for 100 ns;  	-- Waiting 100 nano seconds before testing fourth set of values.
    InA <= "0011";  
    InB <= "0011";  	-- Verifying 4-bit LAC adder with the following inputs.
    C_in <= '1';  
 	
 	wait for 100 ns;  	-- Waiting 100 nano seconds before testing fifth set of values.
    InA <= "1111";   
    InB <= "0001";  	-- Verifying 4-bit LAC adder with the following inputs.
    C_in <= '1';  
    
    wait for 100 ns;  	-- Waiting 100 nano seconds before testing sixth set of values.
    InA <= "1111";  
    InB <= "0101";  	-- Verifying 4-bit LAC adder with the following inputs.
    C_in <= '1'; 
	
	wait;		-- End of test. Waiting forever.
	
	end process;	-- End of process.

end; -- End of test bench code.
