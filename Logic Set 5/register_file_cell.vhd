library ieee;	-- Including library to be used.
use ieee.std_logic_1164.all;

-- Entity for the RFC.
entity register_file_cell is
port(
	-- DIN, REA, REB, WE, CLK are the input ports of the RFC.
	-- OA, OB are the output ports of the RFC.
	DIN : in std_logic;
	REA : in std_logic;
	REB : in std_logic;
	WE : in std_logic;
	CLK : in std_logic;
	OA : out std_logic;
	OB : out std_logic
);
-- End of the entity declaration.
end register_file_cell;

-- Defining the architecture of the RFC.
architecture RFC_arch of register_file_cell is
-- Including components necessary to have a functional RFC.

-- Component for the D-flip-flop.
component  dflipflop is
port(
		D : in std_logic;	
		reset : in std_logic;	
		preset : in std_logic;
		CLK : in std_logic;
		Q : out std_logic;
		Q_bar : out std_logic
);
-- End 1st component.
end component;

-- Component for the tri state buffer.
component tri_buff is
    Port ( Input : in std_logic;
           enable : in std_logic;
           Output : out std_logic
           );
-- End 2nd component.
end component;

-- Component for the 2-to-1 multiplexer.
component mux_2to1 is     
port (
		SEL : in STD_LOGIC; 
		A : in STD_LOGIC;
		B : in STD_LOGIC;      
		Y : out STD_LOGIC);    
-- End 3rd component.
end component; 

-- Defining intermediate signals to be used in the RFC.
signal muxToFF, FFoutput, nc: std_logic;

begin
-- Port mapping each component with the entity of the RFC.
dflipflopInstance : dflipflop port map (D=>muxToFF, reset=>'0', preset=>'0', CLK=>CLK, Q=>FFoutput, Q_bar=>nc);
muxInstance : mux_2to1 port map (A=>FFoutput, B=>DIN, SEL=>WE, Y=>muxToFF);
triBuffInstance1 : tri_buff port map (Input=>FFoutput, enable=>REA, Output=>OA);
triBuffInstance2 : tri_buff port map (Input=>FFoutput, enable=>REB, Output=>OB);

end RFC_arch;	-- End of the RFC architecture.
