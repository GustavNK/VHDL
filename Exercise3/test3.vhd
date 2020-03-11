library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity test3 is port(
	SW		: in std_logic_vector(7 downto 0);
	LEDR	: out std_logic_vector(7 downto 0)
	);
end;

architecture shift_div_arch of test3 is
begin
u1: entity shift_div (shift_div_arch) 
port map(
	a => SW(7 downto 0),
	a_ror => LEDR(7 downto 0)
	);
end;