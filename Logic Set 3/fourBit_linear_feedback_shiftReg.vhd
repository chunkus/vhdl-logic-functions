library IEEE;  -- Including the standard library IEEE.
 use IEEE.STD_LOGIC_1164.ALL;  
 entity fourbitlinear_feedback_shiftreg is  
 --List of inputs and outputs neccesary for fourbitlinear_feedback_shiftreg 
 --input signals are as follows: clk, reset, preset
 --input/out (inout) meaning the port is bidirectional is the port output.
 generic (n : positive := 4);  
   Port ( clk : in STD_LOGIC;  
       reset : in STD_LOGIC;  
       preset : in STD_LOGIC;  
       output : inout STD_LOGIC_VECTOR (n-1 downto 0));  -- Made as a vector as output is 4 bits.
 end fourbitlinear_feedback_shiftreg;  
 architecture Behavioral of fourbitlinear_feedback_shiftreg is  
 
 component myxor --Begnning of XOR Gate Component 
 Port ( A : in STD_LOGIC;  
       B : in STD_LOGIC;  
       F : out STD_LOGIC);  
 end component;  --End of XOR Gate Component 
 component nbit_shiftreg --Begnning of Nbit shift register Component 
generic (n : positive :=4); 
 Port( 		
 		   shift_in : in std_logic;
           CLK : in std_logic;
           reset : in std_logic;
           preset : in std_logic;
           Q_shift : out std_logic_vector(n-1 downto 0));
end component; --End of Nbit shift register Component 
 signal toreg: std_Logic;  
 begin  
 
 --Mapping ports for XOR gate component (Note that output is used twice as it takes the output of the main device (although different bits of the output).
 A: myxor port map(A=>output(n-1), B=>output(n-2),F=>toreg);  
														
--Mapping ports for n-bit shift register component
 B: nbit_shiftreg port map(shift_in=>toreg,CLK=>clk,reset=>reset,preset=>preset,Q_shift=>output); 
 
end Behavioral;   -- End of the architecture of the device.
