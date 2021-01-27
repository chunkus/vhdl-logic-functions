-- Engineer: Luca Santarelli
-- The following code is the source code related to an n-bit shifter/rotator which in this
-- case has a default size of 4, as stated by the lab 2 sheet.

library IEEE;  		-- Defining the library to use.
use IEEE.STD_LOGIC_1164.ALL;
 
-- Defining entity of the n-bit shifter/rotator to use.
entity n_bit_shiftRot is  
generic(width: positive := 4);  -- Defining a generic variable to easily modify its value
Port (						-- throughout the source code.
       	-- Defining the input and output signals to be used in this entity.
       	Data_In1 : in std_logic_vector(width-1 downto 0);  
        Data_In2 : in std_logic_vector(width-1 downto 0);  
        Right_in : in std_logic;  
        Right_Select : in std_logic;  
        Left_in : in std_logic;  
        Left_Select : in std_logic;  
        Control : in std_logic_vector (1 downto 0);  
        Output : out std_logic_vector (width-1 downto 0)
        );  
end n_bit_shiftRot; 	-- End of entity.

-- Defining the architecture of the n-bit shifter/rotator.
architecture nbit_shiftRot_arch of n_bit_shiftRot is  

-- Defining the component of the 2-to-1 input multiplexer (used in lab 1).
component mux_2to1 is      
port (
		SEL : in STD_LOGIC ; 
		A : in STD_LOGIC;
		B : in STD_LOGIC;      
		Y : out STD_LOGIC);    

end component;	-- End 2-to-1 MUX component.
  
-- Defining the component of the 4-input multiplexer to be used.
component mux_4to1 is   		
port(
	A, B, C, D : in std_logic;      
	CA,CB : in std_logic;      
	Y	   : out std_logic );    

end component;	-- End 4-input MUX component.

-- Defining intermediate/immediate signals to be used between the multiplexers.
signal second2mux_to_4mux, mux2_to_4muxZero: std_logic;
begin  
	
	inst: 
	for i in width-1 downto 0 generate	
    	first_if: 	-- Checking if we are in loop(n-1) so to create
    	if i = width-1 generate  -- instances for 2 mux connected to 4-input mux(n-1).
    	-- Mapping 2-to-1 mux of loop(n-1).
        two_in_Mux: mux_2to1 port map (A => Data_In1(0),B => Left_in, SEL => Left_Select, Y => second2mux_to_4mux);  
        -- Mapping 4-input mux of loop(n-1).
        fourMuxTwo: mux_4to1 port map (A => Data_In1(i), B => Data_In1(i-1), C => second2mux_to_4mux, D => Data_In2(i), CA => Control(1), CB => Control(0), Y => Output(i));  
        end generate;  -- End first If.
                    
        second_if: -- Checking if we are in loop(0) so to create
        if i = 0 generate  	-- instances for 2 mux connected to 4-input mux(0).
		-- Mapping 2-to-1 mux of loop(0).      
        twoMuxZero: mux_2to1 port map (A => Data_In1(width-1), B => Right_in, SEL => Right_Select, Y => mux2_to_4muxZero);  
        -- Mapping 4-input mux of loop(0).
        fourMuxZero: mux_4to1 port map (A => Data_In1(0), B => mux2_to_4muxZero, C => Data_In1(1), D => Data_In2(0), CA => Control(1), CB => Control(0), Y => Output(0));  
        end generate;  	-- End second If.
                         
        third_if: -- Checking if we are in loop(i) so to create
        if ((i/=0) and (i/=width-1)) generate  -- instances for the remaining 4-input mux(i)s.
        -- Mapping of the remaining 4-input mux(i)s of loop(i).
        fourMuxMid: mux_4to1 port map (A => Data_In1(i), B => Data_In1(i-1), C => Data_In1(i+1), D => Data_In2(i), CA => Control(1), CB => Control(0), Y => Output(i));  
        end generate;  	-- End third If.
    
    end generate;  	-- End of for generate statement
 
 end nbit_shiftRot_arch;  -- End of architecture.