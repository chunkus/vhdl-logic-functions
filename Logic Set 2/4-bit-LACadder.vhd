library IEEE;						-- Defining the library to be used.
use ieee.std_logic_1164.all;
entity LAC4bitAdd is
port (
		InA : in std_logic_vector (3 downto 0); 
		InB : in std_logic_vector (3 downto 0); -- Defining the input and output
		C_in : in std_logic;							-- ports that will be used for this
		Sum : out std_logic_vector (3 downto 0);		-- entity.
		C_out : out std_logic
		);

end LAC4bitAdd;	-- End entity LAC4bitAdd.
		
-- Defining the architecture of the entity LAC4bitAdd.
architecture archLAC4 of LAC4bitAdd is 
	
	-- Defining the component of the 4-bit LAC to be used with this entity.
	component four_bit_LAC is
	port ( 
		   InA : in std_logic_vector(3 downto 0);
           InB : in std_logic_vector(3 downto 0);
           C_In : in std_logic;
           C_terms : out std_logic_vector(3 downto 0)
           );
           
	end component;	
	-- End of the component for the 4-bit LAC.

	-- Defining the component of the n-bit adder to be used with this entity. 
	component n_bit_adder is
	generic (width: positive := 4);	
	port (						
			In_A : in std_logic_vector(width-1 downto 0);	 
			In_B : in std_logic_vector(width-1 downto 0);	
			c_terms : in std_logic_vector(width-1 downto 0);	
			sum : out std_logic_vector(width-1 downto 0);	
			c_out : out std_logic				
			);									

	end component;	-- End of component for the n-bit adder.

	-- Defining an immediate/intermediate signal to be connect the 4-bit LAC and 
	-- the 4-bit adder. 
	signal c_terms : std_logic_vector (3 downto 0);

begin
		
	instanceLAC: four_bit_LAC port map (InA=>InA, InB=>InB, C_In=>C_in, C_terms=>c_terms);	
	instanceAdder: n_bit_adder port map (In_A=>InA, In_B=>InB, c_terms=>c_terms, sum=>Sum, c_out=>C_out);
	
end archLAC4;	-- End of architecture.
		
