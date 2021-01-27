-- Engineer: Luca Santarelli
-- The following vhdl code is the test bench code for the n-bitAdder.vhd source code.

library IEEE;
use ieee.std_logic_1164.all;	-- Including standard IEEE library.

entity nbit_adder_tb is		-- Defining entity.
end nbit_adder_tb;			-- End of entity.

architecture adderN of nbit_adder_tb is -- Defining the architecture of the n-bit adder.
component n_bit_adder is			-- Using as a component 'n_bit_adder' which is the 		
port (								-- entity used in the n-bitAdder.vhd source code.
		In_A : in std_logic_vector(3 downto 0);	
		In_B : in std_logic_vector(3 downto 0);	
		c_terms : in std_logic_vector(3 downto 0);
		sum : out std_logic_vector(3 downto 0);
		c_out : out std_logic
		);

end component;			-- End of component.

-- Input signals to be used.
signal In_A, In_B, c_terms : std_logic_vector (3 downto 0) := "0000";

-- Output signals to verify.
signal sum : std_logic_vector (3 downto 0);
signal c_out : std_logic;

begin		
	-- Mapping the Input and Output signals, previously defined, with those of the entity.
	-- Instantiating the Unit Under Test (UUT).
		UUT : n_bit_adder port map (In_A=>In_A, In_B=>In_B, c_terms=>c_terms, sum=>sum, c_out=>c_out);

-- Process of the Unit Under Test (UUT).
test_bench : process
	begin		-- Beginning of the process of the UUT to verify functionality of the
				-- n-bit adder.
	
		wait for 100 ns;  -- Waiting 100 nano seconds before testing first set of values.
		In_A <= "1000"; 
		In_B <= "0001";	  -- Verifying 4-bit adder with the following inputs.
		c_terms <= "0000";
	
		wait for 100 ns;  -- Waiting 100 nano seconds before testing second set of values.
		In_A <= "0010"; 
		In_B <= "0001";	  -- Verifying 4-bit adder with the following inputs.
		c_terms <= "0000";
	
		wait for 100 ns;  -- Waiting 100 nano seconds before testing third set of values.
		In_A <= "0011"; 
		In_B <= "0011";	  -- Verifying 4-bit adder with the following inputs.
		c_terms <= "0000";
		
		wait for 100 ns;  -- Waiting 100 nano seconds before testing fourth set of values.
		In_A <= "0101"; 
		In_B <= "0110";	  -- Verifying 4-bit adder with the following inputs.
		c_terms <= "0110";
		
		wait;			  -- End of test. Waiting forever.

	end process;	-- End of process.

end;	-- End of test bench code.