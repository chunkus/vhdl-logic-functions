library IEEE;	-- Declaring libraries to be used.
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


-- Defining the entity of the n-bit tri state buffer.
entity nbit_tri_buff is
 -- Generic value declared, so to change whenever needed (default value of 4).
generic (n : positive := 4 );
Port ( 
	   Data_in: in std_logic_vector(n-1 downto 0); -- Data_in and enable are the input signals.
       enable : in std_logic;
       Output : out std_logic_vector(n-1 downto 0) -- Output is the output signal.
	 );

end nbit_tri_buff;	-- End of the n-bit tri state buffer entity.

-- ARCHITECTURE of the n-bit tri state buffer.
architecture Behavioral of nbit_tri_buff is

-- Defining the component of the tri state buffer necessary in order for the n-bit tri state buffer
-- to be used well.
component tri_buff
Port ( 
		-- Input and output signals of the tri state buffer component.. 
		Input : in std_logic;      
		enable : in std_logic;  
		Output : out std_logic
	);

end component;	-- End of the tri state buffer component. 
    
begin 
	-- Creating the instances of the n-bit tri state buffer using a for generate statement
	inst: for i in n-1 downto 0 generate
		-- Creating the instances by port mapping the tri state buffer in the n-bit tri state buffer.	
		dev_i: tri_buff port map (Input=>Data_in(i), enable=>enable, Output=>Output(i));
	
	end generate;	-- End of the for generate statement.

end Behavioral;	-- End of the architecture of the n-bit tri state buffer.
