library IEEE;  		-- Defining the library to be used.
use IEEE.STD_LOGIC_1164.ALL;  
 
-- Defining the entity of the n-bit 2-input MUX.
entity nbittwoinputmux is  
-- Defining a generic 
generic(n: positive := 4);  
Port ( 
	   InA : in STD_LOGIC_VECTOR (n-1 downto 0);  	-- InA, InB, Control are the input 
       InB : in STD_LOGIC_VECTOR (n-1 downto 0);  	-- signals, as for Output, it is the 
       Control : in STD_LOGIC;  					-- output signal.
       Output : out STD_LOGIC_VECTOR (n-1 downto 0)
    );
      
end nbittwoinputmux;  -- End of the n-bit 2-input MUX.
 
-- Defining the architecture of the n-bit 2-input MUX.
architecture nbit2input_arch of nbittwoinputmux is  
 
 -- Defining the component of the 2-to-1 MUX, needed to set the n-bit 2-input MUX. 
component mux_2to1 is
port (
		SEL : in STD_LOGIC ; 
		A : in STD_LOGIC;
		B : in STD_LOGIC;      --Input and selection line declaration
		Y : out STD_LOGIC);    --Output declaration

end component; --End of component. 

begin  
 	-- Creating a for generate statement to instantiate the n-bit 2-input MUX signals with
 	-- those of the 2-to-1 MUX.
 	inst: for i in n-1 downto 0 generate  
 	A: mux_2to1 port map(A => InA(i), B => InB(i), SEL => Control, Y => Output(i));  
 	
 	end generate;  -- End of for loop generate statement.
 
 end nbit2input_arch;  -- End of n-bit 2-input MUX architecture.


--s a b output  
 --0 0 0  0  
 --0 0 1  0  
 --0 1 0  1   
 --0 1 1  1  
 --1 0 0  0  
 --1 0 1  1  
 --1 1 0  0  
 --1 1 1  1
