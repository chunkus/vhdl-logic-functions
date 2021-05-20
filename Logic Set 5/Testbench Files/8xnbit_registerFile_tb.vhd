library IEEE;	-- Including the libraries to be used.
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Entity for this test bench.
entity eight_nbit_register_tb is
end eight_nbit_register_tb;	-- End of test bench.

-- Architecture for this test bench.
architecture behavior of eight_nbit_register_tb is 

-- Including the component of the 8 x n-bit Register File to be used as the 
-- unit under test.
component eight_nbit_register is 
Port ( 
		  Data_in : in std_logic_vector(7 downto 0);
          Read_Address_A : in std_logic_vector(2 downto 0);
          Read_Address_B : in std_logic_vector(2 downto 0);
          Write_Address : in std_logic_vector(2 downto 0);
          REA : in std_logic;
          REB : in std_logic;
          WE : in std_logic;
          Clock : in std_logic;
          OutA : out std_logic_vector(7 downto 0);
          OutB : out std_logic_vector(7 downto 0)
    );

end component; -- End of the component.

-- Input signals to test functionality of device.
signal Data_in : std_logic_vector(7 downto 0) := "00000000";
signal Read_Address_A : std_logic_vector(2 downto 0) := "000";
signal Read_Address_B : std_logic_vector(2 downto 0) := "000";
signal Write_Address : std_logic_vector(2 downto 0) := "000";
signal REA : std_logic := '0'; 
signal REB : std_logic := '0';
signal WE : std_logic := '0';
signal Clock : std_logic := '0';

-- Output signals to test functionality of device.
signal OutA : std_logic_vector(7 downto 0) := "00000000";
signal OutB : std_logic_vector(7 downto 0) := "00000000";

begin 

-- Instantiating the Unit Under Test (UUT) 
uut:  eight_nbit_register port map (
Data_in=>Data_in,
Read_Address_A=>Read_Address_A,
Read_Address_B=>Read_Address_B,
Write_Address=>Write_Address,
REA=>REA,
REB=>REB,
WE=>WE, 
Clock=>Clock,
OutA=>OutA, 
OutB=>OutB);

-- Assigning the clock a period of 50 nano seconds.
Clock <= not Clock after 25 ns; 

-- Beginning test bench process to verify functionality of the device.
test_bench : process
begin

-- Following are the truth table for the 3-to-8 decoder and for the components which are internal to 
-- a register file, in our case used as 8 bits.

-- 3-to-8 decoder truth table.

--	  Inputs	 :						Outputs
-- A2	A1	 A0  :	D7	 D6	  D5   D4   D3   D2   D1  D0
-----------------:----------------------------------------
-- 0	0	 0	 :	0	 0    0    0    0    0    0   1
-- 0	0	 1	 :	0	 0    0    0    0    0    1   0
-- 0	1	 0	 :	0	 0    0    0    0    1    0   0
-- 0	1	 1	 :	0	 0    0    0    1    0    0   0
-- 1	0	 0	 :	0	 0    0    1    0    0    0   0
-- 1	0	 1	 :	0    0    1    0    0    0    0   0
-- 1	1	 0	 :	0    1    0    0    0    0    0   0
-- 1	1	 1	 :	1    0    0    0    0    0    0   0 

-- D-flip-flop truth table.
-- NOTE: 
-- 'UP' indicates rising edge of clock signal.
-- 'LQ' indicates 'Last Q'.
-- 'LQB' indicates 'Las Q_bar'.
-- 'x' indicate Don't Care Case.

-- 	CLK	 D  Preset  Reset  :  Q  Q_bar
---------------------------:------------
--   UP	 0	  0		  0    :  0    1
--   UP	 1	  0		  0    :  1    0
--   0	 x	  0		  0    :  LQ   LQB
--   1	 x	  0		  0    :  LQ   LQB
--   x	 x	  1		  0    :  1    0
--   x	 x	  x		  1    :  0    1

-- Truth table for a tristate buffer:
-- 'x' indicate Don't Care Case.

--  enable input :  output
-----------------:------------
--		0	 X   :	Hi-Z    
--		0	 X   :	Hi-Z    
--		1	 0   :	 0    
--		1	 1   :	 1   

-- Truth table for a 2-to-1 MUX
-- NOTE:
-- A and B are the two inputs of the Multiplexer.

-- SELECT	:	Output
------------:-----------
-- 	 0		:	  A
-- 	 1		:	  B

	wait for 50 ns;
	WE<='1';	-- WE is 1 so we can read an input.
	Write_Address<="001";	-- Storing the input value in address 1.
	Data_in<="01100110";	-- Input to be read and stored.
	
	wait for 100 ns;
	WE<='0';	-- WE is 0 so we aren't reading the input anymore.
	REA<='1';	-- REA is 1 so we are going to print on OutA the value previously stored.
	Read_Address_A<="001";	-- The value previously stored in address 1 will be outputted on OutA 
							-- since we are selecting to read it with the Read_Address_A address pin.
	wait for 300 ns;
	REA<='0';	-- REA is 0 so output OutA will be Z (high impedance).
	WE<='1';	-- WE is 1 so we can read an input.
	Write_Address<="110";	-- Storing the input value in address 6.
	Data_in<="00110011";	-- Input to be read and stored.
	
	wait for 100 ns;
	WE<='0';	-- WE is 0 so we aren't reading the input anymore.
	REB<='1';	-- REB is 1 so we are going to print on OutB the value previously stored.
	Read_Address_B<="110";	-- The value previously stored in address 6 will be outputted on OutB 
							-- since we are selecting to read it with the Read_Address_B address pin.
	
	wait;	-- End of test. Waiting forever.
	
end process;	-- End of the process.

end;	-- End of the test bench code.
