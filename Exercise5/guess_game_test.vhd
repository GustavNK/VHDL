library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity guess_game_test is
port(
	KEY	: in std_logic_vector(2 downto 0);
	SW		: in std_logic_vector(7 downto 0);
	HEX0, HEX1
			: out std_logic_vector(6 downto 0)
);
end;

architecture arch of guess_game_test is
begin
	u1: entity guess_game(arch)
	port map(
		show 	=> KEY(0),
		set 	=> KEY(1),
		try	=> KEY(2),
		input => SW,
		hex1	=> HEX0,
		hex10	=> HEX1
	);
end;