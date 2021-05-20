-- Saying what librarys are being used
 library ieee;  
 use ieee.std_logic_1164.ALL;  
 
 --Creating the entity 
 entity n_bit_ripple_counter_test is 
 generic (width : positive := 4);	-- Defining a generic default value of 4 to be later modified if necessary.
 end n_bit_ripple_counter_test;  
 
 --Defing the architechture for the entity created
 architecture behavior of n_bit_ripple_counter_test is 
   
 --Creating the subcircuit/component used
   component nbitripplecounter  
   port(  
      CLK : IN std_logic;  
      reset : IN std_logic;  
      Q_outputs : inout std_logic_vector(width-1 downto 0);  
      Q_bar_outputs : inout std_logic_vector(width-1 downto 0)  
     );  
   end component;
   
   --Inputs  
   signal CLK : std_logic := '0';  
   signal reset : std_logic := '0';  
   --outputs
   signal Q_outputs : std_logic_vector(width-1 downto 0);  
   signal Q_bar_outputs : std_logic_vector(width-1 downto 0);  
   -- Clock period definitions  
   constant CLK_period : time := 50 ns;  
   
   begin  
  -- Declaring he unit which we are simulating 
   uut: nbitripplecounter PORT MAP (  
      CLK => CLK,  
      reset => reset,  
      Q_outputs => Q_outputs,  
      Q_bar_outputs => Q_bar_outputs  
     );  
   --Defining how often we want the clock to toggle on and off  
   CLK_process :process  
   begin  
           CLK <= '0';  
           wait for CLK_period/2;  
           CLK <= '1';  
           wait for CLK_period/2;  
   end process;  
   
-- Following is the truth table for the T-flip-flop, which is used as a component in the 
-- entity of the ripple counter.

-- 	 CLK	reset	: 		Q  		Q_bar 
--  ----------------:------------------------
--    X	      1	    :		0	  	  1
--  rising    0     :   last Q_bar  last Q
   
   
   -- starting process  
   start_proc: process  
   begin            
    -- hold reset state for 100 ns.  
    wait for 100 ns;       
    wait for CLK_period*10;  
      wait for 100 ns;  
           -- both outputs start undefined 'U'  
           reset <= '1';  
           -- this sets Q to '0' and Q_bar to '1'  
           -- note that while reset is asserted, the flip-flop  
           -- does not react to the clock signal  
           wait for 120ns;  
           reset <= '0';  
           -- after reset changes to 0, the Q output value will toggle   
           -- on each rising clock edge.  
           wait;  
   end process;  
 END; 
