--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:56:33 07/12/2022
-- Design Name:   
-- Module Name:   C:/Drs/Term6/CAD/New folder/Alu_Cad/super_alu_test.vhd
-- Project Name:  Alu_Cad
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: super_alu
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY super_alu_test IS
END super_alu_test;
 
ARCHITECTURE behavior OF super_alu_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT super_alu
    PORT(
         inp : IN  std_logic_vector(47 downto 0);
         clock : IN  std_logic;
         output : OUT  integer
        );
    END COMPONENT;
    

   --Inputs
   signal inp : std_logic_vector(47 downto 0) := (others => '0');
   signal clock : std_logic := '0';

 	--Outputs
   signal output : integer;

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: super_alu PORT MAP (
          inp => inp,
          clock => clock,
          output => output
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		inp <= "000000000000000000010000000010000000010000000010"; 
      wait for clock_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
