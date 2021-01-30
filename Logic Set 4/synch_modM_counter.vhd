-- Company : Queen Mary University 
-- Engineer : Aditya Ajaykumar
-- Date : 26 February 2019
-- Module : lab4_countersyncreset
-- project : Lab4_DSD_countersyncreset

-- Source code for an 8-bit modulo-m counter with synchronous reset.

 library IEEE;  
 use IEEE.STD_LOGIC_1164.ALL;  --including the IEEE library

 entity countersyncreset is  -- Declaring entity of device.
      Generic (n: positive:= 8);  
   Port ( 
   		-- input, count_enable, CLK and reset are the input ports.
   		-- Q_Out is the output port.
   		input : in STD_LOGIC_VECTOR (n-1 downto 0);  
       count_enable : in STD_LOGIC;  
       CLK : in STD_LOGIC;  
       reset : in STD_LOGIC;  
       Q_Out : out STD_LOGIC_VECTOR(n-1 downto 0));  
 
 end countersyncreset;  -- End entity.

--ARCHITECTURE DESIGN
 architecture Behavioral of countersyncreset is  

 --COMPONENT: 8-bit comparator  
component eightbit_comparator is  
   generic(n:positive:=8);  
       Port ( 
       			InA : in STD_LOGIC_VECTOR (n-1 downto 0);  
      		 	InB : in STD_LOGIC_VECTOR (n-1 downto 0);  
       			Output : out STD_LOGIC);  

 end component;  
 --END COMPONENT: 8-bit comparator  

 --COMPONENT: nBitSyncCountParallel  
 component nbitsynchronouscounterwithparallelload is 
    generic(n:positive:=8); 
   Port ( 
   		D_inputs : in STD_LOGIC_VECTOR (n-1 downto 0);  
       loadcount : in STD_LOGIC;  
       countenable : in STD_LOGIC;  
       clk: in STD_LOGIC;  
       reset : in STD_LOGIC;  
       qoutputs : inout STD_LOGIC_VECTOR (n-1 downto 0)  
                 ); 
                  
 end component;  -- End of component.
  
-- Declaration of intermediate signals to be used.
 signal counterToComparator: std_logic_vector(n-1 downto 0);  
 signal comparatorToCounter: std_logic;  
 
 begin  
 -- Port mapping the components declared with the entity's ports.
      newComparator: eightbit_comparator port map (InA=>counterToComparator, InB=>input, Output=>comparatorToCounter);  
      newCounter: nbitsynchronouscounterwithparallelload port map (D_inputs=>"00000000", loadcount=>comparatorToCounter, countenable=>count_enable, clk=>CLK, reset=>reset, qoutputs=>counterToComparator);  
      Q_Out <= counterToComparator;  
 
 end Behavioral;  -- End of architecture.
