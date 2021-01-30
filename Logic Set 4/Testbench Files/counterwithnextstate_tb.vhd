  --------------------------------------------------------------------------------
-- Engineer: Tobi Adebari
--------------------------------------------------------------------------------
-- Saying what librarys are being used
 library ieee;  
 use ieee.std_logic_1164.ALL;
   
 --Creating the entity 
 entity bit_sync_counter_test is  
 end bit_sync_counter_test;  
 
 --Defing the architechture for the entity created
 architecture behavior of bit_sync_counter_test is   

   --Creating the subcircuit/component used
   component counterwithnextstate  
   port(  
      CLK : IN std_logic;        --Creating the ports for the component
      reset : IN std_logic;  
      Q_outputs : inout std_logic_vector(3 downto 0)  
     );  
   end component;  
   --inputs 
   signal CLK : std_logic := '0';  
   signal reset : std_logic := '0';  
   --outputs
   signal Q_outputs : std_logic_vector(3 downto 0);  
   --Defining how often we want the clock to toggle on and off 
   constant CLK_period : time := 100 ns;  
 begin  
 
 -- Declaring he unit which we are simulating 
   uut: counterwithnextstate port map (  
      CLK => CLK,  
      reset => reset,  
      Q_outputs => Q_outputs  
     );  
   -- Clock process definitions  
   CLK_process :process  
   begin  
           CLK <= '0';  
           wait for CLK_period/2;  
           CLK <= '1';  
           wait for CLK_period/2;  
   end process;  
   -- starting process
   
-- Following is the truth table of the D-flip-flop with asynchronous reset and preset, used  
-- as a component of the n-bit register.

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

-- Following is the State and Next State table for this device.
-- STATE	NEXT STATE
-- 0000		   0001
-- 0001		   0010
-- 0010		   0011
-- 0011		   0100
-- 0100		   0101
-- 0101		   0110
-- 0110		   0111
-- 0111		   1000
-- 1000		   1001
-- 1001		   1010
-- 1010		   1011
-- 1011		   1100
-- 1100		   1101
-- 1101		   1110
-- 1110		   1111
-- 1111		   0000

   start_proc: process  
   begin            
    -- hold reset state for 100 ns.  
    wait for 100 ns;       
 reset<= '1';     
     wait for 100 ns;       
 reset<= '0';     
     wait for 1500 ns;       
   end process;  
 end;