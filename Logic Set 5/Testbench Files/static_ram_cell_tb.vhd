-- Saying what librarys are being used
LIBRARY ieee;   
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY sram_tb is 
END sram_tb;

ARCHITECTURE Behaviour OF sram_tb IS

COMPONENT staticramcell is 
port(
        data_in : in std_logic;
        cell_select : in std_logic;
        write_enable : in std_logic;
        data_out : out std_logic
    );
END COMPONENT;

-- Input signals used to test the functionality of the n-bit register with a load/hold control.
        signal data_in : std_logic;
        signal cell_select : std_logic;
        signal write_enable : std_logic;
        
-- Output signal used to test the functionality of the n-bit register with a load/hold control.
        signal  data_out : std_logic;
       
-- Following is the truth table of the D-flip-flop with asynchronous reset and preset used as a
-- component in this device.

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

-- Following is the truth table for an and gate used as a component for this device.
-- 	INPUTS	:	OUTPUT
--	A	B	:	  F
------------:-----------
--	0	0	:	  0
--	0	1	:	  0
--	1	0	:	  0
--	1	1	:	  1

-- Following is the truth table for a tri-state buffer used as a component for this device.
-- NOTE:
-- EN stand for Enable Input, X for don't care case, Z for high impedance.
-- 	INPUTS	:	OUTPUT
--	EN	A	:	  F
------------:-----------
--	0	X	:	  Z
--	1	0	:	  0
--	1	1	:	  1
        
BEGIN 
            uut: staticramcell PORT MAP (
                        data_in => data_in,
                        cell_select => cell_select,
                        write_enable => write_enable,
                        data_out => data_out
                        );
                        
        stim_proc: process  
        begin
        data_in <= '1';           
        cell_select <= '0';
        write_enable <= '1';        
        
                wait for 100ns;
         data_in <= '1';
        -- wait for 50ns;                
         cell_select <= '1';
       --  wait for 50ns;
         write_enable <= '1';     
         
                wait for 100ns;
          data_in <= '0';
         -- wait for 50ns;                
          cell_select <= '0';
        --  wait for 50ns;
          write_enable <= '1';     

                wait for 100ns;
         data_in <= '0';
        -- wait for 50ns;                
         cell_select <= '0';
       --  wait for 50ns;
         write_enable <= '0';     
         
                wait for 100ns;
          data_in <= '1';
         -- wait for 50ns;                
          cell_select <= '1';
        --  wait for 50ns;
          write_enable <= '0';             wait;
        
        end process;    -- End of the stim_proc process to verify functionality of the n-bit register with a load/hold control. 
         
        end;    -- End of the test bench code.         
