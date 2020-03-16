library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity test is port(
	SW		: in std_logic_vector(7 downto 0);
	LEDR	: out std_logic_vector(3 downto 0)
	);
end;

architecture test_arch of test is
begin
u1: entity four_bit_adder_simple (unsigned_impl) 
port map(
	A => SW(3 downto 0), 
	B => SW(7 downto 4), 
	Sum => LEDR(3 downto 0)
	);
end;