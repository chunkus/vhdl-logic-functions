-- Engineer: Daniyal Naeem

-- Source code for an 8 x n-bit Register File.

library IEEE;	-- Including the libraries to be used.
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Entity of the device.
entity eight_nbit_register is 
generic (n : positive := 8);	-- generic value to be easily modified if necessary.
Port ( 
		-- Data_in, Read_Address_A, Read_Address_B, Write_Address, REA, REB, WE, Clock are the input ports of the device..
		-- OutA, OutB are the output ports of the device.
		  Data_in : in std_logic_vector(n-1 downto 0);
          Read_Address_A : in std_logic_vector(2 downto 0);
          Read_Address_B : in std_logic_vector(2 downto 0);
          Write_Address : in std_logic_vector(2 downto 0);
          REA : in std_logic;
          REB : in std_logic;
          WE : in std_logic;
          Clock : in std_logic;
          OutA : out std_logic_vector(n-1 downto 0);
          OutB : out std_logic_vector(n-1 downto 0)
    );
-- End of entity.
end eight_nbit_register; 

-- Architecture of the device.
architecture behavioral of eight_nbit_register is

-- Including components to be used to have a functional device.

-- Component for an n-bit register file.
component n_bit_RFC
Port ( 
		  Data_in : in std_logic_vector(7 downto 0);
          REA : in std_logic;
          REB : in std_logic;
          WE : in std_logic;
          CLK : in std_logic;
          OutA : out std_logic_vector(7 downto 0);
          OutB : out std_logic_vector(7 downto 0)
    );
-- End first component.
end component; 

-- Component for a 3-to-8 decoder.
component three_to_eight_decoder
Port ( 
		  OE : in std_logic;
          address : in std_logic_vector(2 downto 0); 
          O_outputs : out std_logic_vector(7 downto 0)
     );
-- End second component.
end component; 

-- Intermediate signals to be used in the device. 
signal dec_out_A, dec_out_B, dec_out_C : std_logic_vector(n-1 downto 0);

begin 

-- Using a for generate statement to port map all 8 n-bit register files with the entity.
    for_generate :  for i in n-1 downto 0 generate
		-- Port mapping entity with the n-bit register file.
        instance : n_bit_RFC port map (Data_in=>Data_in, REA=>dec_out_A(i), REB=>dec_out_B(i), WE=>dec_out_C(i), CLK=>Clock, OutA=>OutA, OutB=>OutB);

	end generate;	-- End of the for generate.

-- Port mapping the three individuals 3-to-8 decoders with the entity.
firstDecoder : three_to_eight_decoder port map (OE=>REA, address=>Read_Address_A, O_outputs=>dec_out_A);
secondDecoder : three_to_eight_decoder port map (OE=>REB, address=>Read_Address_B, O_outputs=>dec_out_B);
thirdDecoder : three_to_eight_decoder port map (OE=>WE, address=>Write_Address, O_outputs=>dec_out_C);

end behavioral;	-- End of the architecture.