-- Company : Queen Mary University 
-- Engineer : Aditya Ajaykumar
-- Date : 23 January 2019
-- Module : lab1_fulladder
--project : Lab1_DSD

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;    --Including the standard library IEEE. 

entity fulladder is  --Declaration of entity
	port(
	    	A : in STD_LOGIC ;  
			B : in STD_LOGIC;
			cin : in STD_LOGIC;   --Declaration of inputs
			s : out STD_LOGIC;
			carry : out STD_LOGIC);  --Declaration of outputs
end fulladder;    --End of entity

architecture fulladder_arch of fulladder is

begin    --Declaration of architecture

	S <= (A XOR B) XOR cin;   --Calculation of sum
	carry <= ((A XOR B) AND cin) OR (A AND B);   --Calculation of carry


end fulladder_arch;   --End of architecture	