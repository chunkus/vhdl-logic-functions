-- Company : Queen Mary University 
-- Engineer : Aditya Ajaykumar
-- Date : 06 March 2019
-- Module : lab5_64x4sramtb
--project : Lab5_DSD_64x4sramtb

-- Test bench code for the 64 x 4-bit Static RAM.

LIBRARY ieee;	-- Including necessary libraries.
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

-- Defining test bench entity.
entity sixtyFour_x4sramtb is 
end sixtyFour_x4sramtb;	-- End of entity.

-- Architecture for the test bench code.
architecture sixtyFour_x4sramtb_arch of sixtyFour_x4sramtb is
-- Including as the Unit Under Test component the 64 x 4-bit Stati RAM component.
component sixtyFour_x4sram is 
generic (n : positive := 8);	-- Defining a generic value.
port(
		address : in std_logic_vector(n-3 downto 0); 
		Readwrite : in std_logic;
		chip_select : in std_logic;
		data_inout : inout std_logic_vector(n-5 downto 0)
	);
end component; 	-- End of the component.

-- Input signals to test functionality of the device. 
signal address : std_logic_vector(5 downto 0) := "000000";
signal Readwrite, chip_select : std_logic := '0';

-- Input/Output signal to test functionality of the device.
signal data_inout : std_logic_vector(3 downto 0) := "0000";

begin 
-- Instantiating the Unit Under Test.
UUT: sixtyFour_x4sram port map (address=>address, Readwrite=>Readwrite, chip_select=>chip_select, data_inout=>data_inout);

-- Following is the truth table for a 3-to-8 decoder, used as a component in the 64 x 8-bit Static RAM.

--	INPUTS	  :				OUTPUTS
--	A2 A1 A0  :	D7	D6	D5	D4	D3	D2	D1	D0
--------------:-----------------------------------
-- 	0  0  0   : 0	0	0	0	0	0	0	1
-- 	0  0  0   : 0	0	0	0	0	0	1	0
-- 	0  0  0   : 0	0	0	0	0	1	0	0
-- 	0  0  0   : 0	0	0	0	1	0	0	0
-- 	0  0  0   : 0	0	0	1	0	0	0	0
-- 	0  0  0   : 0	0	1	0	0	0	0	0
-- 	0  0  0   : 0	1	0	0	0	0	0	0
-- 	0  0  0   : 1	0	0	0	0	0	0	0

test_bench : process 
begin  -- testing begins
	
	wait for 100 ns; 
	address<= "000000";--  storing address = 0 
	chip_select<= '1'; -- enable chip_select to write to the address 
	data_inout<= "0001"; -- write "0001" to the address 
	
	wait for 100 ns;
	Readwrite<= '1'; -- switch to reading 
	data_inout<= "0000"; -- input made 0, no change in timing diagram
	
	wait for 100 ns;
	chip_select<= '0';	-- chip deselected, no output
	data_inout<= "ZZZZ" ; 
	
	wait for 100 ns; 
	chip_select <= '1'; -- reading data_inout of memory 
	data_inout<= "ZZZZ" ; --to read out stored values
	
	wait for 100 ns;
	chip_select<= '0';
	Readwrite<= '0'; --write mode selected 
	address<= "000001"; 
	
	wait for 100 ns; 
	chip_select<= '1'; -- chip_select enabled
	data_inout<= "0100"; 
	
	wait for 100 ns; 
	Readwrite<='1';
	data_inout<= "0000"; -- input deselected
	
	wait for 100 ns;
	chip_select<= '0'; -- deselect chip
	data_inout<= "ZZZZ" ; 
	
	wait for 100 ns; 
	chip_select <= '1'; 
	data_inout<= "Z" ; 
	
	wait for 100 ns; 
	address <= "000000" ;
	data_inout<= "ZZZZ" ; 
	
	wait for 100 ns; 
	address <= "000001" ; 
	data_inout<= "ZZZZ" ; 
	
	wait; -- End of test. Waiting forever.
	
	end process;	-- End of the process.
	
end; 	-- End of the test bench code.