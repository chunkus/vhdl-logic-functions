-- Engineer: Luca Santarelli

-- Following is the source code of the washing machine output logic device of the washer controller 
-- main source code.

library ieee;	-- Defining the library to be used for the code.
use ieee.std_logic_1164.all;

-- Definition of the entity for the output logic.
entity washer_output_logic is
generic (width : positive := 3);	-- Generic value used to easily modify its value throughout the code if necessary.
port (
		-- Stating the ports of the device.
		-- Input port: state.
		-- Output ports: door_lock, water_pump, soap, rotate_drum, drain.
		state : in std_logic_vector(width-1 downto 0);
		door_lock : out std_logic;
		water_pump : out std_logic;
		soap : out std_logic;
		rotate_drum : out std_logic;
		drain : out std_logic
);

end washer_output_logic;	-- End of the entity definition.

-- Declaring the architecture belonging to the previously stated entity.
architecture output_logic_arch of washer_output_logic is
begin
	
	-- Entering process to assign the output values to the belonging states.
	output_of_state : process (state)
	begin
	
	-- The case statement is used to assign the output values belonging to each state.
	case state is
		when "000" =>	-- Output values for state 0.
			door_lock<='0';
			water_pump<='0';
			soap<='0';
			rotate_drum<='0';
			drain<='0';
	
		when "001" =>	-- Output values for state 1.
			door_lock<='1';
			water_pump<='1';
			soap<='1';
			rotate_drum<='0';
			drain<='0';
	
		when "010" =>	-- Output values for state 2.
			door_lock<='1';
			water_pump<='0';
			soap<='0';
			rotate_drum<='1';
			drain<='0';
	
		when "011" =>	-- Output values for state 3.
			door_lock<='1';
			water_pump<='0';
			soap<='0';
			rotate_drum<='0';
			drain<='1';
	
		when "100" =>	-- Output values for state 4.
			door_lock<='1';
			water_pump<='1';
			soap<='0';
			rotate_drum<='0';
			drain<='0';
	
		when "101" =>	-- Output values for state 5.
			door_lock<='1';
			water_pump<='0';
			soap<='0';
			rotate_drum<='1';
			drain<='0';
	
		when "110" =>	-- Output values for state 6.
			door_lock<='1';
			water_pump<='0';
			soap<='0';
			rotate_drum<='0';
			drain<='1';
	
		when "111" =>	-- Output values for state 7.
			door_lock<='1';
			water_pump<='0';
			soap<='0';
			rotate_drum<='1';
			drain<='1';
				
		when others =>	-- Catch all condition assignment.
			door_lock<='0';
			water_pump<='0';
			soap<='0';
			rotate_drum<='0';
			drain<='0';
	
	end case;	-- End of the case statement.

	end process output_of_state;	-- End of the process to identify output of the state.

end output_logic_arch;	-- End of the architecture.