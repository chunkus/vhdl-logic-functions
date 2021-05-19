-- Saying what librarys are being used
 library IEEE;  
 use IEEE.STD_LOGIC_1164.ALL;  
 
--Creating the entity 
 entity nbitlogicunit is  
 generic(n:positive:=4);  
 Port ( 
   		InA : in STD_LOGIC_VECTOR (n-1 downto 0);  --Creating the ports
       	InB : in STD_LOGIC_VECTOR (n-1 downto 0);  
       	control : in STD_LOGIC_VECTOR (1 downto 0);  
       	output : out STD_LOGIC_VECTOR (n-1 downto 0)
       	); 
       	 
 end nbitlogicunit;  

--Defing the architechture for the entity created
 architecture Behavioral of nbitlogicunit is  
 
 --Creating the subcircuit/component used
 component onebitlogicslice   
   Port ( 
   			a : in STD_LOGIC;  --Creating the ports for the component
       		b : in STD_LOGIC;  
       		cntrl : in STD_LOGIC_VECTOR (1 downto 0);  
       		output : out STD_LOGIC
       		);  
 end component;  

 begin  
 inst: for i in n-1 downto 0 generate  
 	
 	A: onebitlogicslice port map(a=>InA(i), b=>InB(i), cntrl=>control, output=>output(i));  --mapping the port of the device
 
 end generate;  

end Behavioral;  
