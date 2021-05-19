library ieee;	-- Import std_logic from the IEEE library
use IEEE.STD_LOGIC_1164.ALL;

entity mux_2to1_tb is	-- Declaring entity to be used.
end mux_2to1_tb;

-- Defining architecture to be used with the previously stated entity.
architecture test_2to1mux of mux_2to1_tb is

   -- Component Declaration for the Unit Under Test (UUT).
   component mux_2to1 is
      port( 
      		SEL : in STD_LOGIC; 
			A : in STD_LOGIC;
			B : in STD_LOGIC;      
			Y : out STD_LOGIC);    
   
   end component;

   -- Input signals.
   signal SEL : std_logic;
   signal A	: std_logic;
   signal B	: std_logic;   
   -- Output signal.
   signal Y	: std_logic;

begin
   -- Instantiating the Unit Under Test (UUT).
   mapping: mux_2to1 port map(SEL, A, B, Y);

 
   process
   begin
      
      SEL <= '1';		-- Assigning a 1 to the selector of the MUX.
      wait for 10 ns;	-- Wait for 10 nano seconds.
      
      SEL <= '0'; 		-- Assigning a 0 to the selector of the MUX.
      wait for 10 ns;	-- Wait for 10 nano seconds.
   end process;

   process
   begin 
   
   -- Testing to see whether the correct input is selected to be connected 
   -- to the output port.
   
   -- TEST 1
      A <= '0';
      B <= '1';
      wait for 10 ns;
      if(SEL = '0') then 
         assert(Y = '0') report "Error 2" severity error;
      else 
         assert(Y = '1') report "Error 2" severity error;
      end if;

   -- TEST 2
      A <= '1';
      B <= '0';
      wait for 10 ns;
      if(SEL = '0') then 
         assert(Y = '1') report "Error 2" severity error;
      else 
         assert(Y = '0') report "Error 2" severity error;
      end if;
      --------------------------------------------------
   end process;
end;
