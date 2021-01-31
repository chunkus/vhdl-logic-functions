-- Company : Queen Mary University 
-- Engineer : Aditya Ajaykumar
-- Date : 06 March 2019
-- Module : lab5_64x4sram
--project : Lab5_DSD_64x4sram

-- Source code for 64 x 4-bit Static RAM.

 library IEEE;  -- Including library to be used.
 use IEEE.STD_LOGIC_1164.ALL;  
 use IEEE.STD_LOGIC_ARITH.ALL;  
 use IEEE.STD_LOGIC_UNSIGNED.ALL;  
 
 -- Entity for the device.
 entity sixtyFour_x4sram is  
 generic (n : positive := 8);	-- Defining generic value to easily change if necessary. 
 Port ( 
 	   -- address, Readwrite, chip_select are the input ports of the device.
 	   -- Data_inout is the input/output port for the device.
 	   address : in STD_LOGIC_VECTOR (n-3 downto 0);  
       Readwrite : in STD_LOGIC;  
       chip_select : in STD_LOGIC;   
       Data_inout : inout STD_LOGIC_VECTOR (n-5 downto 0)
    );  
 
 end  sixtyFour_x4sram;  -- End of entity.

-- Defining the device's architecture.
architecture Behavioral of  sixtyFour_x4sram is  

-- Including components to have a fully functional 64 x 4-bit Static RAM.
-- Component for the 3-to-8 decoder.
component three_to_eight_decoder
Port (        
      OE : in std_logic;  
      address : in std_logic_vector(2 downto 0);       
      O_outputs : out std_logic_vector(7 downto 0)
    );       
-- End of first component.
end component;  

-- Component for the 8 x 4-bit SRAM.
component eight_by_four_sram 
Port (      
		address : in std_logic_vector(2 downto 0);    
        read_notwrite : in std_logic;  
        chip_select : in std_logic;  
        data_inout : inout std_logic_vector(3 downto 0)
    );
-- End of second component.   
end component;  

-- Defining intermediate signals to be used in the device.
signal OoUt_sig : std_logic_vector(n-1 downto 0);     
signal DATA_sig: std_logic_vector(n-5 downto 0);   

begin  
-- Port mapping the 3-to-8 decoder with the entity.
RAM_CHOICE: three_to_eight_decoder port map (OE=>Chip_select , address=>Address(5 downto 3) , O_outputs=>OoUt_sig);   

-- Using a for generate statement to port map all eight 8 x 4-bit SRAMs.
inst : for i in n-1 downto 0 generate   
	  -- Port mapping all eight 8 x 4-bit SRAMs.
      SRAM_N: eight_by_four_sram port map (address=>address(2 downto 0) , read_notwrite=>Readwrite , chip_select=>OoUt_sig(i), data_inout=>DATA_sig);  
      Data_inout<=DATA_sig;  

end generate;  -- End of for generate statement.     

end Behavioral;  -- End of the architecture.