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

entity super_alu is
    Port ( inp : in  std_logic_vector(47 downto 0);
	 clock : in  std_logic;
	output : out integer
	 );    
end super_alu;

architecture super_alu of super_alu is 
component Reg 
    Port ( input : in integer;
           writ : in  std_logic;
           clk : in  std_logic;
           outputReg : out  integer);
end component;
signal regout1 : integer;
signal regout2 : integer;
signal regout3 : integer;
signal regout4 : integer;
signal regout5 : integer;
signal regout6 : integer;
signal regout7 : integer;
signal regout8 : integer;
signal outputs : integer :=0;

signal writ1 : std_logic :='0';
signal writ2 : std_logic:='0';
signal writ3 : std_logic:='0';
signal writ4 : std_logic:='0';
signal writ5 : std_logic:='0';
signal writ6 : std_logic:='0';
signal writ7 : std_logic:='0';
signal writ8 : std_logic:='0';	  
signal lefttmp : integer ;
signal righttmp : integer;		   
signal checktmp1 :integer;	   
signal checktmp2 :integer;
signal checktmp3 :integer;
signal checktmp4 :integer;

begin
c1 : Reg port map(input => outputs,writ => writ1  ,clk => clock,outputReg => regout1);
c2 : Reg port map(input => outputs,writ => writ2  ,clk => clock,outputReg => regout2);
c3 : Reg port map(input => outputs,writ => writ3  ,clk => clock,outputReg => regout3);
c4 : Reg port map(input => outputs,writ => writ4  ,clk => clock,outputReg => regout4);
c5 : Reg port map(input => outputs,writ => writ5  ,clk => clock,outputReg => regout5);
c6 : Reg port map(input => outputs,writ => writ6  ,clk => clock,outputReg => regout6);
c7 : Reg port map(input => outputs,writ => writ7  ,clk => clock,outputReg => regout7);
c8 : Reg port map(input => outputs,writ => writ8  ,clk => clock,outputReg => regout8);
process (inp,regout1,regout2,regout3,regout4,regout5,regout6,regout7,regout8)
variable temp : integer ;
variable n : integer;
variable op1 : std_logic_vector(2 downto 0);
variable op2 : std_logic_vector(2 downto 0);
variable op3 : std_logic_vector(2 downto 0);
variable selector : std_logic_vector(2 downto 0);
variable tmp1 :integer;
variable tmp2 : integer;
variable tmp3 : integer;
variable tmp4 : integer;
variable left: integer ;
variable right: integer;
variable outputLR : integer;
variable power : integer :=1;  


begin
selector := inp(47 downto 45);
op1:= inp(44 downto 42);
op2:= inp(41 downto 39);
op3:= inp(38 downto 36);
tmp1:= to_integer(signed(inp(34 downto 27)));
tmp2:= to_integer(signed(inp(25 downto 18)));
tmp3:= to_integer(signed(inp(16 downto 9)));
tmp4:= to_integer(signed(inp(7 downto 0)));	   

checktmp4 <=	tmp4;
checktmp3 <= tmp3;
checktmp2 <= tmp2;
checktmp1 <= tmp1;

if inp(8) = '1' then
if tmp4 <= 32 then
tmp4 := regout1;
else if tmp4 <= 64 then
tmp4 :=regout2;

else if tmp4 <= 96 then
tmp4 := regout3 ;

else if tmp4 <= 128 then 
tmp4 := regout4;

else if tmp4 <= 160 then
tmp4 := regout5;

else if tmp4 <= 192 then
tmp4 := regout6;

else if tmp4 <= 224 then
tmp4 := regout7;
else if tmp4 <=256 then
tmp4 := regout8;

end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;

if inp(17) = '1' then
if tmp3 <= 32 then
tmp3 := regout1;
else if tmp3 <= 64 then
tmp3 :=regout2;

else if tmp3 <= 96 then
tmp3 := regout3 ;

else if tmp3 <= 128 then 
tmp3 := regout4;

else if tmp3 <= 160 then
tmp3 := regout5;

else if tmp3 <= 192 then
tmp3 := regout6;

else if tmp3 <= 224 then
tmp3 := regout7;
else if tmp3 <=256 then
tmp3 := regout8;

end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;

if inp(26) = '1' then
if tmp2 <= 32 then
tmp2 := regout1;
else if tmp2 <= 64 then
tmp2 :=regout2;

else if tmp2 <= 96 then
tmp2 := regout3 ;

else if tmp2 <= 128 then 
tmp2 := regout4;

else if tmp2 <= 160 then
tmp2 := regout5;

else if tmp2 <= 192 then
tmp2 := regout6;

else if tmp2 <= 224 then
tmp2 := regout7;
else if tmp2 <=256 then
tmp2 := regout8;

end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;

if inp(35) = '1' then
if tmp1 <= 32 then
tmp1 := regout1;
else if tmp1 <= 64 then
tmp1 :=regout2;

else if tmp1 <= 96 then
tmp1 := regout3 ;

else if tmp1 <= 128 then 
tmp1 := regout4;

else if tmp1 <= 160 then
tmp1 := regout5;

else if tmp1 <= 192 then
tmp1 := regout6;

else if tmp1 <= 224 then
tmp1 := regout7;
else if tmp1 <=256 then
tmp1 := regout8;

end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;
end if;


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
	left := n;
	if tmp1 > 2 ** n then
		left := n+1;
	else 
		left := n; 
	end if;
when others =>
			left := 0;
	end case;
lefttmp <= left;	
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
		if  i /= tmp4  then
	power := tmp3 * power;     
  end if;     
  end loop;
  right := power;
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
	
	righttmp <=right;
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
	outputs <= outputLR;	   
	output <= outputLR;
	case selector is
	when "000" =>
	writ1 <='1';
	when "001" =>
	writ2 <='1';
	when "010" =>
	writ3 <='1';
	when "011" =>
	writ4 <='1';
	when "100" =>
	writ5 <='1';
	when "101" =>
	writ6 <='1';
	when "110" =>
	writ7 <='1';
	when "111" =>
	writ8 <='1';
	when others => 
	writ1 <='1';
	end case;
	
end process;
end super_alu;

