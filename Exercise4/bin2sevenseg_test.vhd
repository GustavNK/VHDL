library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity bin2sevenseg_test is port(
	SW		: in std_logic_vector(3 downto 0);
	HEX0 	: out std_logic_vector(6 downto 0)
);
end;

architecture bin2sevenseg_test_arch of bin2sevenseg_test is
begin
u1: entity bin2sevenseg (bin2sevenseg_arch)
port map(
	bin => SW(3 downto 0),
	sseg => HEX0(6 downto 0)
);
end;