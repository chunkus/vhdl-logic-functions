--------------------------------------------------------------------------------
-- Engineer: Tobi Adebari
--------------------------------------------------------------------------------

-- The following source code is for the n-bit universal shift register.

library ieee;   -- Defining the library to be used.
use ieee.std_logic_1164.all;

-- Declaring the entity of this device.
entity UnivShiftReg is
    generic(width: positive := 4);  -- Defining a generic variable to easily modify its value throughout the code.

	-- D_inputs, shift_in, shift_rotate, F, CLK, RST, preset are the input ports of the device.
	-- Q_output is used as an inout port to feedback its output value on one of the input ports of the device.
    port (
        D_inputs : in std_logic_vector(width-1 downto 0);
        shift_in : in std_logic;
        shift_rotate : in std_logic;
        F : in std_logic_vector(1 downto 0);
        CLK, RST, preset : in std_logic;
        Q_outputs : inout std_logic_vector(width-1 downto 0));
end UnivShiftReg;	-- End of the device's entity.

-- Defining the architecture of the n-bit universal shift register.
architecture behavior of UnivShiftReg is

	-- Components used to have fully functional n-bit universal shift register are the n-bit shift-rotate register 
	-- and the n-bit register.
    component n_bit_shiftRot is
    Port (                        -- throughout the source code.
               -- Defining the input and output signals to be used in this entity.
            Data_In1 : in std_logic_vector(3 downto 0);  
            Data_In2 : in std_logic_vector(3 downto 0);  
            Right_in : in std_logic;  
            Right_Select : in std_logic;  
            Left_in : in std_logic;  
            Left_Select : in std_logic;  
            Control : in std_logic_vector (1 downto 0);  
            Output : out std_logic_vector (3 downto 0)
            ); 
	   end component;	-- End of the n-bit shift-rotate register component.

	component nbitregister is
    port (	
            -- List of input and output signals of the n-bit register.
            -- Input signals: CLK, D_inputs, reset, preset.
            -- Output signals: Q_out, Q_out_bar.
            CLK : in std_logic;
            D_inputs : in std_logic_vector (3 downto 0);
            reset : in std_logic;
            preset : in std_logic;
            Q_out : out std_logic_vector (3 downto 0);
            Q_out_bar : out std_logic_vector (3 downto 0)
         );
    end component;    -- End of the n-bit register component.	       

 -- Defining and intermediate signals used between the device and its components.
signal shift_to_reg, not_connected : std_logic_vector(width-1 downto 0);
     
begin  
-- Port mapping the components with the entity of the main device involved.
shift_rotator : n_bit_shiftRot port map (Data_In1=>Q_outputs, Data_In2=>D_inputs, Right_in=>shift_in, Right_Select=>shift_rotate, Left_in=>shift_in, Left_Select=>shift_rotate, Control=>F, Output=>shfit_to_reg);
nbit_register : nbitregister port map(CLK=>CLK, D_inputs=>shift_to_reg, reset=>RST, preset=>preset, Q_out=>Q_outputs, Q_out_bar=>not_connected);  

end behavior;	-- End of the architecture.