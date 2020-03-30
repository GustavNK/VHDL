library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counting_ones is
port(
	A		: in std_logic_vector(7 downto 0);
	ones	: out std_logic_vector(3 downto 0)
);
end;

architecture arch of counting_ones is
begin
	process(A)
	variable count : integer;
	begin
		count := 0;
		for i in 7 downto 0 loop
			if A(i) = '1' then
				count := count + 1;
			end if;
		end loop;
	ones <= std_logic_vector(to_unsigned(count, 4));
	end process;
end;