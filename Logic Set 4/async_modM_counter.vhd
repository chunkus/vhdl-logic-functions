-- Company : Queen Mary University 
-- Engineer : Aditya Ajaykumar
-- Date : 26 February 2019
-- Module : lab4_counterasyncreset
-- project : Lab4_DSD_countersayncreset

-- Source code for an 8-bit modulo-m counter with asynchronous reset.

 library IEEE;  -- Including libraries.
 use IEEE.STD_LOGIC_1164.ALL;  
 
-- Entity declaration of the device. 
 entity asyncModMCount is  
       generic (n: positive:= 8);  
   Port ( 
   		-- input, countEnable, CLK and reset are the input ports.
   		-- Q_Out is the output port.
   		input : in STD_LOGIC_VECTOR (n-1 downto 0);  
       countEnable : in STD_LOGIC;  
       CLK : in STD_LOGIC;  
       reset : in STD_LOGIC;  
       Q_Out : out STD_LOGIC_VECTOR (n-1 downto 0));  
 
 end asyncModMCount;  -- End of entity.
 
-- Specifying the architecture of the device. 
 architecture Behavioral of asyncModMCount is  
 
 -- COMPONENT: 8-bit comparator  
 component eightbit_comparator is  
       Port ( 
       InA : in STD_LOGIC_VECTOR (7 downto 0);  
       InB : in STD_LOGIC_VECTOR (7 downto 0);  
       Output : out STD_LOGIC);  
 
 end component;  
 --END COMPONENT 
 
 --COMPONENT: nbitSyncCountEnable  
 component nbit_count_enable is  
   Port ( 
   		enable : in std_logic;  
       CLK : in std_logic;  
       reset : in std_logic;  
       Q_outputs : inout std_logic_vector(7 downto 0)  
                 );  
 end component;  
 --END COMPONENT  
 
 --COMPONENT: or gate  
 component myor is  
      Port ( 
      		A : in std_logic;  
            B : in std_logic;  
       		F : out std_logic);  
 
 end component;  
 --END COMPONENT  
 
 -- Intermediate signals to be used in the device. 
 signal counterToComparator: std_logic_vector(n-1 downto 0);  
 signal compToOr, orToCounter: std_logic;  
 
 begin  
 	  -- Port mapping the entity of our device with the previously declared components.
      newComparator: eightbit_comparator port map (InA=>counterToComparator, InB=>input, Output=>compToOr);  
      newOr: myor port map(A=>compToOr, B=>reset, F=>orToCounter);  
      newCounter: nbit_count_enable port map (enable=>countEnable, CLK=>CLK, reset=>orToCounter, Q_outputs=>counterToComparator);  
      Q_Out <= counterToComparator;  
 
 end Behavioral;  -- End of the architecture.