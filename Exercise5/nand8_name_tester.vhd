library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity nand8_name_tester is
port(
	SW		:	in std_logic_vector(7 downto 0);
	LEDR	:	out std_logic_vector(0 downto 0)
);
end;

architecture nand8_name_tester_arch of nand8_name_tester is
begin
	u1: entity nand8_name (nand8_name_arch) port map
	(
		a=>SW, y=>LEDR(0)
	);
end;