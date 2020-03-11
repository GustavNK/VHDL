library ieee;
use ieee.std_logic_1164.all;

entity xor_2 is
port(	a, b 	: in std_logic;
		c		: out std_logic);
end xor_2;

architecture xor2_arch of xor_2 is
begin
	c <= a xor b;
end;