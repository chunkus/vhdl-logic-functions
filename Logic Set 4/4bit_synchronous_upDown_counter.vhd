-- Engineer: Daniyal Naeem.
-- Source code for a 4-bit synchronous up/down counter.

library IEEE;	-- Libraries to be used.
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
-- Entity for our device.
entity fourbit_updown is 
generic (n : positive := 4);	-- Generic value to easily change if necessary.
Port ( 
		  -- N_count (4-bit wide), down_up, CLK, reset are the input ports of our device.
		  -- Q_outputs is the output port of our device.
		  N_count : in std_logic_vector(n-1 downto 0);
          down_up : in std_logic;
          CLK : in std_logic;
          reset : in std_logic;
          Q_outputs : inout std_logic_vector(n-1 downto 0));

end fourbit_updown;	-- End of entity.

-- ARCHITECTURE of the previous defined entity.
architecture behavioral of fourbit_updown is 

-- COMPONENTS to be used in order to have a fully functional device.
-- These are the 4-bit adder/subtractor and the n-bit register.
component four_bit_addSUB 
Port ( 
		  InA : in std_logic_vector(3 downto 0);
          InB : in std_logic_vector(3 downto 0);
          Control : in std_logic;
          Sum : out std_logic_vector(3 downto 0);
          C_out : out std_logic
    );
end component;	-- End of first component.

component nbitregister 
Port ( 
		  CLK : in std_logic;
          D_inputs : in std_logic_vector(3 downto 0);
          reset : in std_logic;
          preset : in std_logic;
          Q_out : out std_logic_vector(3 downto 0);
          Q_out_bar : out std_logic_vector(3 downto 0)
    );
end component;	-- End of second component.

-- Intermediate signals used in the device. 
signal addersubtracter_to_nbitregister, nc : std_logic_vector(3 downto 0);
signal ncADDERsub : std_logic;

begin 
-- Creating to instances to map our entity with the two components previously declared.
A : four_bit_addSUB port map(InA=>Q_outputs, InB=>N_count, Control=>down/up, Sum=>addersubtracter_to_nbitregister, C_out=>ncADDERsub);
B : nbitregister port map(CLK=>CLK, D_inputs=>addersubtracter_to_nbitregister, reset=>reset, preset=>'0', Q_out=>Q_outputs, Q_out_bar=>nc);

end behavioral;	-- End of the entity's architecture.
