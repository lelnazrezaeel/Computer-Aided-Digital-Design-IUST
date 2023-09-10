--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:35:19 07/06/2022
-- Design Name:   
-- Module Name:   C:/Drs/Term6/CAD/New folder/Alu_Cad/alu_t.vhd
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
 
ENTITY alu_t IS

END alu_t;
 
ARCHITECTURE behavior OF alu_t IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT super_alu
    PORT(
         inp : IN  std_logic_vector(40 downto 0);
         output : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal inp : std_logic_vector(40 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: super_alu PORT MAP (
          inp => inp,
          output => output
        );

   -- Clock process definitions
   begin
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
			inp <= "00001010000001100000001100000001000000100";

      -- insert stimulus here 

      wait;
   end process;

END;
