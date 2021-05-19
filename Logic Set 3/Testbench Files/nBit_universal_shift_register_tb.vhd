-- Saying what librarys are being used
library IEEE;		
use ieee.std_logic_1164.all;

entity UnivShiftReg_tb is		-- Defining the entity.
generic(width: positive := 4);  -- Defining a generic variable
end UnivShiftReg_tb;			-- Ending of the entity.

-- Defining the architecture of the n-bit universal shift register.
architecture behaviour of UnivShiftReg_tb is

-- Including the component of the Unit Under Test (UUT), which is the n-bit universal shift register.
component UnivShiftReg is	

    port (
        D_inputs : in std_logic_vector(3 downto 0);   --Creating the ports
        shift_in : in std_logic;
        shift_rotate : in std_logic;
        F : in std_logic_vector(1 downto 0);
        CLK, RST, preset : in std_logic;
        Q_outputs : inout std_logic_vector(3 downto 0));

end component;	-- End of the UUT component.

-- Defining input signals to be used for testing. 
signal  D_inputs :  std_logic_vector (width-1 downto 0) := "1000";
signal  shift_in :  std_logic := '1';
signal  shift_rotate :  std_logic := '0';
signal  F :  std_logic_vector(1 downto 0) := "00";
signal  CLK :  std_logic := '0';
signal  reset :  std_logic := '0';
signal  preset :  std_logic := '0';

-- Defining output signal to be used for the testing.
signal  Q_outputs :  std_logic_vector(width-1 downto 0);

begin
	-- Instantiating the Unit Under Test (UUT).
	UTT: UnivShiftReg port map (D_inputs, shift_in, shift_rotate, F, CLK, reset, preset, Q_outputs);
	
	-- Assigning the clock signal a period of 100 nano seconds.
	clk <= not clk after 50 ns; 
	
-- Process of the Unit Under Test (UUT), to verify its proper working.

-- Following is the truth table for an n-bit universal shift register.
-- NOTE:
-- 'UP' is used to identify the rising edge of the clock signal.

-- F1	F0	 Shift/Rotate	CLK	 :	Output/Operation
-- X 	X		  X			 0	 :		NONE
-- X 	X		  X			 1	 :		NONE
-- 0 	0		  X			 UP	 :		HOLD
-- 0 	1		  0			 UP	 :		ROTATE LEFT
-- 0 	1		  1			 UP	 :		SHIFT LEFT
-- 1 	0		  0			 UP	 :		ROTATE RIGHT
-- 1	0		  1			 UP	 :		SHIFT RIGHT
-- 1 	1		  X			 UP	 :		LOAD 

-- Process to test the n-bit universal shift register.
test_bench : process
begin

--tests for each mode 
    reset <= '1';    

    wait for 100 ns;	
    reset <= '0';    -- Testing the n-bit register with a reset of 0.
    D_inputs <= "1000";	-- Testing the ROTATE LEFT operation.
    F <= "01";
    shift_rotate <= '0';
    
    wait for 100 ns;
    shift_rotate <= '1'; -- Testing the SHIFT LEFT operation because of the change of value of the shift_rotate input.
    
    wait for 100 ns;
    F <= "10";	-- Testing ROTATE RIGHT operation.
    shift_rotate <= '0';
    
    wait for 100 ns;
    shift_rotate <= '1';	-- Testing SHIFT RIGHT operation.

    wait for 100 ns;
    F <= "11";		-- Testing the LOAD operation.
    shift_rotate <= '0';
    
    wait for 100 ns;
    shift_rotate <= '1';	-- Still testing the LOAD operation since the change in value of shift_rotate won't affect
							-- the type of operation to be done when F is '11'.
	
	wait; -- End of test. Waiting forever.
	
end process;	-- End of the process.

end;	-- End of test bench code.
