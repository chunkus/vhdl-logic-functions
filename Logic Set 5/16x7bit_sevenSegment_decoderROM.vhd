-- Engineer: Daniyal Naeem

-- Source code for the 16 x 7 bit seven segment decoder ROM.

library IEEE;	-- Including libraries to be used.
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Entity of the device.
entity sixteen_7bit_segment_decoder is

Port ( 
		-- address is the input port.
		-- data_outputs is the output port.
		address : in std_logic_vector(3 downto 0);
        data_outputs : out std_logic_vector(6 downto 0)
    );
-- End of entity.
end sixteen_7bit_segment_decoder;

-- Architecture of the device. 
architecture behavioral of sixteen_7bit_segment_decoder is

begin
-- Using a with-select statement to assign each address the corresponding data output, necessary
-- to display the correct value on the 7 segment display.
with address select 
data_outputs <= "1111110" when "0000",	-- To display ZERO.
				"0110000" when "0001",	-- To display ONE.
				"1101101" when "0010",	-- To display TWO.
				"1111001" when "0011",	-- To display THREE.
				"0110011" when "0100",	-- To display FOUR.
				"1011011" when "0101",	-- To display FIVE.
				"1011111" when "0110",	-- To display SIX.
				"1110000" when "0111",	-- To display SEVEN.
				"1111111" when "1000",	-- To display EIGHT.
				"1111011" when "1001",	-- To display NINE.
				"1101111" when "1010",	-- To display TEN (A).
				"0011111" when "1011",	-- To display ELEVEN (B).
				"1001110" when "1100",	-- To display TWELVE (C).
				"0111101" when "1101",	-- To display THIRTEEN (D).
				"1001111" when "1110",	-- To display FOURTEEN (E).
				"1000111" when "1111",	-- To display FIFTEEN (F).
				"0000000" when others;	-- Case for other possible values, to have value ZERO assigned to them.

end behavioral;	-- End of the architecture.