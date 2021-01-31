-- Engineer: Youssef Akil

--Source code: Test bench for TDM

LIBRARY ieee;	-- Including library to be used.
USE ieee.std_logic_1164.ALL;
 
ENTITY TDM_tb IS	-- Entity for the device.
END TDM_tb;	-- End of test bench.
 
ARCHITECTURE behavior OF TDM_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TDM
    PORT(
         reset : IN  std_logic;
         CLK : IN  std_logic;
         InA : IN  std_logic_vector(3 downto 0);
         InB : IN  std_logic_vector(3 downto 0);
         cathA : OUT  std_logic;
         cathB : OUT  std_logic;
         anOut : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    

   --Input signals to be used to test device.
   signal reset : std_logic := '0';
   signal CLK : std_logic := '0';
   signal InA : std_logic_vector(3 downto 0) := "0000";
   signal Inb : std_logic_vector(3 downto 0) := "0000";

 	--Output signals to be used to test device.
   signal cathA : std_logic;
   signal cathB : std_logic;
   signal anOut : std_logic_vector(6 downto 0);

 
BEGIN
 
	-- Instantiating the Unit Under Test (UUT)
   uut: TDM PORT MAP (
          reset => reset,
          CLK => CLK,
          InA => InA,
          Inb => Inb,
          cathA => cathA,
          cathB => cathB,
          anOut => anOut
        );

	-- Assigning the clock a period of 50 nano seconds.
	CLK <= not CLK after 50ns;

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

-- Following is the truth table for the T-flip-flop, used as a component in this device.
-- 	 CLK  reset	: 		Q  		Q_bar 
--  ------------:------------------------
--    X	   1	:		0	  	  1
-- rising  0    :  last Q_bar  last Q


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      	wait for 100 ns;	
		reset <= '1';	-- Selecting Cathode B.
		InA <= "0110";
		InB <= "1110";	-- This value is sent to the decoder.
		
		wait for 200 ns;
		reset <= '0';	-- Selecting Cathode A.
		InA <= "0000";	-- This value is sent to the decoder.
		InB <= "1010";	
		
		wait for 200 ns;
		reset <= '0';	-- Selecting Cathode A.
		InA <= "0011";	-- This value is sent to the decoder.
		InB <= "1000";
		
		wait for 200 ns;
		reset <= '1';	-- Selecting Cathode B.
		InA <= "1001";
		InB <= "0110";	-- This value is sent to the decoder.

      	wait;	-- End of test. Waiting forever.
   
   end process;	-- End of the process.

END;	-- End of the test bench code.