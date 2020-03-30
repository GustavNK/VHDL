library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity count_ones_test is
port(
	SW		:	in std_logic_vector(7 downto 0);
	HEX0	:	out std_logic_vector(6 downto 0)
);
end;

architecture count_ones_test_arch of count_ones_test is
signal ones2bin : std_logic_vector(3 downto 0);
begin
	u1: entity counting_ones (arch) port map
	(
		A=>SW, ones => ones2bin
	);
	u2: entity bin2hex (bin2hex_arch) port map
	( 
		bin => ones2bin, seg => HEX0
	);
end;