library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity hex_mux_test is port(
	SW					: in std_logic_vector(11 downto 0);
	KEY				: in std_logic_vector(1 downto 0);
	HEX0,HEX1,HEX2 : out std_logic_vector(6 downto 0)
);
end;

architecture hex_mux_test_arch of hex_mux_test is
begin
u1: entity hex_mux (hex_mux_arch)
port map(
	bin						=> SW,
	sel						=> KEY,
	tsseg(20 downto 14)	=> HEX2,
	tsseg(13 downto 7)	=> HEX1,
	tsseg(6 downto 0)		=> HEX0
);
end;