-- Company : Queen Mary University 
-- Engineer : Aditya Ajaykumar
-- Date : 14 February 2019
-- Module : lab3_nbitregloadholdcontroltristate
--project : Lab3_DSD_nbitregloadholdcontroltristate

-- The following code is for the n-bit register with load/hold control and tri state enable output.

library IEEE;  -- Defining the library to be used for the code.
use IEEE.STD_LOGIC_1164.ALL;  

-- Declaration of the entity of the n-bit register with load/hold control and tri state enable output.
 entity nbitregloadholdcontroltristate is  
 generic(n:positive:=4);  -- Using a generic variable to easily modify bit width in code.
 
 -- dinputs, loadhold, CLK, reset, preset and outputenable are the input ports of this device.
 -- quoutputs is the output port for this device.
   Port ( dinputs : in STD_LOGIC_VECTOR (n-1 downto 0);  
       loadhold : in STD_LOGIC;  
       CLK : in STD_LOGIC;  
       reset : in STD_LOGIC;  
       outputenable : in STD_LOGIC;  
       qoutputs : out STD_LOGIC_VECTOR (n-1 downto 0));  
 end nbitregloadholdcontroltristate;  -- End of the device's entity.

--	Defining the architecture of this device to describe its way of functioning.
 architecture Behavioral of nbitregloadholdcontroltristate is  
 
 -- Declaring the n-bit register with load/hold control and n-bit tri state buffer components
 -- necessary to have a fully functional device.
 component nbit_reg_loadhold   
 generic(n:positive:=4);  
   Port ( D_inputs : in STD_LOGIC_VECTOR (n-1 downto 0);  
       load_hold : in STD_LOGIC;  
       CLK : in STD_LOGIC;  
       reset : in STD_LOGIC;  
       preset : in STD_LOGIC;  
       Q_outputs : inout STD_LOGIC_VECTOR (n-1 downto 0));  
 end component;  	-- End of the n-bit register with load/hold control.
 
 component nbit_tri_buff   
 generic(n:positive:=4);  
   Port ( Data_in : in STD_LOGIC_VECTOR (n-1 downto 0);  
       enable : in STD_LOGIC;  
       Output : out STD_LOGIC_VECTOR (n-1 downto 0));  
 end component;  -- End of the n-bit tri state buffer.
 
 -- Declaring an intermediate signal which connects the two components together.
 signal tobuffer:std_logic_vector(n-1 downto 0); 

 begin  
-- Port mapping the two components with the device's entity.
 A: nbit_reg_loadhold port map(dinputs,loadhold,CLK,reset,'0',tobuffer);  
 B: nbit_tri_buff port map(tobuffer, outputenable,qoutputs);  
 
 end Behavioral;  	-- End of the architecture.
