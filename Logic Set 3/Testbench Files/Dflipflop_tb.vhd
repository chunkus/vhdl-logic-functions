library ieee;		-- Defining the library to be used.
use ieee.std_logic_1164.all;

-- Defining the entity of the test bench.
entity dflipfloptb is
end dflipfloptb;	-- End of the test bench entity.

-- Defining the architecture of the test bench.
architecture arch_tbdff of dflipfloptb is
	-- Using as a component the entity of the D-flip-flop, with all its input and output
	-- signals.
	component dflipflop is
	port(
			D : in std_logic;	
			reset : in std_logic;	
			preset : in std_logic;
			CLK : in std_logic;
			Q : out std_logic;
			Q_bar : out std_logic
		);

	end component;	-- End of the component.

-- Input signals for the Unit Under Test (UUT):
signal D : std_logic := '0';
signal reset : std_logic := '0';	
signal preset : std_logic := '0';
signal CLK : std_logic := '0';

-- Output signals for the Unit Under Test (UUT):
signal Q : std_logic;
signal Q_bar : std_logic;

begin 
-- Instantiating the Unit Under Test (UUT).
UUT : dflipflop port map (D=>D, reset=>reset, preset=>preset, CLK=>CLK, Q=>Q, Q_bar=>Q_bar);

-- Setting a period to the clock signal of 100 nano seconds.
CLK <= not CLK after 50 ns; 

--Defining and beginning the process to start the test bench of the D-flip-flop so to verify
-- its functionality.

-- Following is the truth table of the D-flip-flop with asynchronous reset and preset.

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

test_bench : process
begin

 	-- Waiting 100 nano seconds for global reset.
    wait for 100 ns; 
	reset <= '1';
    preset <= '0';  
    D <= '1';  -- These inputs will set Q=0 and Q_bar=1.
    wait for 150 ns; 
    D <= '0';  -- Changing D but leaving reset and preset to its previous inputs will leave Q=0 and Q_bar=1.
    
    wait for 100 ns; 
    preset <= '1';  
    D <= '1';  -- These inputs will set Q=0 and Q_bar=1.
    wait for 150 ns; 
    D <= '0';  -- Changing D and preset but leaving reset  to its previous input will leave Q=0 and Q_bar=1.
     
    wait for 100 ns; 
    reset <= '0';
    D <= '1';	-- These inputs will set Q=1 and Q_bar=0.
    wait for 150 ns;  
    D <= '0';  -- Changing D but leaving reset and preset to its previous inputs will leave Q=1 and Q_bar=0.
           
    -- When the reset and preset change to 0, the Q and Q_bar output value will toggle   
    -- at the rising edge of the clock, each time.
    wait for 150 ns;  
    reset <= '0';  
    preset <= '0';
    
    wait; -- End of test. Wait forever.

end process;	-- End of the process.

end;	-- End of the test bench code.
