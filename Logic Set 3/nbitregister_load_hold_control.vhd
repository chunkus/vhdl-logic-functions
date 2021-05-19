library IEEE;	-- Defining the libraries to be used.
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

-- Declaring the entity of the n-bit register with load/hold control.
entity nbit_reg_loadhold is 
generic ( n : positive := 4 );	-- Using a generic value (default of 4) in case we need to change number of bits used.
Port ( 
	   -- Declaring the input and output signals of the entity.
	   -- D_inputs, load_hold, CLK, reset, preset are the input signals.
	   -- Q_outputs is the output signal being fed back into the InA input of the n-bit 2-input MUX (used as a component).
	   D_inputs : in STD_LOGIC_VECTOR (n-1 downto 0);  
       load_hold : in STD_LOGIC;  
       CLK : in STD_LOGIC;  
       reset : in STD_LOGIC;  
       preset : in STD_LOGIC;  
       Q_outputs : inout STD_LOGIC_VECTOR (n-1 downto 0));  

end nbit_reg_loadhold;  -- End of the entity definition.

-- Declaring the architecture of the previously defined entity, for the n-bit register with a load/hold control.
architecture behavioral of nbit_reg_loadhold is

-- Defining the components of the n-bit register and of the n-bit 2-input MUX, needed to have 
--a functional n-bit register with a load/hold control.
component nbitregister 
generic(width : positive :=4);  
port ( 
       CLK : in STD_LOGIC;  
       D_inputs : in std_logic_vector (width-1 downto 0);
       reset : in STD_LOGIC;  
       preset : in STD_LOGIC;  
       Q_out : out STD_LOGIC_VECTOR (width-1 downto 0);  
       Q_out_bar : out STD_LOGIC_VECTOR (width-1 downto 0));  
 
 end component;		-- End of the n-bit register component.

component nbittwoinputmux   
 generic(n:positive:=4);  
   Port ( 
		InA : in STD_LOGIC_VECTOR (n-1 downto 0);  
		InB : in STD_LOGIC_VECTOR (n-1 downto 0);  
		Control : in STD_LOGIC;  
		Output : out STD_LOGIC_VECTOR (n-1 downto 0)
	);  

end component;  	-- End of the n-bit 2-input MUX component.

-- Defining intermediate/immediate signals used in the  n-bit register with a load/hold control.
-- The muxtoreg is the signal connecting the output of the n-bit 2-input MUX to the n-bit register D_inputs.
-- The not_connected is the signal used to have a "dummy" connection on the n-bit register Q_bar_outputs.
signal muxtoreg, not_connected : std_logic_vector(n-1 downto 0);  
 
-- Creation of the instances.
begin  
	-- Instance A is port mapping the ports of the n-bit register with a load/hold control entity
	-- to those of a n-bit 2-input MUX.
	A: nbittwoinputmux port map(InA=>Q_outputs,InB=>D_inputs, Control=>load_hold, Output=>muxtoreg);  
	
	-- Instance B is port mapping the ports of the n-bit register with a load/hold control entity
	-- to those of the n-bit register.
	B: nbitregister port map(D_inputs=>muxtoreg, CLK=>CLK, reset=>reset, preset=>preset, Q_out=>Q_outputs, Q_out_bar=>not_connected);  

end behavioral;	-- End of the architecture of the  n-bit register with a load/hold control.
