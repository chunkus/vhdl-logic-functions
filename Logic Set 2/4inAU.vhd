--------------------------------------------------------------------------------
-- Engineer: Tobi Adebari
-- Following is the source code for a 4-bit Arithmetic Unit.
--------------------------------------------------------------------------------

-- Saying what librarys are being used
library IEEE;  
 use IEEE.STD_LOGIC_1164.ALL;  

--Creating the entity 
 entity four_bit_arithmetic_unit is  

   Port ( 
   			InA : in STD_LOGIC_VECTOR (3 downto 0);  --Creating the ports
       		InB : in STD_LOGIC_VECTOR (3 downto 0);  
       		Control : in STD_LOGIC_VECTOR (1 downto 0);  
       		Sum : out STD_LOGIC_VECTOR (3 downto 0);  
       		C_out : out STD_LOGIC
       	);  
       	
 end four_bit_arithmetic_unit;  

--Defing the architechture for the entity created
 architecture Behavioral of four_bit_arithmetic_unit is  

--Creating the subcircuit/component used
 Component nbittwoinputmux   
 generic(n:positive:=4);   
	Port ( 
   			InA : in STD_LOGIC_VECTOR (n-1 downto 0);   --Creating the ports for the component
       		InB : in STD_LOGIC_VECTOR (n-1 downto 0);  
       		Control : in STD_LOGIC;  
       		Output : out STD_LOGIC_VECTOR (n-1 downto 0)
       );
         
 end component;  

--Creating the subcircuit/component used
 component four_bit_addSUB   
   Port ( 
   			InA : in STD_LOGIC_VECTOR (3 downto 0);  --Creating the ports for the component
       		InB : in STD_LOGIC_VECTOR (3 downto 0);  
       		Control : in STD_LOGIC;  
       		Sum : out STD_LOGIC_VECTOR (3 downto 0);  
       		C_out : out STD_LOGIC
       	);  
       	
 end component;  

 -- Defining and intermediate signal.
 signal muxtoadder:std_logic_vector(3 downto 0);  
 
 begin  
 A: nbittwoinputmux port map(InA=>"0001", InB=>InB, Control=>Control(0), Output=>muxtoadder);   --mapping the port of the device
 B: four_bit_addSUB port map(InA=>InA, InB=>muxtoadder, Control=>Control(1), Sum=>Sum, C_out=>C_out);  
 
end Behavioral;  -- End of the architecture.