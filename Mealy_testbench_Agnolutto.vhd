--------------------------------------------------------------------------------
-- Company: USAFA/DFEC
-- Engineer: Scott Agnolutto
-- 
-- Create Date:   00:52:26 03/10/2014
-- Design Name:		CE3
-- Module Name:    	Moore_testbench_Agnolutto
-- Description: 		Testbench for Moore controller
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY Mealy_testbench_Agnolutto IS
END Mealy_testbench_Agnolutto;
 
ARCHITECTURE behavior OF Mealy_testbench_Agnolutto IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MealyElevatorController_Shell
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         stop : IN  std_logic;
         up_down : IN  std_logic;
         floor : OUT  std_logic_vector(3 downto 0);
         nextfloor : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal stop : std_logic := '0';
   signal up_down : std_logic := '0';

 	--Outputs
   signal floor : std_logic_vector(3 downto 0);
   signal nextfloor : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MealyElevatorController_Shell PORT MAP (
          clk => clk,
          reset => reset,
          stop => stop,
          up_down => up_down,
          floor => floor,
          nextfloor => nextfloor
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;


   -- stimulus process
   stim_process :process
   begin
		

		wait for 100ns;
		
		reset <= '1';
		up_down <= '1';
		stop <= '1';
		wait for 100ns;
		
		--moves to second floor
		reset <= '0';
		up_down <= '1';
		stop <= '0';
		wait for clk_period;

		--waits for two clock cycles
		up_down <= '1';
		stop <= '1';
		wait for clk_period*2;

		--moves to third floor
		up_down <= '1';
		stop <= '0';
		wait for clk_period;

		--waits for two clock cycles
		up_down <= '1';
		stop <= '1';
		wait for clk_period*2;

		--moves to fourth floor
		up_down <= '1';
		stop <= '0';
		wait for clk_period;

		--waits for two clock cycles
		up_down <= '1';
		stop <= '1';
		wait for clk_period*2;

      --moves down to floor3
		up_down <= '0';
		stop <= '0';
		wait for clk_period;

		--moves down to floor2
		up_down <= '0';
		stop <= '0';
		wait for clk_period;

		--moves down to floor1
		up_down <= '0';
		stop <= '0';
		wait for clk_period;

   end process;

END;
