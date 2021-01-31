-- Company : Queen Mary University 
-- Engineer : Aditya Ajaykumar
-- Date : 06 March 2019
-- Module : lab5_64x8sramtb
--project : Lab5_DSD_64x8sramtb

-- Test bench code for the 64 x 8-bit Static RAM.

LIBRARY ieee;	-- Including necessary libraries.
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

-- Defining test bench entity.
entity sixtyFour_x8sramtb is 
end sixtyFour_x8sramtb;	-- End of entity.

-- Defining test bench architecture.
architecture sixtyFour_x8sramtb_arch of sixtyFour_x8sramtb is

-- Including the 64 x 8-bit component to be used as the Unit Under Test.
component sixtyFour_x8sram is 
generic (n : positive :=8);
port(
		address : in std_logic_vector(n-3 downto 0); -- 6 bits address 
		read_notwrite : in std_logic;
		chip_select : in std_logic;
		data_inout : inout std_logic_vector(n-1 downto 0));--  8 bits I/O
-- End of the component.
end component;  

-- Input signals to test functionality of the device.
signal address : std_logic_vector(5 downto 0) := "000000";
signal read_notwrite, chip_select : std_logic := '0';

-- Input/Output signal to test functionality of the device.
signal data_inout : std_logic_vector(7 downto 0) := "00000000";

begin
-- Instantiating the Unit Under Test. 
UUT: sixtyFour_x8sram port map (address=>address, read_notwrite=>read_notwrite, chip_select=>chip_select, data_inout=>data_inout);

test_bench : process 
begin  -- testing begins
	
	wait for 100 ns; 
	address<= "000000";	-- value to be stored at 0.
	chip_select<= '1'; --  writing to the address 
	data_inout<= "11100000"; -- write "11100000" to the address.

	wait for 100 ns;
	read_notwrite<= '1'; -- switch to reading.
	data_inout<= "00000000"; -- deselecting input, but the output stays the same.

	wait for 100 ns;
	chip_select<= '0';	-- Chip deselected, no output.
	data_inout<= "ZZZZZZZZ" ; 

	wait for 100 ns; 
	chip_select <= '1'; --  Reading data_inout of the memory 
	data_inout<= "ZZZZZZZZ" ; 

	wait for 100 ns;
	chip_select<= '0';
	read_notwrite<= '0'; -- Write mode 
	address<= "000001";  -- Value to be stored at address 1.

	wait for 100 ns; 
	chip_select<= '1';	-- Writing to the address.
	data_inout<= "10100000"; -- Value to be written on address.

	wait for 100 ns; 
	read_notwrite<='1'; -- Reading mode 
	data_inout<= "00000000"; 

	wait for 100 ns;
	chip_select<= '0'; 
	data_inout<= "ZZZZZZZZ" ; 

	wait for 100 ns; 
	chip_select <= '1'; 
	data_inout<= "ZZZZZZZZ" ; 

	wait for 100 ns; 
	address <= "000000" ; 
	data_inout<= "ZZZZZZZZ" ; 

	wait for 100 ns; 
	address <= "000001" ;
	data_inout<= "ZZZZZZZZ" ; 

	wait; -- End of test. Waiting forever.

	end process;	-- End of process.
	
end; -- End of test bench code.