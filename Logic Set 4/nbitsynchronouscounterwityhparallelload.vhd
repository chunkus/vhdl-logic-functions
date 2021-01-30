-- Engineer: Youssef Akil
-- The following code is the source code for the n-bit synchronous counter with parallel load.

library ieee;	-- Defining the library to be used.
use ieee.std_logic_1164.all; 

-- Declaring entity of device.
 entity nbitsynchronouscounterwithparallelload is  
 generic(n : positive := 8);  
 -- List of input and output signals of the n-bit register.
		-- Input signals: CLK, D_inputs, loadcount, countenable, reset.
		-- Bitdirectional signal: qoutputs
   Port ( D_inputs : in STD_LOGIC_VECTOR (n-1 downto 0);  
       loadcount : in STD_LOGIC;  
       countenable : in STD_LOGIC;  
       clk : in STD_LOGIC;  
       reset : in STD_LOGIC;  
       qoutputs : inout STD_LOGIC_VECTOR (n-1 downto 0)  
                 );  
 end nbitsynchronouscounterwithparallelload;  
 
 -- Architecture of the device.
 architecture Behavioral of nbitsynchronouscounterwithparallelload is  
 
 component n_bitincrementer   -- N-bitincrementer component implemented
   Port ( ina : in STD_LOGIC_VECTOR (7 downto 0);  
       c_in : in STD_LOGIC;  
       sum : out STD_LOGIC_VECTOR (7 downto 0);  
       c_out : out STD_LOGIC);  
 end component;  --End of n-bitincrementer
 
 component nbittwoinputmux   --Nbittwoinputmux from previous lab implemented
   Port ( InA : in STD_LOGIC_VECTOR (7 downto 0);  
       InB : in STD_LOGIC_VECTOR (7 downto 0);  
       Control : in STD_LOGIC;  
       Output : out STD_LOGIC_VECTOR (7 downto 0));  
 end component;  --End of nbittwoinputmux component
 
 component nbitregister   --Nbitregister from  from previous lab implemented
   Port ( CLK : in std_logic;
		D_inputs : in std_logic_vector (7 downto 0);
		reset : in std_logic;
		preset : in std_logic;
		Q_out : out std_logic_vector (7 downto 0);
		Q_out_bar : out std_logic_vector (7 downto 0)
       );  
 end component;   -- End of nbitregister component
 
 -- Intermediate signals used in the device.
 signal nc : std_logic;  
 signal feedback, tomux, toreg, nc2:std_logic_vector(n-1 downto 0);  
 
 begin  
 -- Port mapping the components with the entity.
 qoutputs<=feedback;  
 A: n_bitincrementer port map(ina=>feedback, c_in=>countenable, sum=>tomux, c_out=>nc);  
 B: nbittwoinputmux port map(InA=>tomux, InB=>D_inputs, Control=>loadcount, Output=>toreg);  
 C: nbitregister port map(D_inputs=>toreg, CLK=>clk, reset=>reset, preset=>'0', Q_out=>feedback, Q_out_bar=>nc2);  
 
 end Behavioral;  -- End of architecture.