library ieee;	-- Defining the library to be used.
use ieee.std_logic_1164.all;

entity tb_output_logic is	-- Declaration of entity to use.
end tb_output_logic;	-- End of entity.

-- Defining the architecture for this test bench code.
architecture tb_output_logic_arch of tb_output_logic is

-- Inclusion of the washer output logic entity as component so to test it.
component washer_output_logic is
port (
		state : in std_logic_vector(2 downto 0);
		door_lock : out std_logic;
		water_pump : out std_logic;
		soap : out std_logic;
		rotate_drum : out std_logic;
		drain : out std_logic
);

end component;	-- End of the component.

-- Input signal to test.
signal state : std_logic_vector(2 downto 0) :="000";

-- Output signals to test.
signal door_lock : std_logic;
signal water_pump : std_logic;
signal soap : std_logic;
signal rotate_drum : std_logic;
signal drain : std_logic;

begin

-- Instantiating the Unit Under Test (UUT).
UUT: washer_output_logic port map (state=>state, door_lock=>door_lock, water_pump=>water_pump,soap=>soap, rotate_drum=>rotate_drum, drain=>drain);

-- Following is the truth table for only the function, states and outputs of the system.
-- NOTE:
-- 'Load_C' is for 'Load Clothes' state.
-- 'Wash_F' is for 'Wash Fill' state.
-- 'Wash_S' is for 'Wash Spin' state.
-- 'Rinse_F' is for 'Rinse Fill' state.
-- 'Rinse_S' is for 'Rinse Spin' state.
-- 'Spin_D' is for 'Spin Dry' state.

--											OUTPUTS
-- Function	 : State :	DoorLock	 WaterPump	Soap  RotateDrum	Drain
-------------:-------:-----------------------------------------------------
-- Load_C	 :	 0	 :		0			0		 0		  0		      0
-- Load_C	 :	 0	 :		0			0		 0		  0		      0
-- Load_C	 :	 0	 :		0			0		 0		  0		      0	
-- Wash_F	 :	 1	 :		1			1		 1		  0		      0	
-- Wash_S	 :	 2	 :		1			0		 0		  1		      0	
-- Drain	 :	 3	 :		1			0		 0		  0		      1	
-- Rinse_F	 :	 4	 :		1			1		 0		  0		      0	
-- Rinse_S	 :	 5	 :		1			0		 0		  1		      0	
-- Drain	 :	 6	 :		1			0		 0		  0		      1   	
-- Drain	 :	 6	 :		1			0		 0		  0		      1	
-- Spin_D	 :	 7	 :		1			0		 0		  1		      1	

-- Process to test the functioning of the test bench code.
test_bench : process
begin
	
	-- Initially waiting for 100 nano seconds.	
	wait for 100 ns;	
	state<="000";	-- Testing four output of state 0.
	
	wait for 100 ns;
	state<="001";	-- Testing four output of state 1.
	
	wait for 100 ns;
	state<="010";	-- Testing four output of state 2.
	
	wait for 100 ns;
	state<="011";	-- Testing four output of state 3.
	
	wait for 100 ns;
	state<="100";	-- Testing four output of state 4.
	
	wait for 100 ns;
	state<="101";	-- Testing four output of state 5.
	
	wait for 100 ns;
	state<="110";	-- Testing four output of state 6.
	
	wait for 100 ns;
	state<="111";	-- Testing four output of state 7.
	
	wait;	-- End of test. Wait forever.

end process test_bench;	-- End of process test_bench.

end;	-- End of test bench code.
