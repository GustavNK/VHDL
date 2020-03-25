library ieee;
use ieee.std_logic_1164.all;

entity two_player_total_mux is
port(
	player		: in std_logic;
	seg1, seg0	: in std_logic_vector(13 downto 0);
	hex1, hex10	: out std_logic_vector(6 downto 0)
);
end;

architecture two_player_total_mux_arch of two_player_total_mux is
begin
	output_mux: process(seg1, seg0, player)
	begin
		case(player) is
			when '1' =>
				hex1 <= seg1(6 downto 0);
				hex10 <= seg1(13 downto 7);
			when '0' =>
				hex1 <= seg0(6 downto 0);
				hex10 <= seg0(13 downto 7);
			when others => --Default to Player 1
				hex1 <= seg1(6 downto 0);
				hex10 <= seg1(13 downto 7);
		end case;
	end process output_mux;
end;