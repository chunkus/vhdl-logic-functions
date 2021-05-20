library ieee; 	-- Including library to be used.
use ieee.std_logic_1164.all;

-- Entity declaration of the test bench.
entity modMCounter_tb2 is
end modMCounter_tb2;	-- End of the test bench entity.

-- Architecture definition.
architecture behaviour  of modMCounter_tb2 is

-- Component Declaration for the Unit Under Test (UUT)  
	component  asyncModMCount
   Port ( 
   		input : in STD_LOGIC_VECTOR (7 downto 0);  
       countEnable : in STD_LOGIC;  
       CLK : in STD_LOGIC;  
       reset : in STD_LOGIC;  
       Q_Out : out STD_LOGIC_VECTOR (7 downto 0));
    
    end component;	-- End of component.

	-- Input signals to test functionality of the device.
 	signal input : std_logic_vector(7 downto 0) := "00000000";  
 	signal countEnable : std_logic := '0';
	signal CLK : std_logic := '0'; 
	signal reset : std_logic := '0';
	
	-- Output signal to test functionality of the device.
    signal Q_Out : std_logic_vector (7 downto 0); 

begin 
-- Instantiating the unit under test (uut).
UUT : asyncModMCount port map (input=>input, countEnable=>countEnable, CLK=>CLK, reset=>reset, Q_Out=>Q_Out);

-- Assigning a 100 nano second period to clock.
CLK <= not CLK after 50 ns;

-- Beginning of process to verify functionality of device.
test_bench : process 
begin
	
	-- For this device there isn't a real truth table which we can use to verify the correct functionality,
	-- however, the way the device works is the following:
	-- when setting the countEnable pin to '1' and assigning an input (i.e. 7) to the input pin 'input', what the device will do is 
	-- count up to 'input - 1' (showing it on the output). For instance, assigning an input of 7 will have the device count up to 
	-- 7-1, which is 6. The count will always start from 0 though. Once the device reaches the 'input - 1' number, it will reset 
	-- its output to '0' and start counting up again. The counting up happens every time on the rising edge of the clock.
	-- If the reset pin however, is set to 1 then the output will be '0'.
	
	-- Waiting for global reset.
	wait for 100 ns;
	countEnable<='1';	-- Enabling the counting up.
	input<="00000011";	-- The input is 3, thus the device will count up to 2, starting from 0.
	
	wait for 100 ns;
	input<="00001001";	-- The input is 9, thus the device will count up to 8, starting from 0.
	
	wait for 100 ns;
	reset<='1';		-- Reset pin is set to '1' thus the output will display '0'.
	
	wait;	-- End of test. Waiting forever.
	
end process;	-- End of process.

end;	-- End of test_bench code.
