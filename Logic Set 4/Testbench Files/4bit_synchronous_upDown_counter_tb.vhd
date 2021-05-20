library IEEE;	-- Libraries to be used.
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Declaring the entity.
entity fourbit_updown_tb is 
end fourbit_updown_tb;	-- End of the entity.

-- Defining architecture of the test bench.
architecture behavior of fourbit_updown_tb is 

-- Adding component to be used as Unit Under Test (UUT).
component fourbit_updown
Port ( 
		  N_count : in std_logic_vector(3 downto 0);
          down_up : in std_logic;
          CLK : in std_logic;
          reset : in std_logic;
          Q_outputs : inout std_logic_vector(3 downto 0));
end component;	-- End of the component.

-- Input signals to be used to test the device. 
signal N_count : std_logic_vector(3 downto 0) := (others => '0');
signal down_up : std_logic := '0';
signal CLK : std_logic := '0';
signal reset : std_logic := '0';

-- Output signal to be used to test the device.
signal Q_outputs : std_logic_vector(3 downto 0);

begin 

 -- Instantiate the Unit Under Test (UUT).  
uut: fourbit_updown port map (
N_count => N_count, 
down_up => down_up,
CLK => CLK, 
reset => reset,
Q_outputs => Q_outputs
);

-- Giving the clock a period of 100 nano seconds.
CLK <= not CLK after 50 ns;

-- The way the device works is that if its 
-- reset pin is set to '1' then the output will be '0'. If instead reset where to be '0' based
-- on what combination we have on the down_up and N_count pin we will have a certain output.
-- This is :
-- Setting down_up to '0' will have the device count up from 0 to 15 by multiples of the number
-- set on N_count (displayed on the output).
-- Setting down_up to '1' will have the device count down from 15 to 0 by multiples of the number
-- set on N_count (displayed on the output).

-- Following is the truth table of the D-flip-flop with asynchronous reset and preset, used in 
-- the n-bit register, which is used in this device.

-- NOTE: 
-- 'UP' indicates rising edge of clock signal.
-- 'LQ' indicates 'Last Q'.
-- 'LQB' indicates 'Las Q_bar'.

-- 	CLK	 D  Preset  Reset  :  Q  Q_bar
---------------------------:------------
--   UP	 0	  0		  0    :  0    1
--   UP	 1	  0		  0    :  1    0
--   0	 x	  0		  0    :  LQ   LQB
--   1	 x	  0		  0    :  LQ   LQB
--   x	 x	  1		  0    :  1    0
--   x	 x	  x		  1    :  0    1


-- Beginning of the process to verify the functionality of the device.
test_bench: process
begin 

         wait for 100 ns;
         reset <= '1';	-- Setting the output to zero, since reset is 1.
         
         wait for 100 ns;
         reset <= '0';	-- Setting reset pin to '0'.
         
         wait for 100 ns;
    	 down_up <= '0';	-- Down_up is '0' thus we are counting up.
         N_count <= "0010";	-- Counting up from 0 to 15 by multiples of 2.
         
         wait for 400 ns;
         down_up <= '1';	-- Down_up is '1' thus we are counting down.
         N_count <= "0011";	-- Counting down from 15 to 0 by multiples of 3.
		 
		 wait;	-- End of test. Waiting forever.
		 
end process;	-- End of the process to test the test bench.

end;	-- End of the test bench code.
