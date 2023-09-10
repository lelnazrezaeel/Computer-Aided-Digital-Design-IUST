----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:26:28 07/08/2022 
-- Design Name: 
-- Module Name:    register - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Reg is
    Port ( input : in integer;
           writ : in  std_logic;
           clk : in  std_logic;
           outputReg : out  integer);
end Reg;

architecture Reg of Reg is

begin
process(clk) is

   begin

 if rising_edge(clk) then

if(writ='1') then  

outputReg<= input;
       

end if;

      end if;
		end process;

end Reg;

