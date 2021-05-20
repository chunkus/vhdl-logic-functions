-- Saying what librarys are being used
library ieee;	-- Defining the library to be used.
use ieee.std_logic_1164.all;

--Creating the entity 
entity counterwithnextstate is
generic (width : positive := 4);	-- Defining a generic default value of 4 to be later modified if necessary.
port(
        CLK: in std_logic;      --Creating the ports
        RESET: in std_logic;
        Q_outputs: inout std_logic_vector(width-1 downto 0)
        );
end counterwithnextstate;

--Defing the architechture for the entity created
architecture behaviour of counterwithnextstate is

--Creating the subcircuit/component used
component nextstate is 
    port(
            input: in std_logic_vector(width-1 downto 0);       --Creating the ports
            output: out std_logic_vector(width-1 downto 0)
        );
end component;

--Creating the subcircuit/component used
component nbitregister is
    port (	
		CLK : in std_logic;       --Creating the ports
		D_inputs : in std_logic_vector (width-1 downto 0);
		reset : in std_logic;
		preset : in std_logic;
		Q_out : out std_logic_vector (width-1 downto 0);
		Q_out_bar : out std_logic_vector (width-1 downto 0)
	 );
end component;

signal output_to_D_inputs: std_logic_vector(width-1 downto 0);
signal Q_outputs_to_input: std_logic_vector(width-1 downto 0);

begin

nsmap: nextstate port map(Q_outputs,output_to_D_inputs);    --mapping the port of the device
bitregmap: nbitregister port map(CLK,output_to_D_inputs,reset,'0',Q_outputs);   --mapping the port of the device

end;
            

        
