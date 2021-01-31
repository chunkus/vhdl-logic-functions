-- Company : Queen Mary University 
-- Engineer : Aditya Ajaykumar
-- Date : 06 March 2019
-- Module : lab5_64x8sram
--project : Lab5_DSD_64x8sram

-- Source code for the 64 x 8-bit Static RAM.

LIBRARY ieee;	-- Including necessary libraries.
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

-- Entity for the device.
entity sixtyFour_x8sram is 
generic (n : positive := 8);	-- Defining generic value to be change if necessary.
port(
		-- address, read_notwrite, chip_select are the input ports of the device.
		-- data_inout is the input/output port of the device.
		address : in std_logic_vector(n-3 downto 0); 
		read_notwrite : in std_logic;
		chip_select : in std_logic;
		data_inout : inout std_logic_vector(n-1 downto 0)
	);
-- End of the entity.
end sixtyFour_x8sram; 

-- Defining the device's architecture.
architecture sixtyFour_x8sram_arch of sixtyFour_x8sram is

-- Component for the 64 x 4-bit Static RAM.
component sixtyFour_x4sram 
generic (n : positive := 8);	-- Defining generic value to be change if necessary.
port(
		address : in std_logic_vector(n-3 downto 0); -- 6 bits address 
		Readwrite : in std_logic;
		chip_select : in std_logic;
		Data_inout : inout std_logic_vector(n-5 downto 0));--  4 bits  I/O 
-- End of component.
end component;  

begin 
-- Port mapping both 64 x 8-bit Static RAMs with the entity block.
LSB_RAM : sixtyFour_x4sram port map (address=>address, Readwrite=>read_notwrite, chip=_select=>chip_select, Data_inout=>data_inout(7 downto 4)); 
MSB_RAM : sixtyFour_x4sram port map (address=>address, Readwrite=>read_notwrite, chip_select=>chip_select, Data_inout=>data_inout(3 downto 0)); 

end sixtyFour_x8sram_arch; -- End of the architecture.