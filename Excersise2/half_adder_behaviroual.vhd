library ieee;
use ieee.std_logic_1164.all;

entity half_adder_behavioural is
port(	a, b 	: in std_logic;
		sum, carry	: out std_logic);
end half_adder_behavioural;

architecture Behavioural of half_adder_behavioural is
begin
	process(a,b)
	begin
		if a = '1' xor b = '1' then
			sum <= '1';
		else
			sum <= '0';
		end if;
		
		if a = '1' and b = '1' then
			carry <= '1';
		else
			carry <= '0';
		end if;
	end process;
end;