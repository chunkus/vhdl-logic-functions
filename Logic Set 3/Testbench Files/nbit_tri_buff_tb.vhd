-- Engineer: Daniyal Naeem.
-- The following code is the test bench code to verify the functionality of the n-bit tri 
-- state buffer.

LIBRARY ieee;	-- Defining the libraries to be used.
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

-- Entity of the n-bit tri state buffer test bench.
entity tri_buff_tb_vhd is
end tri_buff_tb_vhd;

-- Architecture of the following test bench code.
architecture behavior of tri_buff_tb_vhd is

	-- Component Declaration for the Unit Under Test (UUT), which corresponds to the entity
	-- of the n-bit tri state buffer.
	component nbit_tri_buff is
	PORT(
			Data_in : IN std_logic_vector(3 downto 0);
			enable : IN std_logic;          
			Output : OUT std_logic_vector(3 downto 0)
		);
	
	end component;	-- End of the n-bit tri state buffer component.
   
--Input signals used to test the n-bit tri state buffer.
signal Data_in: STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal enable: STD_LOGIC := '0';

--Output signal used to test the n-bit tri state buffer.
signal Output: STD_LOGIC_VECTOR (3 downto 0);

begin

	-- Instantiating the Unit Under Test (UUT).
	uut: nbit_tri_buff PORT MAP(
		Data_in => Data_in,
		enable => enable,
		Output => Output
	);

-- Beginning of the process to verify the n-bit tri state buffer functionality.
tb : process
begin

-- Following is the truth table of a tri state buffer.
--	Enable	 Input	:  Output
--	  1        0	:	 0
--	  1        1	:	 1
--	  0        X	:	 Z
	
	-- Waiting for global reset time.
	wait for 100 ns;
	enable<='0';	-- Verifying if the output is the high impedance (Z) when enable = 0.
	Data_in<="1010";
        
	wait for 100 ns;
    Data_in<="1010";  -- Verifying if the output is the value on Data_in (1010) when enable = 1.
    enable<='1';
        
	wait for 100 ns;
	Data_in<="0110";  -- Verifying if the output is the value on Data_in (0110) when enable = 1.
	
	wait;	-- End of test. Wait forever.    
	end process;	-- Process to verify functionality of n-bit tri state buffer ended.

end;	-- End of the test bench code.