library ieee;	-- Defining the library to be used.
use ieee.std_logic_1164.all;

entity tb_next_state is	-- Declaration o the entity for the test bench code.
end tb_next_state;	-- End of the entity.

-- Declaring the architecture for the test bench code.
architecture tb_next_state_arch of tb_next_state is

-- Inclusion of the next state logic component for the washer.
component washer_next_state_logic is 
port (
		state : in std_logic_vector(2 downto 0);
		control : in std_logic;
		door_open : in std_logic;
		next_state : out std_logic_vector(2 downto 0)
	);

end component;	-- End of the component declaration.

-- Input signals to be used for testing.
signal state : std_logic_vector(2 downto 0) := "000";
signal control : std_logic := '0';
signal door_open : std_logic := '0';

-- Output signal to be used for testing.
signal next_state : std_logic_vector(2 downto 0);

begin

-- Instantiating the Unit Under Test (UUT).
UUT : washer_next_state_logic port map (state=>state, control=>control, door_open=>door_open, next_state=>next_state);

-- Beginning of the process to verify the functionality of the next state logic.
-- Following is the truth table for only the function, state, next state and inputs to the system.
-- NOTE:
-- 'X' is used to indicate don't care case.
-- 'Load_C' is for 'Load Clothes' state.
-- 'Wash_F' is for 'Wash Fill' state.
-- 'Wash_S' is for 'Wash Spin' state.
-- 'Rinse_F' is for 'Rinse Fill' state.
-- 'Rinse_S' is for 'Rinse Spin' state.
-- 'Spin_D' is for 'Spin Dry' state.

--											  INPUTS
-- Function	 : State	Next State  :	Door open	Control
-------------:----------------------:------------------------
-- Load_C	 :	 0			0		:		1		   X
-- Load_C	 :	 0			0		:		0		   0
-- Load_C	 :	 0			1		:		0		   1	
-- Wash_F	 :	 1			2		:		X		   X	
-- Wash_S	 :	 2			3		:		X		   X	
-- Drain	 :	 3			4		:		X		   X	
-- Rinse_F	 :	 4			5		:		X		   X	
-- Rinse_S	 :	 5			6		:		1		   X	
-- Drain	 :	 6			0		:		X		   0	
-- Drain	 :	 6			7		:		X		   1	
-- Spin_D	 :	 7			0		:		X		   X	
	

test_bench : process
begin
	
	-- Waiting time has been set to 50 nano seconds in order to have all the correct next
	-- states be shown on the timing diagrams.
	wait for 50 ns;
	state<="000";	-- Checking if next state is '0'.
	door_open<='1';
	control<='-';
	
	wait for 50 ns;
	state<="000";	-- Checking if next state is '0'.
	door_open<='0';
	control<='0';
	
	wait for 50 ns;
	state<="000";	-- Checking if next state is '1'.
	door_open<='0';
	control<='1';
	
	wait for 50 ns;
	state<="001";	-- Checking if next state is '2'.
	door_open<='-';
	control<='-';
	
	wait for 50 ns;
	state<="010";	-- Checking if next state is '3'.
	door_open<='-';
	control<='-';
	
	wait for 50 ns;
	state<="011";	-- Checking if next state is '4'.
	door_open<='-';
	control<='-';
	
	wait for 50 ns;
	state<="100";	-- Checking if next state is '5'.
	door_open<='-';
	control<='-';
	
	wait for 50 ns;
	state<="101";	-- Checking if next state is '6'.
	door_open<='-';
	control<='-';
	
	wait for 50 ns;
	state<="110";	-- Checking if next state is '0'.
	door_open<='-';
	control<='0';
	
	wait for 50 ns;
	state<="110";	-- Checking if next state is '7'.
	door_open<='-';
	control<='1';
	
	wait for 50 ns;
	state<="111";	-- Checking if next state is '0'.
	door_open<='-';
	control<='-';
	
	wait;	-- End of test. Waiting forever.
	
	end process test_bench;	-- End of the test_bench process.

end;	-- End of the test bench code.
