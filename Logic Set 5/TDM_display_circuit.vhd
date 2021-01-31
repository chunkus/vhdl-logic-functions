-- Engineer: Youssef Akil

-- Source code for a Time Division Multiplex display circuit.

library IEEE;  -- Including library to be used.
use IEEE.STD_LOGIC_1164.ALL;  

-- Entity for the device.
 entity TDM is  
 Generic (n: positive:= 4);  -- generic value to easily change value if necessary.
      Port (
      -- reset, CLK, InA, InB are the input ports.
      -- cathA, cathB, anOut are the output ports.
      		reset: in STD_LOGIC;  
            CLK: in STD_LOGIC;  
            InA: in STD_LOGIC_VECTOR(n-1 downto 0);  
            InB: in STD_LOGIC_VECTOR(n-1 downto 0);  
            cathA: out STD_LOGIC;  
            cathB: out STD_LOGIC;  
            anOut: out STD_LOGIC_VECTOR(6 downto 0));  
 end TDM;  -- end entity.

-- Architecture of the device.
 architecture Behavioral of TDM is  
 
 --COMPONENT: t flip-flop  
 component T_flipflop  
    Port ( 
    		reset : in STD_LOGIC;  
       		Clk : in STD_LOGIC;  
       		Q : inout STD_LOGIC;  
       		Q_bar : inout STD_LOGIC
       	 );  
 end component;  
 --END COMPONENT: t flip flop  
 
 --COMPONENT: nbitTSBuffer  
 component nbit_tri_buff        
 generic ( n : positive := 4);  
 Port ( 
 	   Data_in : in STD_LOGIC_VECTOR (n-1 downto 0);  
       enable : in STD_LOGIC;  
       Output : out STD_LOGIC_VECTOR (n-1 downto 0)
      );  
 end component;  
 --END COMPONENT: nbitTSBuffer  
 
 --COMPONENT: 16-7 decoder ROM  
 component sixteen_7bit_segment_decoder is  
 Port (
 			address: in STD_LOGIC_VECTOR(3 downto 0);  
            data_outputs: out STD_LOGIC_VECTOR(6 downto 0)
       );  
 end component;  
 --END COMPONENT: 16-7 decoder ROM  
 
 -- Intermediate signals to be used in the device.
 signal qout, qBarOut, test: STD_LOGIC;  
 signal ts1Out, ts2Out, toROM,dummy: STD_LOGIC_VECTOR(n-1 downto 0);  
 
 begin  
 	  -- Port mapping the t-flip-flop with the entity.
      newFF: T_flipflop port map(reset, CLK, qout, qBarOut);  
      
      cathA <= qout;  
      test <= qout;  
      cathB <= qBarOut;  
      
      -- Port mapping the two n-bit tri state buffers
      tsOne: nbit_tri_buff port map(InA, qout, ts1Out);  
      tsTwo: nbit_tri_buff port map(InB, qBarOut, ts2Out);  
      
      with test select  
           toROM <= ts1Out when '1',  
                       ts2Out when '0',  
                          dummy when others;  
      
      -- Port mapping the 16x7 decoder ROM.
      newRom: sixteen_7bit_segment_decoder port map(toROM, anOut);  
 
 end Behavioral; -- End of the architecture.