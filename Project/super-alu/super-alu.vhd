library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.NUMERIC_STD.all;

entity super_alu is
	port(
		input: in std_logic_vector(40 downto 0);
		output: out std_logic_vector(7 downto 0)
	);
end super_alu;

architecture Behavioral of super_alu is

	component ALU is
	  generic(constant width : natural := 8);
	  Port(A, B : in  STD_LOGIC_VECTOR(width-1 downto 0); 
			 ALU_SEL : in  STD_LOGIC_VECTOR(2 downto 0);  -- 8 tasks
			 ALU_OUT : out  STD_LOGIC_VECTOR(width-1 downto 0)
			 );
	end component; 
	
	signal output1: std_logic_vector(7 downto 0);
	signal output2: std_logic_vector(7 downto 0);
	signal outputz: std_logic_vector(7 downto 0);
	
begin

	alu1: ALU port map (A => input(31 downto 24), B => input(23 downto 16), ALU_SEL => input(40 downto 38), ALU_OUT => output1);
	alu2: ALU port map (A => input(15 downto 8), B => input(7 downto 0), ALU_SEL => input(34 downto 32), ALU_OUT => output2);
	aluz: ALU port map (A => output1, B => output2, ALU_SEL => input(37 downto 35), ALU_OUT => outputz);
	
	
	
	output <= outputz;

end Behavioral;

