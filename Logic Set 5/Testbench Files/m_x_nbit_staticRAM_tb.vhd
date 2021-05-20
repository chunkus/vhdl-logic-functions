-- Saying what librarys are being used
LIBRARY ieee;   
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY mnsram_tb is 
generic (n,m : positive := 4);  -- Generic value used to better change bit width if necessary.
END mnsram_tb;

ARCHITECTURE Behaviour OF mnsram_tb IS

COMPONENT mnsram is 
port(
        data_in : in std_logic_vector(n-1 downto 0);
        select_lines : inOUT std_logic_vector(m-1 downto 0);
        write_enable : in std_logic;
        data_out : out std_logic_vector(n-1 downto 0)
    );
END COMPONENT;

-- Input signals used to test the functionality of the n-bit register with a load/hold control.
        signal data_in : std_logic_vector(n-1 downto 0);
        signal select_lines : std_logic_vector(m-1 downto 0);
        signal write_enable : std_logic;
        
-- Output signal used to test the functionality of the n-bit register with a load/hold control.
        signal  data_out : std_logic_vector(n-1 downto 0);
        
BEGIN 
    uut: mnsram PORT MAP (
                data_in => data_in,
                select_lines => select_lines,
                write_enable => write_enable,
                data_out => data_out
                );
               
-- Following is the truth table of the D-flip-flop with asynchronous reset and preset used as a
-- component in the static RAM cell.

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

-- Following is the truth table for an and gate used as a component in the static RAM cell.
-- 	INPUTS	:	OUTPUT
--	A	B	:	  F
------------:-----------
--	0	0	:	  0
--	0	1	:	  0
--	1	0	:	  0
--	1	1	:	  1

-- Following is the truth table for a tri-state buffer used as a component in the static RAM cell.
-- NOTE:
-- EN stand for Enable Input, X for don't care case, Z for high impedance.
-- 	INPUTS	:	OUTPUT
--	EN	A	:	  F
------------:-----------
--	0	X	:	  Z
--	1	0	:	  0
--	1	1	:	  1               
                
stim_proc: process  
begin
    wait for 100ns;
    select_lines <= "0010";
    data_in <= "0011";
    write_enable <= '1';
    
    wait for 100ns;
    write_enable <= '1';
    select_lines <= "0010";
    data_in <= "0001";
    
    wait for 100ns;
    write_enable <= '1';
    select_lines <= "0100";
    data_in <= "0111";
    
    wait for 100ns;
    select_lines <= "0010";
    data_in <= "0011";
    write_enable <= '0';
    
    wait for 100ns;
    write_enable <= '0';
    select_lines <= "0010";
    data_in <= "0001";
    
    wait for 100ns;
    write_enable <= '0';
    select_lines <= "0100";
    data_in <= "0111";
end process;	-- End of the stim_proc process to verify functionality of the n-bit register with a load/hold control. 
 
end;	-- End of the test bench code. 
