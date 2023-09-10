						   ----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:12:50 07/06/2022 
-- Design Name: 
-- Module Name:    super_alu - Behavioral 
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

entity Alu_Proj is
    Port ( inp : in  std_logic_vector(40 downto 0);
	output : out integer;
	outputL : out integer;
	outputR : out integer
	 );    
end Alu_Proj;

architecture Alu_Proj of Alu_Proj is
begin
process (inp)
variable temp : integer ;
variable n : integer;
variable op1 : std_logic_vector(2 downto 0);
variable op2 : std_logic_vector(2 downto 0);
variable op3 : std_logic_vector(2 downto 0);
variable tmp1 :integer;
variable tmp2 : integer;
variable tmp3 : integer;
variable tmp4 : integer;
variable left: integer;
variable right: integer;
variable outputLR : integer;
variable power : integer :=1;

begin
op1:= inp(40 downto 38);
op2:= inp(37 downto 35);
op3:= inp(34 downto 32);
tmp1:= to_integer(signed(inp(31 downto 24)));
tmp2:= to_integer(signed(inp(23 downto 16)));
tmp3:= to_integer(signed(inp(15 downto 8)));
tmp4:= to_integer(signed(inp(7 downto 0)));
n := 0;
case op1 is
 when "000" =>
	left := tmp1+tmp2;
	when "001" =>
	left := tmp1 - tmp2;
	when "010" =>
	left := tmp1 * tmp2;
	when "011" =>
	left := tmp1/tmp2;
	when "100" =>
	   for i in 0 to 10  loop
		if  i /= tmp2  then
	power := tmp1 * power;     
  end if;     
  end loop;
  left := power;
	when "101" =>
		temp := tmp1;
	while temp >1 loop 
		temp := temp/2;
		n := n +1;
	end loop;
	if tmp1 > 2 ** n then
		left := n+1;
	else 
		left := n; 
	end if;
when others =>
			left := 0;
	end case;
	
case op3 is
 when "000" =>
	right := tmp3+tmp4;
	when "001" =>
	right := tmp3 - tmp4;
	when "010" =>
	right := tmp3 * tmp4;
	when "011" =>
	right := tmp3/tmp4;
	when "100" =>
	   for i in 0 to 10  loop
		if  i /= tmp2  then
	power := tmp1 * power;     
  end if;     
  end loop;
  left := power; 
	when "101" =>
		temp := tmp3;
	while temp >1 loop 
		temp := temp/2;
		n := n +1;
	end loop;
	if tmp3 > 2 ** n then
		right := n+1;
	else 
		right := n; 
	end if;
when others =>
			right := 0;
	end case;
case op2 is
 when "000" =>
	outputLR := left+right;
	when "001" =>
	outputLR := left-right;
	when "010" =>
	outputLR := left*right;
	when "011" =>
	outputLR := left/right;
	when "100" =>
		   for i in 0 to 10  loop
		if  i /= right  then
	power := left * power;     
  end if;     
  end loop;
  outputLR  := power;
	when "101" =>
		temp := left;
	while temp >1 loop 
		temp := temp/2;
		n := n +1;
	end loop;
	if outputLR > 2 ** n then
		outputLR := n+1;
	else 
		outputLR := n; 
	end if;
when others =>
			outputLR := 0;
	end case;
	output <=  outputLR;
	outputR <= tmp1;
	outputL <= tmp2;
end process;
end Alu_Proj;

