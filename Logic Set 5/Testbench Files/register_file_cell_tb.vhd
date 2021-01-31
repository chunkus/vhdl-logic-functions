-- Engineer: Luca Santarelli

-- Test bench code for a Register File Cell (RFC).

library ieee;	-- Including library to be used.
use ieee.std_logic_1164.all;

-- RFC test bench entity.
entity rfcTB is
end rfcTB;	-- End of entity.

-- RFC test bench architecture.
architecture rfcTB_arch of rfcTB is

-- Including the RFC component to be used as the Unit Under Test.
component register_file_cell is
port(
	DIN : in std_logic;
	REA : in std_logic;
	REB : in std_logic;
	WE : in std_logic;
	CLK : in std_logic;
	OA : out std_logic;
	OB : out std_logic
);
-- End of component.
end component;

-- Input signals to test functionality of RFC.
signal DIN : std_logic := '0';
signal REA : std_logic := '0';
signal REB : std_logic := '0';
signal WE : std_logic := '0';
signal CLK : std_logic := '0';

-- Output signals to test functionality of RFC.
signal OA : std_logic := '0';
signal OB : std_logic := '0';

begin

-- Instantiating the Unit Under Test (UUT).
UUT : register_file_cell port map (DIN=>DIN, REA=>REA, REB=>REB, WE=>WE, CLK=>CLK, OA=>OA, OB=>OB);

-- Giving the clock a period of 100 nano seconds.
CLK <= not CLK after 50 ns;

-- Following are the truth tables for the three components respectively declared in the RFC
-- source code.

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

-- Beginning of the process to test the RFC.
test_bench : process
begin
	
	-- Waiting 100 nano seconds for global reset.
	wait for 100 ns;	
	DIN<='1';	-- DIN has input 1.
	WE<='0';	-- MUX selects current value of D-flip-flop.
	REA<='0';	-- Output of tri state buffer 1 is Z (High impedance).
	REB<='0';	-- Output of tri state buffer 2 is Z (High impedance).
	
	wait for 100 ns;
	WE<='1';	-- MUX selects current value of DIN.
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
	
	wait for 100 ns;
	WE<='1';	-- MUX selects current value of DIN.
	
	wait;	-- End of test. Waiting forever.
	
	end process;	-- End of process.
	
end;	-- End of test bench code.