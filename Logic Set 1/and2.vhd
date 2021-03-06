--------------------------------------------------------------------------------
-- Engineer: Tobi Adebari
--------------------------------------------------------------------------------
-- Saying what librarys are being used
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--Creating the entity 
entity and2 is
    Port ( a : in std_logic;       --Creating the ports
           b : in std_logic;
           f : out std_logic);
end and2;

--Defing the architechture for the entity created
architecture and2_arch of and2 is

begin

--How the gate works
f <= a and b after 7 ns;    --start the gate after a 7ns delay

end and2_arch;