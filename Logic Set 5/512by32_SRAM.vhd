-- Engineer: Luca Santarelli

-- Source code for the 512 x 32-bit SRAM.

-- Including libraries to be used.
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

-- Entity for the 512 x 32-bit SRAM.
entity SRAM_512_by_32 is -- declaring 512 by 32 bit static ram 
generic (n : positive := 32);
port(
		-- address, read_notwrite, chip_select are the input ports.
		-- data_inout is the input/output port.
		address : in std_logic_vector(n-24 downto 0); -- n-24, since only 9 bits for address are needed.
		read_notwrite : in std_logic;
		chip_select : in std_logic;
		data_inout : inout std_logic_vector(n-1 downto 0) -- n-1, since only 32 bits for input/output are needed.
	);

end SRAM_512_by_32; -- End of the entity.

-- Architecture for the 512 x 32-bit SRAM.
architecture SRAM_512_by_32_arch of SRAM_512_by_32 is 

-- Adding component of the 512 x 8-bit static ram.
component SRAM_512_by_8 
generic (n : positive :=8);
port(
		address : in std_logic_vector(8 downto 0); 
		read_notwrite : in std_logic;
		chip_select : in std_logic;
		data_inout : inout std_logic_vector(7 downto 0)
	);

end component; -- End of the component. 

begin 
-- Port mapping the 512 x 8-bit SRAM with our device.
LSB0_RAM : SRAM_512_by_8 port map (address, read_notwrite, chip_select, data_inout(31 downto 24)); -- LSB data.
LSB_RAM : SRAM_512_by_8 port map (address, read_notwrite, chip_select, data_inout(23 downto 16)); -- Middle part of LSB data.
MSB_RAM : SRAM_512_by_8 port map (address, read_notwrite, chip_select, data_inout(15 downto 8)); --  Middle part of MSB data.
MSB0_RAM : SRAM_512_by_8 port map (address, read_notwrite, chip_select, data_inout(7 downto 0)); --  MSB data.

end SRAM_512_by_32_arch; -- End of the architecture.