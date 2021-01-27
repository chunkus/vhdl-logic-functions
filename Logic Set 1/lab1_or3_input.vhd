-- Company: Queen Mary University
-- Engineer: Youssef Akil
-- Date created: January 22nd, 2018
-- Module Name: lab1_or3_input - or3_input_arch
-- Project name: Lab 1 DSD

-- Design goal: 
-- being able to design a fully functional three input OR gate.

library IEEE;
use IEEE.std_logic_1164.all;	-- Including the standard library IEEE.

entity lab1_or3_input is		-- Declaring entity of our module.
	port(	
			A: in std_logic;	-- A,B and C are the three inputs of the OR gate. 
			B: in std_logic;
			C: in std_logic;
			F: out std_logic);	-- F is the output of the OR gate.
end lab1_or3_input;			-- End of entity.

architecture or3_input_arch of lab1_or3_input is
begin							-- Declaring architecture of our module.
	
	F <= A or B or C after 10 ns;	-- Stating the operation of the OR gate to be done on the
								-- inputs A and B after 10 nano seconds.
end or3_input_arch;			-- End of architecture.
