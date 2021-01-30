-- Engineer: Daniyal Naeem.
-- The following code refers to the test bench of an n-bit register with a load/hold control,
-- in order to verify its correct functionality.

library IEEE;	-- Defining the libraries to be used.
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Declaration of the test bench entity.
entity nbit_reg_loadhold_tb is 
end nbit_reg_loadhold_tb;	-- End of the test bench entity.

-- Definition of the architecture of the test bench.
architecture behavior of nbit_reg_loadhold_tb is 

-- Component Declaration for the Unit Under Test (UUT). The component declared is that of 
-- the n-bit register with a load/hold control, previously used in its source code.
  component nbit_reg_loadhold is
  port(  
      	 D_inputs : in std_logic_vector(3 downto 0);  
      	 load_hold : in std_logic;  
      	 CLK : in std_logic;  
      	 reset : in std_logic;  
      	 preset : in std_logic;  
      	 Q_outputs : inout std_logic_vector(3 downto 0)  
     );  
   end component;  -- End of the component.

-- Input signals used to test the functionality of the n-bit register with a load/hold control.
-- Each input has an initial value of zero.
   signal D_inputs : std_logic_vector(3 downto 0) := "0000";  
   signal load_hold : std_logic := '0';  
   signal CLK : std_logic := '0';  
   signal reset : std_logic := '0';  
   signal preset : std_logic := '0';

-- Output signal used to test the functionality of the n-bit register with a load/hold control.
   signal Q_outputs : std_logic_vector(3 downto 0);

 BEGIN  
    -- Instantiating the Unit Under Test (UUT). 
   uut: nbit_reg_loadhold PORT MAP (  
      D_inputs => D_inputs,  
      load_hold => load_hold,  
      CLK => CLK,  
      reset => reset,  
      preset => preset,  
      Q_outputs => Q_outputs  
     );  

-- Assigning a period of 100 nano seconds to the clock signal.
CLK <= not CLK after 50 ns;
 
-- Beginning the process to verify the functionality of the n-bit register with a load/hold control.  
stim_proc: process  
begin            

-- Following is the truth table for an n-bit register with a load/hold control.   
-- NOTE: 
-- "UP" is used to indicate the rising edge of the clock signal.
-- "LQ" is used to indicate Last Q_outputs. 

-- CLK	 D	 Load/hold	 preset	 reset	:	Output
--  UP	 1	     1		   0	   0	:	  D	
--  UP	 0	     1		   0	   0	:	  D	
--  X	 X	     X		   X	   1	:	  0
--  X	 X	     X		   1	   0	:	  1
--  X	 X	     X		   0	   0	:	  LQ

		
		-- Waiting for global reset.  
        wait for 100 ns;             
        D_inputs <= "1010";	-- Setting the input to be 1010.  
        
        wait for 100 ns;    -- When load_hold = 1, it means it is loading 1010 to the register 
        load_hold <= '1';	-- on the rising edge of the clock signal.   
        					
        wait for 100 ns;    -- When load_hold = 0, it means that the register will hold the value 
        load_hold <= '0';	-- of 1010, which was loaded before.
                
        wait for 100 ns; 	-- When reset is 1 it changes Q_output to zero,     
        reset <= '1';  		-- no matter what the value of preset is. 
        
        wait for 100 ns; 	-- When reset is 0 and present is 1, then the Q_output is 1.       
        reset <= '0';  
        preset <= '1';  
        
        wait for 100 ns; 	-- Changing preset to 0 so that both reset and preset are 0,    
        preset <= '0';		-- thus the output does not change (last Q_outputs).   
    
   	 	wait;	-- End of test. Wait forever.
   	 	
   end process;	-- End of the stim_proc process to verify functionality of the n-bit register with a load/hold control. 
 
 end;	-- End of the test bench code. 
