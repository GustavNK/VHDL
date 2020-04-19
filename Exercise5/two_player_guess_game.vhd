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
					: out std_logic_vector(6 downto 0)
);
end;

architecture arch of two_player_guess_game is
	signal show0, show1, set0, set1, try0, try1	
		: std_logic;
	signal input0, input1					
		: std_logic_vector(7 downto 0);
	signal seg1, seg0	
		: std_logic_vector(13 downto 0);
begin
	u2: entity two_player_show_mux (arch) port map
	(player_input=>player, show=>show, set=>set, 
	try=>try, input=>input, 
	output1=>input1, output0=>input0,
	show0 => show0, set0 => set0, try0 => try0,
	show1 => show1, set1 => set1, try1 => try1
	);
	
	u1: entity guess_game (arch) port map(
	show=>show1, set=>set1, 
	input=>input1, try=>try1, 
	hex1=>seg1(6 downto 0), 
	hex10=>seg1(13 downto 7));
	
	u0: entity guess_game (arch) port map(
	show=>show0, set=>set0, 
	input=>input0, try=>try0, 
	hex1=>seg0(6 downto 0), 
	hex10=>seg0(13 downto 7));
	
	u3: entity two_player_total_mux (arch) port map
	(seg1=>seg1, seg0=>seg0, 
	player=>player, hex1=>hex1, hex10=>hex10);
	
	show_player: entity bin2hex(bin2hex_arch)
	port map(bin => ("000" & player), seg => hex_p);
end;


