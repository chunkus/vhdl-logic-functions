library IEEE;	-- Defining the library to be used.
use IEEE.STD_LOGIC_1164.ALL;

-- Declaration of the entity four a 4-bit Adder/Subtractor.
entity four_bit_addSUB is
port (
        InA : in std_logic_vector(3 downto 0);	-- InA, InB and Control are the input 
        InB : in std_logic_vector(3 downto 0);	-- signals, as for Sum and C_out they are
        Control : in std_logic;					-- the output signals.
        Sum : out std_logic_vector(3 downto 0);
        C_out : out std_logic
);		
end four_bit_addSUB;	-- End of the entity.

-- Defining the architecture of the entity four_bit_addSUB for a 4-bit adder/subtractor.
architecture four_ADDSUB_arch of four_bit_addSUB is 

-- Defining first component to use: n-bit xor control.
component  nbit_xor_contol is
Generic ( n : positive := 4 );
Port ( 
        Input : in std_logic_vector(n-1 downto 0);
        control : in std_logic;
        Output : out std_logic_vector(n-1 downto 0)
        );

end component;	-- End of first component.

-- Defining second component to use: 4-bit LAC adder.
component  LAC4bitAdd is
port (
        InA : in std_logic_vector (3 downto 0);
        InB : in std_logic_vector (3 downto 0);
		C_in : in std_logic;							
		Sum : out std_logic_vector (3 downto 0);		
		C_out : out std_logic
		);

end component;	-- End of second component.

-- Defining an intermediate/immediate signal to use between the xor control and 4-bit LAC
-- adder.
signal in_Between : std_logic_vector (3 downto 0);

begin
	
	-- Mapping the entity signals with the two components signals.
	instanceXOR: nbit_xor_contol port map (Input => InB, control => Control, Output => in_Between);	
	instanceLAC: LAC4bitAdd port map (InA => InA, InB => in_Between, C_in => Control, Sum => Sum, C_out => C_out);
	
end four_ADDSUB_arch;	-- End of the architecture.
