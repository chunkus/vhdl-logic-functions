-- Engineer: Youssef Akil

-- The following code is the test bench code for an 4 Bit Shift Register.

library ieee;	-- Defining the library to be used.
use ieee.std_logic_1164.all;

entity fourbitshiftreg_tb is	-- Defining the test bench entity.
end fourbitshiftreg_tb;	-- End of the test bench architecture.

-- Defining the architecture of the n-bit register's test bench.
architecture arch_2bitshiftreg_tb of fourbitshiftreg_tb is

-- Defining the component of the n-bit register used in this test bench to check its 
-- functionality.
component fourbitlinear_feedback_shiftreg is
port (	clk : in STD_LOGIC;  
       reset : in STD_LOGIC;  
       preset : in STD_LOGIC;  
       output : inout STD_LOGIC_VECTOR (3 downto 0)
	 );

end component;

-- Input signals used for the test bench.
signal clk: std_logic := '0';
signal reset : std_logic := '0';
signal preset : std_logic := '0';

-- Output signals used for the test bench.
signal output : std_logic_vector (3 downto 0);


begin 
-- Instantiating the Unit Under Test (UUT).
UUT : fourbitlinear_feedback_shiftreg port map (CLK=>clk, reset=>reset, preset=>preset, output=>output);

-- Assigning the clock a period of 100 nano seconds.
clk <= not clk after 50 ns;

-- Following is the truth table for a 4-bit linear feedback shift register.
-- 	CLK	   Preset  Reset   :  Output
---------------------------:------------  
--  x	 	  1		  0    : 1111
--  x	 	  x		  1    : 0000


-- Beginning process to verify functionality of the 4-bit linear feedback shift register.
test_bench : process
begin
	wait for 100 ns;
    reset <= '1';	-- Setting reset pin to 1 after 100 nano seconds.
    
    wait for 100 ns;
    reset <= '0';	-- Setting reset pin to 0 after 100 nano seconds.
    
    wait for 100 ns;
    preset <= '1';	-- Setting preset pin to 1 after 100 nano seconds.
    
    wait for 100 ns;
    preset <= '0';	-- Setting preset pin to 0 after 100 nano seconds.
    
    wait;	-- End of test. Wait forever.
    
end process;	-- End of testing.

end;	-- End of the test bench code. 



