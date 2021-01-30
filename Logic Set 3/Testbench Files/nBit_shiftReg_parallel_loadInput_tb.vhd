-- Company : Queen Mary University 
-- Engineer : Aditya Ajaykumar
-- Date : 14 February 2019
-- Module : lab3_shiftregister_tb
--project : Lab3_DSD_shiftregister_tb

-- The following code is the test bench code of the n-bit shift register with parallel load input.

library ieee;	-- Defining the library to be used.
use ieee.std_logic_1164.all;

-- Entity declaration for this test bench.
entity nbit_shiftreg_parallelLoad_tb is
end nbit_shiftreg_parallelLoad_tb;	-- End of test bench's entity.

-- Declaring the architecture of the test bench code.
architecture nbit_shiftreg_parallelLoad_tb_arch of nbit_shiftreg_parallelLoad_tb is

-- Component declaration of the tested unit, which is the n-bit shift register with parallel load input.
component nbitshiftregparallelload
port(
	shiftin : in std_logic;
    dinputs : in std_logic_vector(7 down to 0);
    loadshift : in std_logic;
    CLK : in std_logic;
    reset  : in std_logic;
    preset : in std_logic;
    qoutputs : inout std_logic_vector(7 downto 0) );
end component;	-- End of the n-bit shift register with parallel load input component.

-- Input signals to be used for the verification of the functionality of the n-bit shift register with parallel load input.
signal shiftin : std_logic := '0';
signal dinputs : std_logic(7 down to 0);
signal loadshift : std_logic := '0';
signal CLK : std_logic := '0';
signal reset : std_logic := '0';
signal preset : std_logic := '0';

-- Output signal to be used for the verification of the functionality of the n-bit shift register with parallel load input.
signal qoutputs : std_logic_vector(7 downto 0);   

-- Defining a constant called CLK_period with time value 50 ns to be used as the period  of the clock signal.
constant CLK_period : time := 50 ns;

-- Beginning of the verification.
begin

-- Instantiating the UUT (Unit Under Test).
    port map (
    	shiftin => shiftin;
        dinputs => dinputs,
        loadshift => loadshift,
        CLK => CLK,
        reset => reset,
        preset => preset,
        qoutputs => qoutputs
    );

-- Defining a process for the clock to assign it values and have it work on the simulations.
CLK_process :process
begin
    CLK <= '0';
    wait for CLK_period/2;
    CLK <= '1';
    wait for CLK_period/2;
end process;	-- End of the clock process.


-- Entering the process to test the n-bit shift register with parallel load input.
  stim_proc : process
  begin     
  
  wait for 100 ns;
  shiftin <= '0';	-- Shifting the inputted data in parallel.
  reset <= '1'; 	-- Reset is '1' thus output will be '0'.
  
  wait for 100 ns;
  reset <= '0';		-- Reset is set to '0'.
  preset <= '1';	-- Preset is set to '1' thus the output will be '1'.
  
  wait for 100 ns;
  preset <= '0';	-- Preset is set to '0'.
  loadshift <= '1';	-- loadshift is '1' thus loading the data '00000011'.
  dinputs <= "00000011";
  
  wait for 100 ns;
  loadshift <= '0';	-- loadshift is '0' thus holding the previous data on '00000011'.
  
  wait for 100 ns;
  loadshift <= '1';	-- loadshift is '1' thus loading the data '00000101'.
  dinputs <= "00000101";
  
  wait for 100 ns;
  shiftin <= '1';	-- Shifting the previously inputted data in series.
  
  wait;		-- End of test. Waiting forever.
    
end process;	-- End of the verification process.

END;	-- End of the test bench.