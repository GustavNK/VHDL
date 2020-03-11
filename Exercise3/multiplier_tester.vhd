library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity multiplier_tester is port(
	SW		: in std_logic_vector(15 downto 0);
	LEDR	: out std_logic_vector(15 downto 0)
	);
end;

architecture multiplier_tester_arch of multiplier_tester is
begin
u1: entity mult (mult_arch) 
port map(
	A => SW(7 downto 0),
	B => SW(15 downto 8),
	prod => LEDR(15 downto 0)


);
end;