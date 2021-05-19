library IEEE;
use ieee.std_logic_1164.all;	-- Including standard IEEE library.

entity n_bit_adder is			-- Defining the entity to use.
generic (width: positive := 4); -- Generic is used to associate a number to a variable (4 as default)
port (							-- so to easily modify it rather than going through the code.
		In_A : in std_logic_vector(width-1 downto 0);	-- Defining the input and output 
		In_B : in std_logic_vector(width-1 downto 0);	-- ports of the n-bit adder.
		c_terms : in std_logic_vector(width-1 downto 0);	-- In_A, In_B, c_terms and sum
		sum : out std_logic_vector(width-1 downto 0);	-- have a vector type of signal
		c_out : out std_logic				-- since we are dealing with more than 1 bit
		);									-- of information assigned to the signals.

end n_bit_adder;	-- End of entity definition.

-- Defining architecture to be used.
architecture nbit_adder_arch of n_bit_adder is	
	component fulladder		-- In the architecture of the entity previously defined, we 
		port (				-- are using the full adder vhdl code as a component to
				A : in STD_LOGIC ;  	-- use in this n-bit adder source code.
				B : in STD_LOGIC;		
				cin : in STD_LOGIC;   
				s : out STD_LOGIC;
				carry : out STD_LOGIC
			);
	
	end component; 
	-- Defining an intermediate to be used.
	signal dummy_sig : std_logic_vector (width-2 downto 0); 
	
begin
fulladder_for_gen:		-- Defining a FOR generate statement used to create the 
for i in width-1 downto 0 generate	-- instances of the n-bit adder.
	
	checkingLastBit: if i=width-1 generate -- Checking if 'i' is at the last fulladder.
										   -- If yes create the instances for it.
		instance1: fulladder port map (A=>In_A(i), B=>In_B(i), cin=>c_terms(i), s=>sum(i), carry=>c_out);
		end generate checkingLastBit;
	
	checkingOtherBits: if i/=width-1 generate -- Checking if 'i' is at the other fulladders.
											  -- If yes create their instances.
		instance2: fulladder port map (A=>In_A(i), B=>In_B(i), cin=>c_terms(i), s=>sum(i), carry=>dummy_sig(i));
		end generate checkingOtherBits;		
	
end generate fulladder_for_gen; -- End of for generate statement.

-- End of n-bit adder architecture.
end nbit_adder_arch;				
	
					
