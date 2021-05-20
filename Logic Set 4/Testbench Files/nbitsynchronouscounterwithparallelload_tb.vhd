 library ieee;  -- Including library to be used.
 use ieee.std_logic_1164.ALL;  
 
 --Creating the entity 
 entity nbitsynchronouscounterwithparallelload_tb is 
 end nbitsynchronouscounterwithparallelload_tb;  
 
 --Defing the architechture for the entity created
 architecture behavior of nbitsynchronouscounterwithparallelload_tb is 
   
 --Creating the subcircuit/component used
   component nbitsynchronouscounterwithparallelload  
   port(  
      D_inputs : in STD_LOGIC_VECTOR (7 downto 0);  
       loadcount : in STD_LOGIC;  
       countenable : in STD_LOGIC;  
       clk : in STD_LOGIC;  
       reset : in STD_LOGIC;  
       qoutputs : inout STD_LOGIC_VECTOR (7 downto 0)
     );  
   end component;
   
   --Input signals to be used to test functionality of the device.
	signal D_inputs : std_logic_vector (7 downto 0) := "00000000";
	signal loadcount : std_logic := '0';
	signal countenable : std_logic := '0';
	signal clk : std_logic := '0';
	signal reset : std_logic := '0';
   --Bidirectional Signal to be used also as output to test functionality of the device.
   signal qoutputs : std_logic_vector(7 downto 0);   
   
   begin  
   -- Instantiating the unit under test.
   uut: nbitsynchronouscounterwithparallelload PORT MAP (
   D_inputs=>D_inputs, loadcount=>loadcount, countenable=>countenable, clk=>clk, reset=>reset, qoutputs=>qoutputs 
     );  
  
  -- Assigning the clock a period of 100 nano seconds.
  clk<= not clk after 50 ns; 
   
   -- starting process to test functionality of device.
   start_proc: process  
   begin  
   
   -- The way the device works is the following:
   -- when loadcount is '1' we can load a value to the input D_inputs (i.e. 2). Afterwards if loadcount is set to '0'
   -- and countenable is set to '1' the device will start counting up, starting at the value assigned on D_inputs. The
   -- counting up happens on the rising edge of the clock. The count of the device will be displayed on the output qoutputs.
   -- If however, the reset pin is set to '1' and then to '0' the output will become '0' and the device will start counting
   -- up from '0'.
   
    -- Following is the truth table for the half adder used as a component in the n-bit incrementer which is used in this device.
   
   --	INPUT		 OUTPUT
   --  A     B	:  SUM	 CARRY
   -------------:---------------
   --  0     0  :   0      0
   --  0     1  :   1      0
   --  1     0  :   1      0
   --  1     1  :   0      1
   
	-- Following is the truth table of the D-flip-flop with asynchronous reset and preset, used as a component in 
	-- the n-bit register, which is used in this device.

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
   
    -- Following is the truth table for the 2-to-1 multiplexer which is the component of the n-bit 2-input-MUX,
    -- which is a component used in this device.
    
    -- SELECT  :  OUTPUT
    -----------:---------
    --   0	   :    A
    --   1	   :    B

      -- Waiting global reset time.       
      wait for 100 ns;  
      loadcount<='1';	-- Allowing to load a value to the device. 
      D_inputs<="00000001";	-- Loading the value 1.
      
      wait for 200 ns;
      countenable<='1';	-- The count up will begin, starting from 1.
      
      wait for 200 ns;
      reset<='1';	-- Reset pin is set to '1' thus output is zero.
      
      wait for 100 ns;
      reset<='0';	-- Rest pin is set to '0' thus the device will start counting up from 0.
           
      wait;		-- End of test. Waiting forever.
        
   end process;  -- End of process.
 
 END; 	-- End of test bench code.
