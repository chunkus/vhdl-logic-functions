-- Including the libraries to be used.
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

-- Entity of the device.
entity SRAM_512_by_32_tb is 
end SRAM_512_by_32_tb;	-- End of the entity.

-- Architecture of the device.
architecture SRAM_512_by_32_tb_arch of SRAM_512_by_32_tb is

-- Adding as a component the 512 x 32-bit SRAM to be used as the Unit Under Test (UUT).
component SRAM_512_by_32 is 
generic (n : positive :=32);
port(
		address : in std_logic_vector(n-24 downto 0); -- n-24 as we only need 9 bits for address 
		read_notwrite : in std_logic;
		chip_select : in std_logic;
		data_inout : inout std_logic_vector(n-1 downto 0));-- n-1 as only need 32 bits for input/output 

end component; 

-- Input signals to be used to test the device.
signal address : std_logic_vector(8 downto 0) := "00000000";
signal read_notwrite, chip_select : std_logic := '0';

-- Output signals to be used to test the device.
signal data_inout : std_logic_vector(31 downto 0) := "0000000000000000000000000000000";

begin 

-- Instantiating the UUT.
UUT: SRAM_512_by_32 port map ( address=>address, read_notwrite=>read_notwrite, chip_select=>chip_select, data_inout=>data_inout);

test_bench : process -- Entering process to test functionality of the device.
begin  
	
-- Following is the truth table for the 512 x 32-bit SRAM:

-- Address              read_notwrite   chip_select        Data_inout
-- Any 9-bit address        0                1             00000000...(32 bits of 0)      	-- Value 00000000 is written into the register, specified by the address on the first column. 
-- Any 9-bit address        0                1             any value(32 bits)           	-- The Data_inout value is written into the register, specified by the address on first column
-- Any 9-bit address        1                1             any value (32 bits)          	-- The value on the address specified in the first column is read. 
-- Any 9-bit address        x                0             ZZZZZZZZ...(32 bits of Z)   		-- When chip_select is '0' the output will always be the high impedance.
	
	
	address<= "000000000"; -- Selects address 0 to store data in. 
	read_notwrite <= '0';
	chip_select<= '1'; -- Enabling chip_select to write to the address.
	
	wait for 20 ns; 
	data_inout<= "00000000000000000000000000000001"; -- Writing value 1 to the address.
	
	wait for 100 ns;
	address<= "011111111"; -- Select different address.
	read_notwrite<= '0'; -- Writing mode enabled.
	chip_select<= '1'; -- Enabling chip_select to write to the address.
	
	wait for 20 ns;
	data_inout<= "00000000000000000000000100000001"; -- Store this value in the new address.
	
	wait for 100 ns; 
	address <= "000000000" ; -- Setting address back to 0, so to read its stored value.
	read_notwrite<= '1';
	chip_select<= '1';
	
	wait for 20 ns;
	data_inout<= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ; -- Reading the stored value.
	
	wait for 100 ns; 
	address <= "011111111" ; -- Setting address back to 011111111, so to read its stored value.
	read_notwrite<= '1';
	chip_select<= '1';
	
	wait for 20 ns;
	data_inout<= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" ; -- Reading the stored value.
    
    wait for 100 ns;
	address <= "010100000"; -- Selecting a random address, with chip_select being 0, so to have a high impedance and get Z on the output.
    read_notwrite <= '1'; 
    chip_select <='0'; 
    data_inout <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
	
	wait; -- End of test. Waiting forever.
	
	end process;	-- End of process.
	
end; -- End of test bench code. 
