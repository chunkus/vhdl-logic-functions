-- Engineer: Luca Santarelli
-- The following code is the test bench code for an n-bit register.

library ieee;	-- Defining the library to be used.
use ieee.std_logic_1164.all;

entity nbitreg_tb is	-- Defining the test bench entity.
end nbitreg_tb;	-- End of the test bench architecture.

-- Defining the architecture of the n-bit register's test bench.
architecture arch_nbitreg_tb of nbitreg_tb is

-- Defining the component of the n-bit register used in this test bench to check its 
-- functionality.
component nbitregister is
port (	
		CLK : in std_logic;
		D_inputs : in std_logic_vector (3 downto 0);
		reset : in std_logic;
		preset : in std_logic;
		Q_out : out std_logic_vector (3 downto 0);
		Q_out_bar : out std_logic_vector (3 downto 0)
	 );

end component;

-- Input signals used for the test bench.
signal CLK : std_logic := '0';
signal D_inputs : std_logic_vector (3 downto 0) := "0000";
signal reset : std_logic := '0';
signal preset : std_logic := '0';

-- Output signals used for the test bench.
signal Q_out : std_logic_vector (3 downto 0);
signal Q_out_bar : std_logic_vector (3 downto 0);

begin

-- Instantiating the Unit Under Test (UUT).
UUT : nbitregister port map (CLK=>CLK, D_inputs=>D_inputs, reset=>reset, preset=>preset, Q_out=>Q_out, Q_out_bar=>Q_out_bar);

-- Giving a period to the clock of 100 nano seconds.
CLK <= not CLK after 50 ns;

--Defining and beginning the process to start the test bench of the n-bit register so to verify
-- its functionality.

-- Following is the truth table of the D-flip-flop with asynchronous reset and preset, used in 
-- the n-bit register.

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
	
	wait for 100 ns; -- Waiting 100 nano seconds for global reset.
	reset <= '1';	-- Testing the n-bit register with a reset of 1.
	
	wait for 150 ns;	-- Waiting for 150 nano seconds.
	reset <= '0';	-- Testing the n-bit register with a reset of 0.
	
	wait for 100 ns;	-- Waiting for 100 nano seconds.
	preset <= '1';	-- Testing the n-bit register with a preset of 1.
	
	wait for 150 ns;	-- Waiting for 150 nano seconds.
	preset <= '0';	-- Testing the n-bit register with a preset of 0.
	
	wait for 100 ns;	-- Waiting for 100 nano seconds.
	D_inputs <= "1111";	-- Testing the n-bit register with a D input of 1111.
	
	wait for 150 ns;	-- Waiting for 100 nano seconds.
	D_inputs <= "0000";	-- Testing the n-bit register with a D input of 0000.

	wait; -- End of test. Waiting forever.
	
end process;	-- End of the process.

end;	-- End of the test bench code. 



