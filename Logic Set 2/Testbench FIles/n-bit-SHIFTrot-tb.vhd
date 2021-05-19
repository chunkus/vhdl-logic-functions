library IEEE;  -- Defining the library to use.
use IEEE.STD_LOGIC_1164.ALL;  

-- Defining the entity of the test bench.
entity n_bit_shiftRot_tb is
end n_bit_shiftRot_tb;	-- End of the test bench architecture.

-- Defining the architecture of the test bench.
architecture tb_shiftRot of n_bit_shiftRot_tb is

-- Defining the component n_bit_shiftRot used as the source code entity.
component n_bit_shiftRot is 
generic(width: positive := 4); 
Port (						
       	
       	Data_In1 : in std_logic_vector(width-1 downto 0);  
        Data_In2 : in std_logic_vector(width-1 downto 0);  
        Right_in : in std_logic;  
        Right_Select : in std_logic;  
        Left_in : in std_logic;  
        Left_Select : in std_logic;  
        Control : in std_logic_vector (1 downto 0);  
        Output : out std_logic_vector (width-1 downto 0)
        );  
end component; 	-- End of entity.

-- Defining input signals.
signal Data_In1 :  std_logic_vector(3 downto 0) := "0000";
signal Data_In2 :  std_logic_vector(3 downto 0) := "0000";
signal Control :  std_logic_vector(1 downto 0) := "00";
signal Right_in :  std_logic := '0';
signal Right_Select :  std_logic := '0';
signal Left_in :  std_logic := '0';
signal Left_Select :  std_logic := '0';

-- Defining output signals.
signal Output :  std_logic_vector(3 downto 0);

begin

-- Instantiating the Unit Under Test (UUT).
uut: n_bit_shiftRot port map (
Data_In1 => Data_In1, 
Data_In2 => Data_In2, 
Control => Control,
Right_in => Right_in,
Right_Select => Right_Select,
Left_in => Left_in,
Left_Select => Left_Select,
Output => Output);

-- Beginning of testing to see if the n-bit shifter/rotator works properly.
test_bench : process
	
	begin
		
		wait for 100 ns;
		Control <= "00";
		Right_in <= '1';
		Right_Select <= '1';
		Left_in <= '1';
		Left_Select <= '1';
		Data_In1 <= "0000";
		Data_In2 <= "0001";
		
		wait for 100 ns;
		Control <= "01";
		Right_in <= '1';
        Right_Select <= '0';
        Left_in <= '1';
        Left_Select <= '0';
		Data_In1 <= "1010";
		Data_In2 <= "0011";
		
		wait for 100 ns;
		Control <= "10";
		Right_in <= '0';
        Right_Select <= '0';
        Left_in <= '1';
        Left_Select <= '1';
		Data_In1 <= "1111";
		Data_In2 <= "0100";
		
		wait for 100 ns;
		Control <= "11";
		Right_in <= '0';
        Right_Select <= '0';
        Left_in <= '0';
        Left_Select <= '0';
		Data_In1 <= "1001";
		Data_In2 <= "0110";
		
		wait; -- End of test. Waiting forever.
		

end process; -- End of process test_bench.

end; -- End of the test bench code to verify its functionality.
		
