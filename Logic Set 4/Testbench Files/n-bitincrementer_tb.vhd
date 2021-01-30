-- Engineer: Youssef Akil

-- This source code is the test bench for the n-bitincrementer
 
 library ieee;  -- Including library.
 use ieee.std_logic_1164.ALL;  
 
 --Creating the entity 
 entity n_bitincrementer_tb is 
 end n_bitincrementer_tb;  
 
 --Defing the architechture for the entity created
 architecture behavior of n_bitincrementer_tb is 
   
 --Calling upon the original component
   component n_bitincrementer  
   port(  
     ina : in STD_LOGIC_VECTOR (3 downto 0);  
       c_in : in STD_LOGIC;  
       sum : out STD_LOGIC_VECTOR (3 downto 0);  
       c_out : out STD_LOGIC);  
   end component;
   
   --Input signals used to test the device.
   signal ina : std_logic_vector(3 downto 0) := "0000";  
   signal c_in : std_logic := '0';  
   
   --Output signals used to test the device.
   signal sum: std_logic_vector(3 downto 0);  
   signal c_out : std_logic := '0';  
  
   begin  
   -- Instantiating the unit under test.
   uut : n_bitincrementer PORT MAP (ina => ina, c_in => c_in, sum=> sum, c_out => c_out);  
  
   -- The way the device works is that we initially assign an input to the input pin (ina). From there
   -- based on the value of the carry in input (c_in), the output will display an incremented value of the
   -- ina value. ina will be incremented if c_in is '1', otherwise it will leave ina unchanged if c_in is '0'.
   
   -- Following is the truth table for the half adder used as a component in the n-bit incrementer.
   
   --	INPUT		 OUTPUT
   --  A     B	:  SUM	 CARRY
   -------------:---------------
   --  0     0  :   0      0
   --  0     1  :   1      0
   --  1     0  :   1      0
   --  1     1  :   0      1

   test_bench : process
   begin
   		
   		-- Waiting for global reset.
   		wait for 100 ns;
   		ina<="0110";	-- Input value is 6.
   		c_in<='1';		-- c_in is '1' thus ina is incremented by 1, so to become 7.
   		
   		wait for 100 ns;
   		c_in<='0';		-- c_in is '0' so ina is unchanged.
   		
   		wait for 100 ns;
   		ina<="1010";	-- Input value is now 10.
   		c_in<='1';		-- c_in is '1' thus ina is incremented by 1, so to become 11.
   		
   		wait for 100 ns;
   		c_in<='0';		-- c_in is '0' so ina is unchanged.
   	
        wait; -- End of test wait forever.
          
   end process;  -- End of process.

END; -- End of test bench code.