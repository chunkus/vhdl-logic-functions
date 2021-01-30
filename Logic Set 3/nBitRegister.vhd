-- Engineer: Luca Santarelli
-- The following code is the source code for an n-bit register.

library ieee;	-- Defining the library to be used.
use ieee.std_logic_1164.all;

-- Defining the entity of the n-bit register.
entity nbitregister is
generic (width : positive := 4);	-- Defining a generic default value of 4 to be later modified if necessary.
port (	
		-- List of input and output signals of the n-bit register.
		-- Input signals: CLK, D_inputs, reset, preset.
		-- Output signals: Q_out, Q_out_bar.
		CLK : in std_logic;
		D_inputs : in std_logic_vector (width-1 downto 0);
		reset : in std_logic;
		preset : in std_logic;
		Q_out : out std_logic_vector (width-1 downto 0);
		Q_out_bar : out std_logic_vector (width-1 downto 0)
	 );

end nbitregister;	-- End of the entity.

-- Defining the architecture of the n-bit register.
architecture nbitregister_arch of nbitregister is

-- Defining the component of the d-flip-flop to be used with the n-bit register.
component dflipflop is
port(
		D : in std_logic;	
		reset : in std_logic;	
		preset : in std_logic;
		CLK : in std_logic;
		Q : out std_logic;
		Q_bar : out std_logic
);

end component;	-- End of the d-flip-flop component.

begin
	-- Defining a for generate statement to create the instance for the n-bit register.
	for_gen : for i in width-1 downto 0 generate
		
		-- Creating the instances of the n-bit register.
		instance : dflipflop port map (CLK=>CLK, D=>D_inputs(i), reset=>reset, preset=>preset, Q=>Q_out(i), Q_bar=>Q_out_bar(i));
		
	end generate;	-- End of the for generate.
		
end nbitregister_arch;	-- End of the architecture of the n-bit register.