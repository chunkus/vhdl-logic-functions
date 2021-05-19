-- Saying what librarys are being used
library ieee;   
use ieee.std_logic_1164.all;

-- Defining the entity of the device.
entity nbittwistedring is
  generic (width : positive := 8);  -- Generic value used to better change bit width if necessary.
    
    -- CLK, reset, preset are the input ports for the device.
    -- Q_outputs is the output port for the device.
    port(
    	 CLK: in std_logic;   
         reset: in std_logic;   
         preset: in std_logic;  
         Q_outputs:inout std_logic_vector(width-1 downto 0));
end nbittwistedring;	-- End of the n-bit twisted ring counter.

--Defing the architechture for the entity created.
architecture behavior of nbittwistedring is
	
	-- Including the n-bit shift register and not gate components to have a fully functional
	-- n-bit twisted ring counter.
	component nbit_shiftreg is	
    Port ( shift_in : in std_logic;  
           CLK : in std_logic;
           reset : in std_logic;
           preset : in std_logic;
           Q_shift : out std_logic_vector(width-1 downto 0));
    end component;   -- End of the n-bit shift register component.
    
     component not1  
       Port ( a : in STD_LOGIC;  --Creating the ports
           f : out STD_LOGIC);  
    end component;  	-- End of the not gate component.
    
    --Defining and intermediate signal to be used between the components.
    signal sa: std_logic; 
    
    begin
    -- Port mapping components with the entity.
    A: nbit_shiftreg port map(sa,clk,reset,preset,q_outputs); 
    B: not1 port map(q_outputs(width-1),sa);
    
end behavior;	-- End of the architecture.
