-- Saying what librarys are being used
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--Creating the entity 
entity not1 is
    Port ( a : in std_logic;      --Creating the ports
           f : out std_logic);
end not1;

--Defing the architechture for the entity created
architecture not1_arch of not1 is

begin

--How the gate works
f <= not(a) after 7 ns;     --start the gate after a 7ns delay

end not1_arch;
