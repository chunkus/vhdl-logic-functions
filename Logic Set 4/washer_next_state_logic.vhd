library ieee;	-- Including the library to be used for the code.
use ieee.std_logic_1164.all;

-- Declaring the entity to be used of the next state of the washing machine.
entity washer_next_state_logic is 
generic (width : positive := 3);	-- Generic value defined to be changed easily if necessary.
port (
		-- Defining the ports of this device.
		-- Input ports: state, control, door_open.
		-- Output port: next_state.
		state : in std_logic_vector(width-1 downto 0);
		control : in std_logic;
		door_open : in std_logic;
		next_state : out std_logic_vector(width-1 downto 0)
	);

end washer_next_state_logic;	-- End of the entity declaration.

-- Defining the architecture of the entity previously declared.
architecture next_state_arch of washer_next_state_logic is


begin
	
	-- Defining process which declares the states the port 'state' will have based on the 
	-- values of the 'door_open' and 'control' input ports.
	-- The following process will only be accessed when there's a change in value of the 
	-- ports 'control', 'door_open', 'state'.
	determining_state : process(control, door_open, state)
	begin
		
		-- A case statement is used to assign the states to the 'state' port.
		case state is
		when "000" =>	-- state remains at the current state.
			
			-- When door_open and control are '1' and don't care case '-' respectively
			-- state will remain at its current state (0).
			if (door_open = '1') and (control = '-') then
			next_state<="000";
			
			-- When door_open and control are '0' and '0' respectively
			-- state will remain at its current state (0).
			elsif (door_open = '0') and (control = '0') then
			next_state<="000";
			
			-- When door_open and control are '0' and '1' respectively
			-- state will go to the next state (1).
			elsif (door_open = '0') and (control = '1') then
			next_state<="001";
			
			end if;	-- End if statement.
		
		-- Any combination of door_open and control will have 'state' (here being 1) have 
		-- a next state of 2.
		when "001" =>
		next_state<="010";
		
		-- Any combination of door_open and control will have 'state' (here being 2) have 
		-- a next state of 3.
		when "010" =>
		next_state<="011";
		
		-- Any combination of door_open and control will have 'state' (here being 3) have 
		-- a next state of 4.
		when "011" =>
		next_state<="100";
		
		-- Any combination of door_open and control will have 'state' (here being 4) have 
		-- a next state of 5.
		when "100" =>
		next_state<="101";
		
		-- Any combination of door_open and control will have 'state' (here being 5) have 
		-- a next state of 6.
		when "101" =>
		next_state<="110";
		
		
		when "110" =>	-- state has a current state of 6.
			
			-- When door_open and control are don't care case '-' and '0' respectively
			-- state will have next state 0.
			if (door_open = '-') and (control = '0') then
			next_state<="000";
			
			-- When door_open and control are don't care case '-' and '1' respectively
			-- state will have next state 7.
			elsif (door_open = '-') and (control = '1') then
			next_state<="111";
			
			end if;	-- End if statement.
		
		-- Any combination of door_open and control will have 'state' (here being 7) have 
		-- a next state of 0.
		when "111" =>
		next_state<="000";
		
		when others =>	-- Catch all condition assignment.
		next_state<="000";
		
		end case;	-- End of the case statement.
		
	end process determining_state;	-- End of the process to assign states.

end next_state_arch;	-- End of the architecture.
