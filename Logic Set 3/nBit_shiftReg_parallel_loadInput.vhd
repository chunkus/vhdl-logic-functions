library IEEE;  	-- Declaring the library to be used in the code.
use IEEE.STD_LOGIC_1164.ALL;  
 
-- Defining the entity of this type of n-bit register.
entity nbitshiftregparallelload is  
generic(n:positive:=8);  -- Using a generic variable to be used to change its value easily throughout the code.
   
   -- Shiftin, dinputs, laodshift, CLK, reset and preset are the input ports for this device.
   -- qoutputs is the only output port defined.
   
   Port ( shiftin : in STD_LOGIC;  
       dinputs : in STD_LOGIC_VECTOR (n-1 downto 0);  
       loadshift : in STD_LOGIC;  
       CLK : in STD_LOGIC;  
       reset : in STD_LOGIC;  
       preset : in STD_LOGIC;  
       qoutputs : out STD_LOGIC_VECTOR (n-1 downto 0));  
 end nbitshiftregparallelload;  -- End of entity declaration.
 
 -- Stating the architecture of the entity in order to define the device's function.
 architecture Behavioral of nbitshiftregparallelload is  
 
 -- Declaring the n-bit 2-input-MUX and n-bit register components, necessary to be used
 -- in order to have a fully functional n-bit shift register with parallel load input.
 -- Both components have some vector ports all of the same length (8-bits).
 component nbittwoinputmux   
   Port ( InA : in STD_LOGIC_VECTOR (7 downto 0);  
       InB : in STD_LOGIC_VECTOR (7 downto 0);  
       Control : in STD_LOGIC;  
       Output : out STD_LOGIC_VECTOR (7 downto 0));   
 end component;  	-- End n-bit 2-input- MUX component.
 
 component nbitregister   
   Port ( 
       CLK : in STD_LOGIC; 
       D_inputs : in STD_LOGIC_VECTOR (7 downto 0);   
       reset : in STD_LOGIC;  
       preset : in STD_LOGIC;  
       Q_out : out STD_LOGIC_VECTOR (7 downto 0);  
       Q_out_bar : out STD_LOGIC_VECTOR (7 downto 0));  
 end component; -- End of the n-bit register component.
 
 -- Defining intermediate/immediate signals used in the device. 
 signal feedback_sig:std_logic_vector(n downto 0);  
 signal muxToReg,dummy_sig:std_logic_vector(n-1 downto 0);  
 
 -- Beginning the description of the n-bit shift register with parallel load input functioning.
 begin  
 feedback_sig(0) <= shiftin;  -- Assigning the shiftin port, to bit zero of the feedback_sig intermediate signal.
 
 -- Creating mappings of the main entity with the two components defined.
 A: nbittwoinputmux port map(InA=>feedback_sig(n-1 downto 0),InB=>D_inputs, Control=>loadshift, Output=>muxToReg);  
 B: nbitregister port map(D_inputs=>muxToReg, CLK=>CLK, reset=>reset, preset=>preset, Q_out=>feedback_sig(n downto 1), Q_out_bar=>dummy_sig);  
 
 -- The output port of the main entity has the bits 1 to 8 assigned to it, from the feedback_sig intermediate signal.
 qoutputs <= feedback_sig(n downto 1);  
 
 end Behavioral;  -- End of the architecture.



