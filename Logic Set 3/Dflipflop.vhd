-- Engineer: Luca Santarelli
-- The following code is the source code for a D-flip-flop with an asynchronous reset 
-- and preset.

library ieee;		-- Defining the library to be used.
use ieee.std_logic_1164.all;

-- Defining the entity of the D-flip-flop.
entity dflipflop is
port(
		-- Defining the ports of the entity.
		D : in std_logic;	-- D, reset, preset and CLK are the input ports.
		reset : in std_logic;	-- Q and Q_bar are the output ports.
		preset : in std_logic;
		CLK : in std_logic;
		Q : out std_logic;
		Q_bar : out std_logic
);

end dflipflop;	-- End of entity dflipflop.

-- Defining the architecture of the entity dflipflop
architecture arch_dflipflop of dflipflop is
begin 
	-- Defining a process to execute set of statements whenever the signals CLK, reset or
	-- preset change in value. 
	clk_pro1 : process (CLK, reset, preset)	
	begin 
		-- Entered the process
		if (reset = '1') then	-- Checking if the reset is 1. If yes then Q=0, Q_bar=1.
		Q <= '0';
		Q_bar <= '1';
		elsif (preset = '1') then	-- Checking if the preset is 1. If yes then Q=1, Q_bar=0.
		Q <= '1';
		Q_bar <= '0';
		elsif (CLK'event and CLK = '1') then	-- Checking if there's a rising clock
		Q <= D;								-- edge. If yes then Q=D and Q_bar=not D.
		Q_bar <= not D;
		end if;	-- End of if statemente inside the process.
		
	end process;	-- End of the process itself.

end arch_dflipflop;	-- End of the entity's architecture.