library IEEE;
use IEEE.std_logic_1164.all;	-- Stating what library is going to be used.

-- two input OR named myor --

-- Creating the entity.
entity myor is 

Port ( 
          A : in std_logic;		-- Defining the ports that are going to be used. 
          B : in std_logic;
          F : out std_logic);
end myor;						-- End of entity myor.

-- ARCHITECTURE --

-- Defining the architecture for the entity created.
architecture myor_arch of myor is

begin 
-- How the gate works.
       F <= A or B after 7ns;	-- The gate is started after a 7 nano second delay.

end myor_arch;					-- End of the architecture.

