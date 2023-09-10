library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
--use ieee.NUMERIC_STD.all;
use IEEE.std_logic_arith.ALL;


entity ALU is
  generic(constant width : natural := 8);
  Port(A, B : in  STD_LOGIC_VECTOR(width-1 downto 0); 
       ALU_SEL : in  STD_LOGIC_VECTOR(2 downto 0);  -- 8 tasks
       ALU_OUT : out  STD_LOGIC_VECTOR(width-1 downto 0)
		 ); 
end ALU; 

architecture Behavioral of ALU is

	component Div_16_by_8 is
		generic(constant n : natural := 8);
		port(
			num1: in std_logic_vector(15 downto 0);
			num2: in std_logic_vector(n-1 downto 0);
			q: out std_logic_vector(n downto 0);
			r: out std_logic_vector(n-1 downto 0)
		);
	end component;
	signal Result : std_logic_vector (width downto 0);
	signal tmpres: std_logic_vector (8 downto 0);
	signal tmpr: std_logic_vector (7 downto 0);
	signal tmpA: std_logic_vector (15 downto 0);
begin
	
	tmpA <= A(7) & A(7) & A(7) & A(7) & A(7) & A(7) & A(7) & A(7) & A;
	div: Div_16_by_8 port map(num1 => tmpA, num2 => B, q => tmpres, r => tmpr);

	process(A, B, ALU_SEL)
		variable temp: std_logic_vector (width downto 0);
	begin
		temp := (others => '0');
		CASE(ALU_SEL) IS
			WHEN "000" => -- Addition
				temp := '0' & (signed(A) + signed(B));
				Result <= temp; 
			WHEN "001" => -- Subtraction
				temp := '0' & (signed(A) - signed(B));
				Result <= temp; 
			WHEN "010" => -- Multiplication
				Result <= conv_std_logic_vector(signed(A) * signed(B), 9);
			WHEN "011" => -- Division				
				Result <= tmpres;
			
			WHEN "100" => -- power
				if (A = "00000001") then
					Result <= "000000001";
				elsif (B = "00000000") then
					Result <= "000000001";
				elsif (B = "00000001") then
					Result <= '0' & A;
				elsif (B = "00000010") then
					Result <= conv_std_logic_vector(signed(A) * signed(A), 9);
				elsif (B = "00000011") then
					Result <= conv_std_logic_vector(signed(A) * signed(A) * signed(A), 9);
				elsif (B = "00000100") then
					Result <= conv_std_logic_vector(signed(A) * signed(A) * signed(A) * signed(A), 9);
				elsif (B = "00000101") then
					Result <= conv_std_logic_vector(signed(A) * signed(A) * signed(A) * signed(A) * signed(A), 9);
				elsif (B = "00000110") then
					Result <= conv_std_logic_vector(signed(A) * signed(A) * signed(A) * signed(A) * signed(A) * signed(A), 9);
				elsif (B = "00000111") then
					Result <= conv_std_logic_vector(signed(A) * signed(A) * signed(A) * signed(A) * signed(A) * signed(A) * signed(A), 9);
				else
					Result <= "XXXXXXXXX";
				end if;
				
			WHEN "101" => -- logarithm
				if (A >= "00000001" and A < "00000010") then
					Result <= "000000000";
				elsif (A >= "00000010" and A < "00000100") then
					Result <= "000000001";
				elsif (A >= "00000100" and A < "00001000") then
					Result <= "000000010";
				elsif (A >= "00001000" and A < "00010000") then
					Result <= "000000011";
				elsif (A >= "00010000" and A < "00100000") then
					Result <= "000000100";
				elsif (A >= "00100000" and A < "01000000") then
					Result <= "000000101";
				elsif (A >= "01000000" and A <= "01111111") then
					Result <= "000000110";
--				elsif (A = "10000000") then
--					Result <= "111111001";
--				elsif (A > "10000000" and A <= "11000000") then
--					Result <= "111111010";
--				elsif (A > "11000000" and A <= "11100000") then
--					Result <= "111111011";
--				elsif (A > "11100000" and A <= "11110000") then
--					Result <= "111111100";
--				elsif (A > "11110000" and A <= "11111000") then
--					Result <= "111111101";
--				elsif (A > "11111000" and A <= "11111100") then
--					Result <= "111111110";
--				elsif (A > "11111100" and A <= "11111110") then
--					Result <= "111111111";
--				elsif (A = "11111111" or A = "00000000") then
--					Result <= "000000000";
				else
					Result <= "XXXXXXXXX";
				end if;
				
			WHEN "110" => -- square root
				if (A >= "00000000" and A < "00000001") then -- 0, 1
					Result <= "000000000";
				elsif (A >= "00000001" and A < "00000100") then -- 1, 4
					Result <= "000000001";
				elsif (A >= "00000100" and A < "00001001") then -- 4, 9
					Result <= "000000010";
				elsif (A >= "00001001" and A < "00010000") then -- 9, 16
					Result <= "000000011";
				elsif (A >= "00010000" and A < "00011001") then -- 16, 25
					Result <= "000000100";
				elsif (A >= "00011001" and A < "00100100") then -- 25, 36
					Result <= "000000101";
				elsif (A >= "00100100" and A < "00110001") then -- 36, 49
					Result <= "000000110";
				elsif (A >= "00110001" and A < "01000000") then -- 49, 64
					Result <= "000000111";
				elsif (A >= "01000000" and A < "01010001") then -- 64, 81
					Result <= "000001000";
				elsif (A >= "01010001" and A < "01100100") then -- 81, 100
					Result <= "000001001";
				elsif (A >= "01100100" and A < "01111001") then -- 100, 121
					Result <= "000001010";
				elsif (A >= "01111001" and A < "01111111") then -- 121, 128
					Result <= "000001011";
				elsif (A >= "10000000" and A <= "10000111") then -- -128, -121
					Result <= "111110101";
				elsif (A > "10000111" and A <= "10011100") then -- -121, -100
					Result <= "111110110";
				elsif (A > "10011100" and A <= "10101111") then -- -100, -81
					Result <= "111110111";
				elsif (A > "10101111" and A <= "11000000") then -- -81, -64
					Result <= "111111000";
				elsif (A > "11000000" and A <= "11001111") then -- -64, -49
					Result <= "111111001";
				elsif (A > "11001111" and A <= "11011100") then -- -49, -36
					Result <= "111111010";
				elsif (A > "11011100" and A <= "11100111") then -- -36, -25
					Result <= "111111011";
				elsif (A > "11100111" and A <= "11110000") then -- -25, -16
					Result <= "111111100";
				elsif (A > "11110000" and A <= "11110111") then -- -16, -9
					Result <= "111111101";
				elsif (A > "11110111" and A <= "11111100") then -- -9, -4
					Result <= "111111110";
				elsif (A > "11111100" and A <= "11111111") then -- -4, -1
					Result <= "111111111";
				else
					Result <= "XXXXXXXXX";
				end if;
			WHEN OTHERS => Result <= (others => 'X'); 
		END CASE;
	end process;

		ALU_OUT <= Result(width - 1 downto 0); -- ALU out
	
end Behavioral;

