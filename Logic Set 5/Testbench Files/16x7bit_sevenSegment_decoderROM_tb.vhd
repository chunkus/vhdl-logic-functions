-- Engineer: Daniyal Naeem

-- Test bench code for a 16 x 7 bit seven segment decoder ROM.

library IEEE;	-- Including libraries to be used.
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Entity of the test bench.
entity sixteen_7bit_segment_decoder_tb is
end sixteen_7bit_segment_decoder_tb;	-- End of the entity.

-- Architecture of the test bench.
architecture behavior of sixteen_7bit_segment_decoder_tb is 

-- Including the component of the 16 x 7 bit seven segment decoder ROM to be used as the 
-- unit under test. 
component sixteen_7bit_segment_decoder
Port ( 
		  address : in std_logic_vector(3 downto 0);
          data_outputs : out std_logic_vector(6 downto 0)
    );
end component; -- End of component

-- Input signal to which test the device.
signal address : std_logic_vector(3 downto 0) := "0000";

-- Output signal to which test the device.
signal data_outputs : std_logic_vector(6 downto 0) := "0000000";

begin
-- Instantiating the Unit Under Test (UUT)  
uut:  sixteen_7bit_segment_decoder port map (
address => address,
data_outputs => data_outputs);

-- Testing the functionality of the device.
test_bench : process
begin 

-- Following is the truth table for the 16 x 7 bit seven segment decoder ROM.

--		Address		   :		Segment
-- A3	A2	 A1	  A0   :  A	  B	  C	  D	  E	  F	  G
-----------------------:-----------------------------
-- 0	0	 0	  0	   :  1	  1   1   1   1   1   0 
-- 0	0	 0	  1	   :  0	  1   1   0   0   0   0 
-- 0	0	 1	  0	   :  1	  1   0   1   1   0   1 
-- 0	0	 1	  1	   :  1	  1   1   1   0   0   1 
-- 0	1	 0	  0	   :  0	  1   1   0   0   1   1 
-- 0	1	 0	  1	   :  1	  0   1   1   0   1   1 
-- 0	1	 1	  0	   :  1	  0   1   1   1   1   1 
-- 0	1	 1	  1	   :  1	  1   1   0   0   0   0 
-- 1	0	 0	  0	   :  1	  1   1   1   1   1   1 
-- 1	0	 0	  1	   :  1	  1   1   1   0   1   1 
-- 1	0	 1	  0	   :  1	  1   0   1   1   1   1 
-- 1	0	 1	  1	   :  0	  0   1   1   1   1   1 
-- 1	1	 0	  0	   :  1	  0   0   1   1   1   0 
-- 1	1	 0	  1	   :  0	  1   1   1   1   0   1 
-- 1	1	 1	  0	   :  1	  0   0   1   1   1   1 
-- 1	1	 1	  1	   :  1	  0   0   0   1   1   1 

wait for 50 ns;
address <= "0000";	-- Testing if output is ZERO.

wait for 50 ns;
address <= "0001";	-- Testing if output is ONE.

wait for 50 ns;
address <= "0010";	-- Testing if output is TWO.

wait for 50 ns;
address <= "0011";	-- Testing if output is THREE.

wait for 50 ns;
address <= "0100";	-- Testing if output is FOUR.

wait for 50 ns;
address <= "0101";	-- Testing if output is FIVE.

wait for 50 ns;
address <= "0110";	-- Testing if output is SIX.

wait for 50 ns;
address <= "0111";	-- Testing if output is SEVEN.

wait for 50 ns;
address <= "1000";	-- Testing if output is EIGHT.

wait for 50 ns;
address <= "1001";	-- Testing if output is NINE.

wait for 50 ns;
address <= "1010";	-- Testing if output is TEN (A).

wait for 50 ns;
address <= "1011";	-- Testing if output is ELEVEN (B).

wait for 50 ns;
address <= "1100";	-- Testing if output is TWELVE (C).

wait for 50 ns;	
address <= "1101";	-- Testing if output is THIRTEEN (D).

wait for 50 ns;
address <= "1110";	-- Testing if output is FOURTEEN (E).

wait for 50 ns;
address <= "1111";	-- Testing if output is FIFTEEN (F).

wait;	-- End of test. Waiting for ever.

end process;	-- End of the process.

end;	-- End of the test bench code.