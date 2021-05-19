LIBRARY ieee;	-- Saying what librarys are being used
USE ieee.std_logic_1164.ALL;

-- Defining the entity of the device.
ENTITY tb_counter IS
generic (width : positive := 8);  -- Defining generic value to easily modify bit width.
END tb_counter;	-- End of the test bench entity.

-- Declaring the architecture of the test bench.
ARCHITECTURE behavior OF tb_counter IS 

    -- Component Declaration for the Unit Under Test (UUT).
    COMPONENT nbittwistedring
  generic (width : positive := 8);  
    PORT(
         CLK : IN  std_logic;   --Creating the ports
         RESET : IN  std_logic;
         PRESET: IN std_logic;
         Q_outputs : inout  std_logic_vector(width-1 downto 0)
        );
    END COMPONENT;	-- End of UUT component.
    

   --Input signals to be used for testing of the device.
   signal CLK : std_logic := '0';
   signal RESET : std_logic := '0';
   signal preset : std_logic := '0';

  --Output signal to be used for testing of the device.
   signal Q_outputs : std_logic_vector(width-1 downto 0);

BEGIN
   -- Instantiating the UUT.
   uut: nbittwistedring  
   PORT MAP (
          CLK => CLK,
          RESET => RESET,
          preset => PRESET,         
           Q_outputs => Q_outputs
        );

   -- Clock period definition of 100 nano seconds.
   CLK <= not CLK after 50 ns;

-- Following is the truth table for the n-bit twisted ring counter:

-- CLK pulse number	 :	Q7	Q6	Q5	Q4	Q3	Q2	Q1	Q0
--		  0			 :	0	0	0	0	0	0	0	0
--		  1			 :	1	0	0	0	0	0	0	0
--		  2			 :	1	1	0	0	0	0	0	0
--		  3			 :	1	1	1	0	0	0	0	0
--		  4			 :	1	1	1	1	0	0	0	0
--		  5			 :	1	1	1	1	1	0	0	0
--		  6			 :	1	1	1	1	1	1	0	0
--		  7			 :	1	1	1	1	1	1	1	1
--		  8			 :	0	1	1	1	1	1	1	1
--		  9			 :	0	0	1	1	1	1	1	1
--		  10		 :	0	0	0	1	1	1	1	1
--		  11		 :	0	0	0	0	1	1	1	1
--		  12		 :	0	0	0	0	0	1	1	1
--		  13		 :	0	0	0	0	0	0	1	1
--		  14		 :	0	0	0	0	0	0	0	1
--		  15		 :	0	0	0	0	0	0	0	0

   -- Stimulus process
   stim_proc: process
   begin 
      
 	wait for 100 ns;
 	RESET <= '1';	-- Setting reset to '1' so the output will be '0', but shifted based on the clock pulse.
 
    wait for 100 ns; 
 	RESET <= '0';	-- Setting reset to '0' so the output will be still be '0', but shifted based on the clock pulse.
    
	wait for 100 ns;
 	preset <= '1';	-- Setting preset to '1' so the output will be '1', since reset is '0, but shifted based on the clock pulse'.
    
    wait for 100 ns; 
 	preset <= '0';	-- Setting preset to '0' so the output will be the previous one still, which was '1', but shifted based on the clock pulse.

	wait;	-- End of test. Waiting forever.
	
   	end process;

END;	-- End of test bench.
