-- Engineer: Daniyal Naeem
-- Following is the test bench code for a 4-bit Adder/Subtractor.

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity fourbit_adderSUB_tb is
end fourbit_adderSUB_tb;

-- Defining the architecture to use in the test bench to test the 4-bit adder/subtractor.
architecture fourbit_adderSUB_arch of fourbit_adderSUB_tb is 

-- Defining the component of the 4-bit adder/subtractor entity.
component four_bit_addSUB is
port (
        InA : in std_logic_vector(3 downto 0);
        InB : in std_logic_vector(3 downto 0);
        Control : in std_logic;
        Sum : out std_logic_vector(3 downto 0);
        C_out : out std_logic
		);	
			
end component;	-- End of the component definition.

-- Input signals declared to be used during verification.
signal InA :  std_logic_vector(3 downto 0) := "0000";
signal InB :  std_logic_vector(3 downto 0) := "0000";
signal Control : std_logic := '0';
	
-- Output signals declared to be used during verification.
signal Sum :  std_logic_vector(3 downto 0);
signal C_out :  std_logic;

begin

-- Instantiate the Unit Under Test (UUT)
	uut: four_bit_addSUB PORT MAP(
		InA => InA,
		InB => InB,
		Control => Control,
		Sum => Sum,
		C_out => C_out
	);

-- Beginning of the simulation of the 4-bit adder/subtractor via different inputs.
tb : process
begin
	
	-- Control = 0 we have adder. Control = 1 we have subtractor.
	wait for 100 ns;	-- Waiting 100 nano seconds before testing first set of values.
	InA <= "1000";  	
    InB <= "0110";  	-- Verifying 4-bit adder with the following inputs.
    Control <= '0';  
    
    wait for 100 ns;  	-- Waiting 100 nano seconds before testing second set of values.
	InA <= "1011";  
    InB <= "0101";  	-- Verifying 4-bit adder with the following inputs.
    Control <= '0';  	
           
    wait for 100 ns;  	-- Waiting 100 nano seconds before testing third set of values.
    InA <= "0100";  
    InB <= "0011";  	-- Verifying 4-bit subtractor with the following inputs.
    Control <= '1'; 
           
	wait for 100 ns;  	-- Waiting 100 nano seconds before testing fourth set of values.
    InA <= "0111";  
    InB <= "0010";  	-- Verifying 4-bit subtractor with the following inputs.
    Control <= '1';  
 	
	wait;		-- End of test. Waiting forever.
	
	end process;	-- End of process.

end; -- End of test bench code.
