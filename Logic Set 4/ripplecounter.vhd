--------------------------------------------------------------------------------
-- Engineer: Tobi Adebari
-----------------------------------------------------
-- Saying what librarys are being used
library ieee;	-- Defining the library to be used.
use ieee.std_logic_1164.all;

--Creating the entity 
entity nbitripplecounter is
    generic (width : positive := 4);	-- Defining a generic default value of 4 to be later modified if necessary.
    port(
       CLK: in std_logic;       --Creating the ports
       RESET: in std_logic;
       Q_outputs: inout std_logic_vector(width-1 downto 0);
       Q_bar_outputs: inout std_logic_vector(width-1 downto 0)
       );
end nbitripplecounter;

--Defing the architechture for the entity created
architecture behaviour of nbitripplecounter is


--Creating the subcircuit/component used
component T_flipflop is
    Port (    reset : in std_logic;         --Creating the ports for the 
	 		  Clk : in std_logic;
              Q : inout std_logic;
              Q_bar : inout std_logic);
end component;
        
begin

	for_gen : for i in width-1 downto 0 generate
	    case1: if i = 0  generate
		instance : T_flipflop port map ( reset,CLK,Q_outputs(i), Q_bar_outputs(i));       --mapping the port of the device
	end generate;	-- End of the for generate.
		case2: if i/= 0 generate
		instance : T_flipflop port map ( reset,Q_bar_outputs(i-1),Q_outputs(i), Q_bar_outputs(i));        --mapping the port of the device
	end generate;	-- End of the for generate.

	end generate;	-- End of the for generate.
end;