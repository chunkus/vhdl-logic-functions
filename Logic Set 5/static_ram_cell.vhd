-- Saying what librarys are being used
LIBRARY ieee;   
USE ieee.std_logic_1164.all;

ENTITY staticramcell is 
port(
        data_in : in std_logic;
        cell_select : in std_logic;
        write_enable : in std_logic;
        data_out : out std_logic
    );
END staticramcell;

ARCHITECTURE Behaviour OF staticramcell IS

-- Defining the entity of the D-flip-flop.
COMPONENT dflipflop is
port(
		-- Defining the ports of the entity.
		D : in std_logic;	-- D, reset, preset and CLK are the input ports.
		reset : in std_logic;	-- Q and Q_bar are the output ports.
		preset : in std_logic;
		CLK : in std_logic;
		Q : out std_logic;
		Q_bar : out std_logic
);
END COMPONENT;

--Creating the entity 
COMPONENT and2 is
    Port ( a : in std_logic;       --Creating the ports
           b : in std_logic;
           f : out std_logic);
end COMPONENT;

-- ENTITY
COMPONENT tri_buff is
    Port ( Input : in std_logic;
           enable : in std_logic;
           Output : out std_logic);
END COMPONENT;

signal dummy,QtoTri,andToclk: std_logic;
BEGIN


flipflopmap: dflipflop port map(data_in,dummy,dummy,andToclk,QtoTri,dummy);
andmap: and2 port map(cell_select,write_enable,andToclk);
tribuffmap: tri_buff port map(QtoTri,cell_select,data_out);

END Behaviour;
