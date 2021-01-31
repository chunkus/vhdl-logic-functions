--------------------------------------------------------------------------------
-- Engineer: Tobi Adebari
--------------------------------------------------------------------------------

-- Source code for the n-bit twisted ring counter.

-- Saying what librarys are being used
LIBRARY ieee;   
USE ieee.std_logic_1164.all;

ENTITY mnsram is 
generic (n,m : positive := 4);  -- Generic value used to better change bit width if necessary.

port(
        data_in : in std_logic_vector(n-1 downto 0);
        select_lines : in std_logic_vector(m-1 downto 0);
        write_enable : in std_logic;
        data_out : out std_logic_vector(n-1 downto 0)
    );
END mnsram;

ARCHITECTURE Behaviour OF mnsram IS 

COMPONENT staticramcell IS 
port(
        data_in : in std_logic;
        cell_select : in std_logic;
        write_enable : in std_logic;
        data_out : out std_logic
    );
END COMPONENT;

--SIGNAL 
BEGIN

    inst : for i in m-1 downto 0 generate
        inst2 : for j in n-1 downto 0 generate
            
            srammpa: staticramcell port map(data_in(j), select_lines(i) ,write_enable, data_out(j)); 
            
            END generate;
            END generate;
            
END Behaviour;
        
    
