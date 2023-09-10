library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.NUMERIC_STD.all;

entity Div_16_by_8 is
	generic(constant n : natural := 8);
	port(
		num1: in std_logic_vector(15 downto 0);
		num2: in std_logic_vector(n-1 downto 0);
		q: out std_logic_vector(n downto 0);
		r: out std_logic_vector(n-1 downto 0)
	);
end Div_16_by_8;

architecture Behavioral of Div_16_by_8 is
begin
	
	process(num1, num2)
		variable tmpr: std_logic_vector(15 downto 0);
		variable tmpq: std_logic_vector(n downto 0) := "000000000";
		variable tmp2: std_logic_vector(15 downto 0);
		variable tmp : std_logic_vector(16 downto 0);
		variable t2 : std_logic_vector(n-1 downto 0);
	begin
		tmpr := num1;
		t2 := num2;
		if (num2(n-1) = '1') then
			t2 := not t2 + '1';
		end if;
		tmp2 := t2 & "00000000";
		for i in 0 to n loop
			if to_integer(unsigned(tmpr)) >= to_integer(unsigned(tmp2)) then
				tmp := ('0' & tmpr) - ('0' & tmp2);
			    tmpr := tmp(15 downto 0);
				tmpq := std_logic_vector(unsigned(tmpq) sll 1);
				tmpq := tmpq + "00001";
			else
				tmpq := std_logic_vector(unsigned(tmpq) sll 1);
			end if;
			
			tmp2 := std_logic_vector(unsigned(tmp2) srl 1);
		
		end loop;

		if (num1(15) = '1') then
			tmpr := not tmpr + '1';
		end if;
		
		if (num1(15) /= num2(n-1)) then
			tmpq := not tmpq + '1';
		end if;
		
		q <= tmpq;
		r <= tmpr(7 downto 0);
		tmpr := num1;
		tmp2 := num2 & "00000000";
	end process;
	
	

end Behavioral;

