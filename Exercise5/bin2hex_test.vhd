library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity bin2hex_test is
port(
	SW	: in std_logic_vector(3 downto 0);
	HEX0	: out std_logic_vector(6 downto 0)
);
end;

architecture bin2hex_test_arch of bin2hex_test is
begin
u1: entity bin2hex(bin2hex_arch)
port map(
	bin(3 downto 0) => SW(3 downto 0),
	seg(6 downto 0) => HEX0(6 downto 0)
	);
end;