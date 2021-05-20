library ieee;	-- Including library to be used.
use ieee.std_logic_1164.all;

-- Entity for the test bench of the n-bit RFC.
entity nbit_rfc_TB is
end nbit_rfc_TB;

-- Architecture for the n-bit RFC test bench.
architecture nbit_rfc_arch of nbit_rfc_TB is

-- Including the n-bit RFC component to be used as the Unit Under Test.
component n_bit_RFC is
port (
		Data_in : in std_logic_vector (3 downto 0);
		REA : in std_logic;
		REB : in std_logic;
		WE : in std_logic;
		CLK : in std_logic;
		OutA : out std_logic_vector (3 downto 0);
		OutB : out std_logic_vector (3 downto 0)
);
-- End component.
end component;

-- Input signals to test functionality of RFC.
signal Data_in : std_logic_vector(3 downto 0) := "0000";
signal REA : std_logic := '0';
signal REB : std_logic := '0';
signal WE : std_logic := '0';
signal CLK : std_logic := '0';

-- Output signals to test functionality of RFC.
signal OutA : std_logic_vector(3 downto 0) := "0000";
signal OutB : std_logic_vector(3 downto 0) := "0000";

begin

-- Instantiating the Unit Under Test (UUT).
UUT : n_bit_RFC port map (Data_in=>Data_in, REA=>REA, REB=>REB, WE=>WE, CLK=>CLK, OutA=>OutA, OutB=>OutB);

-- Assigning the clock a period of 100 nano seconds.
CLK <= not CLK after 50 ns;

-- Following are the truth tables for the three components declared in the RFC source code
-- which are used internally have a functional n-bit RFC.

-- D-flip-flop truth table.
-- NOTE: 
-- 'UP' indicates rising edge of clock signal.
-- 'LQ' indicates 'Last Q'.
-- 'LQB' indicates 'Las Q_bar'.
-- 'x' indicate Don't Care Case.

-- 	CLK	 D  Preset  Reset  :  Q  Q_bar
---------------------------:------------
--   UP	 0	  0		  0    :  0    1
--   UP	 1	  0		  0    :  1    0
--   0	 x	  0		  0    :  LQ   LQB
--   1	 x	  0		  0    :  LQ   LQB
--   x	 x	  1		  0    :  1    0
--   x	 x	  x		  1    :  0    1

-- Truth table for a tristate buffer:
-- 'x' indicate Don't Care Case.

--  enable input :  output
-----------------:------------
--		0	 X   :	Hi-Z    
--		0	 X   :	Hi-Z    
--		1	 0   :	 0    
--		1	 1   :	 1   

-- Truth table for a 2-to-1 MUX
-- NOTE:
-- A and B are the two inputs of the Multiplexer.

-- SELECT	:	Output
------------:-----------
-- 	 0		:	  A
-- 	 1		:	  B

-- Beginning the process to test the functionality of the n-bit RFC.
test_bench : process
begin
	
	-- Waiting 100 nano seconds for global reset time.
	wait for 100 ns;
	Data_in<="1010";	-- Data_in has input 10.
	WE<='0';	-- MUX selects current value of D-flip-flop.
	REA<='0';	-- Output of tri state buffer 1 is Z (High impedance).
	REB<='0';	-- Output of tri state buffer 2 is Z (High impedance).
	
	wait for 100 ns;
	WE<='1';	-- MUX selects current value of Data_in.
	REA<='1';	-- Output of tri state buffer 1 is output of D-flip-flop (Q).
	REB<='1';	-- Output of tri state buffer 2 is output of D-flip-flop (Q).
	
	wait for 100 ns;
	REA<='1';	-- Output of tri state buffer 1 is output of D-flip-flop (Q).
	REB<='0';	-- Output of tri state buffer 2 is Z (High impedance).
	
	wait for 100 ns;
	REA<='0';	-- Output of tri state buffer 1 is Z (High impedance).
	REB<='1';	-- Output of tri state buffer 2 is output of D-flip-flop (Q).
	
	wait for 100 ns;
	WE<='0';	-- MUX selects current value of D-flip-flop.
	REB<='0';	-- Output of tri state buffer 2 is Z (High impedance).
	
	wait;	-- End of test. Waiting forever.
	
	end process;	-- End of process.
	
end;	-- End of the test bench code.
