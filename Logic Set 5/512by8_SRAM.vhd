-- Engineer: Luca Santarelli

-- Following is the source code for the 512 x 8-bit SRAM

LIBRARY ieee;	-- Including libraries to be used.
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

-- Entity for the 512 x 8-bit SRAM.
entity SRAM_512_by_8 is
generic (n : positive := 8); -- Generic value to be easily changed if necessary.
port(
		-- address, read_notwrite, chipselect are the input ports.
		-- data_inout is the input/output port.
		address : in std_logic_vector(8 downto 0); -- Using 9 bits for the address 
		read_notwrite : in std_logic;
		chip_select : in std_logic;
		data_inout : inout std_logic_vector(7 downto 0) -- 8 bits for input/output 
	
	); 

end SRAM_512_by_8;	-- End of entity.

-- Architecture of the device.
architecture SRAM_512_by_8_arch of SRAM_512_by_8 is

-- Adding component of the 3 to 8 decoder.
component three_to_eight_decoder 
port(
		OE : in std_logic;
		address : in std_logic_vector(2 downto 0);
		O_outputs : out std_logic_vector(7 downto 0)
	);

end component; -- End of first component. 

-- Adding component of the 64 by 8 bit static ram.
component sixtyFour_x8sram is
generic (n : positive := 8);
port(
		address : in std_logic_vector(n-3 downto 0);
		read_notwrite : in std_logic;
		chip_select : in std_logic;
		data_inout : inout std_logic_vector(n-1 downto 0)
	);

end component; -- End of second component.

-- Intermediate signal to be used in the device.
signal o_outputsS : std_logic_vector(n-1 downto 0);

begin 
-- Port mapping the 3 to 8 decoder.
select_RAM : three_to_eight_decoder port map (chip_select, address(8 downto 6), o_outputsS);
-- Creating a for generate statement.
for_generate: for i in n-1 downto 0 generate 
	-- Port mapping the 64 x 8 SRAM.
	sixtyfourby8 : sixtyFour_x8sram port map (address(5 downto 0), read_notwrite, o_outputsS(i), data_inout);

end generate; -- End of for generate statement.

end SRAM_512_by_8_arch; -- End of architecture.