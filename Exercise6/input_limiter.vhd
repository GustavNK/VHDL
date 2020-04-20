library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity input_limiter is
port(
	-- Input
	bin_min1, bin_min10, bin_hrs1, bin_hrs10
					: in std_logic_vector(3 downto 0);
	--Output
	time_alarm	: out std_logic_vector(15 downto 0)
);
end;

architecture arch of input_limiter is
begin
	input: process(bin_min1, bin_min10, bin_hrs1, bin_hrs10)
	variable m1, m10, h1, h10 : std_logic_vector(3 downto 0);
	begin
		--1s minute limit 
		if to_integer(unsigned(bin_min1)) > 9 then
			m1 := std_logic_vector(to_unsigned(9,4));
		else
			m1 := bin_min1;
		end if;
		
		--10s minute limit
		if to_integer(unsigned(bin_min10)) > 5 then
			m10 := std_logic_vector(to_unsigned(5,4));
		else
			m10 := bin_min10;
		end if;
		
		--1s hour limit
		if (to_integer(unsigned(bin_hrs1)) > 4 AND to_integer(unsigned(bin_hrs10)) > 1) then
			h1 := std_logic_vector(to_unsigned(4,4));
		elsif to_integer(unsigned(bin_hrs1)) > 9 then
			h1 := std_logic_vector(to_unsigned(9,4));
		else
			h1 := bin_hrs1;
		end if;
		
		--10s hour limit
		if to_integer(unsigned(bin_hrs10)) > 2 then
			h10 := std_logic_vector(to_unsigned(2,4));
		else
			h10 := bin_hrs10;
		end if;
		
		--Assignement of correct values
		time_alarm <= h10 & h1 & m10 & m1;
	end process input;
end;