library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity two_player_guess_game is
port(
	input 		: in std_logic_vector(7 downto 0); 
	set 			: in std_logic; -- Set predefined value 
	show 			: in std_logic; -- Show predefined value 
	try 			: in std_logic; -- Evaluate guess 9 
	player		: in std_logic; -- Control player 1 or 0
	hex1, hex10, hex_p
					: out std_logic_vector(6 downto 0) -- 7seg-1 and 7seg-10
);
end;

architecture two_player_guess_game_arch of two_player_guess_game is
	signal show0, show1, set0, set1, try0, try1	: std_logic;
	signal input0, input1								: std_logic_vector(7 downto 0);
	signal seg1, seg0										: std_logic_vector(13 downto 0);
begin
	input_mux: process(show,set,input,try)
	begin
		case(player) is
			when '1' => 	--Player 1
				show1 <= show;
				set1 	<= set;
				try1 <= try;
				input1 <= input;
			when '0' => 	--Player 0
				show0 <= show;
				set0 	<= set;
				try0 <= try;
				input0 <= input;
		end case;
	end process input_mux;
	
	u1: entity guess_game (guess_game_arch) port map
	(show=>show1, set=>set1, input=>input1, try=>try1, hex1=>seg1(6 downto 0), hex10=>seg1(13 downto 7));
	
	u0: entity guess_game (guess_game_arch) port map
	(show=>show0, set=>set0, input=>input0, try=>try0, hex1=>seg0(6 downto 0), hex10=>seg0(13 downto 7));
	
	output_mux: process(seg1, seg0)
	begin
		case(player) is
			when '1' =>
				hex1 <= seg1(6 downto 0);
				hex10 <= seg1(13 downto 7);
			when '0' =>
				hex1 <= seg0(6 downto 0);
				hex10 <= seg0(13 downto 7);
		end case;
	end process output_mux;
	
	show_player: entity bin2hex(bin2hex_arch)
	port map(bin => ("000" & player), seg => hex_p);
end;











