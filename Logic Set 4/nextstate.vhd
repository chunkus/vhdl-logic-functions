 library IEEE;  
 use IEEE.STD_LOGIC_1164.ALL;  
 use IEEE.STD_LOGIC_ARITH.ALL;  
 use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
entity nextstate is  
generic (width : positive := 4);	-- Defining a generic default value of 4 to be later modified if necessary.
   Port ( 
          Input : in std_logic_vector(width-1 downto 0);  
          Output : out std_logic_vector(width-1 downto 0)
        );  
end nextstate;

architecture behaviour of nextstate is
begin
 Output(0) <= not input(0);  
 Output(1) <= input(1) xor input(0);  
 Output(2) <= input(2) xor (input(0) and input(1));  
 Output(3) <= input(3) xor (input(0) and input(1) and input(2));
 
end;
