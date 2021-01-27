-- Engineer: Youssef Akil
-- The following code represents the source code of the 1-bit logic function bit-slice.

library IEEE;  	-- Defining the library to be used.
use ieee.std_logic_1164.all;  
 
 --Defining the 1 bit function bit slicer entity.
 entity onebitlogicslice is  
   Port ( 
   			-- Defining ports of the bit-slice.
   			a : in STD_LOGIC;  	-- Signal a,b are the input ports.
       		b : in STD_LOGIC;  
       		cntrl: in STD_LOGIC_VECTOR (1 downto 0); --Control of the bit slicer 
       		output : out STD_LOGIC
       	);  
       	
 end onebitlogicslice;	-- End of bit-slice entity. 
 
 -- Defining the architecture of the bit-slice (how it functions).
 architecture onebitslice_arch of onebitlogicslice is  
 
 -- Defining first component to be used in the bit-slice (the NOT gate component).
 component not1   
   Port ( 
   			a : in STD_LOGIC;  
       		f : out STD_LOGIC
       	);  
       	
 end component;  -- End NOT gate component.
 
 -- Defining second component to be used in the bit-slice (the AND gate component).
 component and2  
   Port ( 
 			a : in STD_LOGIC;  
       		b : in STD_LOGIC;  
       		f : out STD_LOGIC
       	);  
 
 end component;  -- End AND gate component.
 
 -- Defining third component to be used in the bit-slice (the OR gate component).
 component myor  
 Port ( 
 			A : in STD_LOGIC;  
       		B : in STD_LOGIC;  
       		F : out STD_LOGIC
       	);  
       	
 end component;	 -- End OR gate component.
 
 -- Defining fourth component to be used in the bit-slice (the XOR gate component).
 component myxor  
 Port ( 
 			A : in STD_LOGIC;  
       		B : in STD_LOGIC;  
       		F : out STD_LOGIC
       	);  
       	
 end component;	 -- End XOR gate component.

 -- Defining fifth component to be used in the bit-slice (the 4-to-1 MUX component).
 component mux_4to1   
   Port ( 
   			A, B, C, D : in std_logic;
       		CA,CB : in std_logic;
       		Y : out std_logic
       	);  
       	
 end component;	-- End 4-to-1 MUX component.  
 
 -- Defining intermediate signals to be used in the bit-slice.
 signal NOTgatetomux, andtomux, xortomux, ortomux : std_logic;  
 
 begin  
 -- Defining the instances of the bit-slice, so to have it function properly.
 A1: not1 port map (a=>a, f=>NOTgatetomux);  
 B1: and2 port map (a=>a, b=>b, f=>andtomux);  
 C1: myxor port map(A=>a, B=>b, F=>xortomux);  
 D1: myor port map(A=>a, B=>b, F=>ortomux);  
 E1: mux_4to1 port map (A=>NOTgatetomux, B=>andtomux, C=>xortomux, D=>ortomux, CA=>cntrl(1), CB=>cntrl(0), Y=>output);  
 
end onebitslice_arch;	-- End of bit-slice architecture.