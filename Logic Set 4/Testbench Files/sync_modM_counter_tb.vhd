-- Company : Queen Mary University 
-- Engineer : Aditya Ajaykumar
-- Date : 26 February 2019
-- Module : lab4_countersyncresettb
-- project : Lab4_DSD_countersyncresettb

-- Test bench code for an 8-bit modulo-m counter with synchronous reset.

library ieee; 	-- Including libraries.
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Declaration of entity of test bench.
entity countersyncresettb is
end countersyncresettb;

-- Architecture definition.
architecture behaviour  of countersyncresettb is

-- Component Declaration for the Unit Under Test (UUT)  
    component  syncModMCount
    Port ( 
    input : in STD_LOGIC_VECTOR (3 downto 0);  
       countenable : in STD_LOGIC;  
       CLK : in STD_LOGIC := '0';  
       reset : in STD_LOGIC;  
       Q_Out : inout STD_LOGIC_VECTOR(3 downto 0));  
 end component ;

-- Input signals to be used as testing purpose.
    signal input : std_logic_vector(3 downto 0);-- := "0100";   
    signal count_enable : std_logic := '0';
    signal CLK : std_logic := '0';  
    signal reset :  std_logic := '0';

-- Output signal to be used as testing purpose.
    signal Q_Out : std_logic_vector (3 downto 0); 
          
begin

-- Instantiating the unit under test.
uut : syncModMCount port map (input=>input, countenable=>count_enable, CLK=>CLK, reset=>reset, Q_Out=>Q_Out);

-- Assigning a period of 100 nano seconds to the clock signal.
CLK<= not CLK after 25 ns;

-- Beginning of test bench to test device.
test_bench : process
begin
	
	-- For the truth table of this device there isn't really one. The way it works however, is the following:
	-- when setting the count_enable pin to '1' and assigning an input (i.e. 7) to the input pin 'input', what the device will do is 
	-- count up (starting from 0) to that number (showing it on the output) specified on the input pin and then once it reaches it, it will 
	-- reset the output to '0' and start counting up again. The counting up happens every time on the rising edge of the clock.
	-- If the reset pin however, is set to 1 then the output will be '0'.
	
	-- Waiting for global reset.
	--reset<='1';		-- Reset pin is '1' thus output is '0'.
	--wait for 50ns;
	--reset<='0';		-- Reset pin is '1' thus output is '0'.
    
	wait for 50 ns;
    input<="0011";	-- Counting up to 6, always starting from '0'.

	count_enable<='1';	-- Enabling counting up.
	--input<="00000100";	-- Counting up to 6, always starting from '0'.
	--wait for 300 ns;	-- Wait for 100 nano seconds.
	--input<="00001100";	-- Now changing to count up to 12, always starting from '0'.
	
	--wait for 100 ns;
	
	wait;	-- End of test. Wait forever.
	
	end process;	-- End of process.

end;	-- End of test bench code.