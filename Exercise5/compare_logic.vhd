library ieee;
use ieee.std_logic_1164.all;

entity compare_logic is
port(
	secret_value 	: in std_logic_vector(7 downto 0); 
	input 			: in std_logic_vector(7 downto 0);
	try 				: in std_logic; -- Evaluate guess 9 
	compare			: out std_logic_vector(1 downto 0)
);
end;

architecture compare_logic_arch of compare_logic is
begin
	compare_logic: process(try, input, secret_value)
	begin
		if (try = '0') then --active low
			if			(input = secret_value) then
				compare <= "00";			--eqaul (--)
			elsif 	(input > secret_value) then
				compare <= "10";			--higher than (Hi)
			elsif		(input < secret_value) then
				compare <= "01";			--Lower than (Lo)
			else
				compare <= "11";
			end if;
		else
			compare <= "11";
		end if;
	end process compare_logic;
end;