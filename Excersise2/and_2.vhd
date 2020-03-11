library ieee;
use ieee.std_logic_1164.all;

entity and_2 is
port(	a, b 	: in std_logic;
		c		: out std_logic);
end and_2;

architecture and2_arch of and_2 is 
begin
	c <= a and b;
end;