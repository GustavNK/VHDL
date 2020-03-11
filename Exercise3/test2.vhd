library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity test2 is port(
	SW		: in std_logic_vector(8 downto 0);
	LEDR	: out std_logic_vector(4 downto 0)
	);
end;

architecture test_arch of test2 is
begin
u1: entity four_bit_adder (signed_impl) 
port map(
	c_in => SW(0),
	A => SW(4 downto 1), 
	B => SW(8 downto 5),
	
	c_out => LEDR(4),
	Sum => LEDR(3 downto 0)
	);
end;