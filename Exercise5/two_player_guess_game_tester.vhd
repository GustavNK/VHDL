library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity two_player_guess_game_tester is
port(
	KEY		: in std_logic_vector(2 downto 0);
	SW			: in std_logic_vector(8 downto 0);
	HEX0, HEX1, HEX2, HEX3
				: out std_logic_vector(6 downto 0)
);
end;

architecture arch of two_player_guess_game_tester is
begin
	HEX2 <= "1111111";
	u1: entity two_player_guess_game (arch) port map
	(
		show 	=> KEY(0),
		set 	=> KEY(1),
		try	=> KEY(2),
		input => SW(8 downto 1),
		hex1	=> HEX0,
		hex10	=> HEX1,
		hex_P => HEX3,
		player => SW(0)
	);
end;