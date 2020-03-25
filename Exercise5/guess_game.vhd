library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity guess_game is
port(
	input 	: in std_logic_vector(7 downto 0); -- 8bit input
	set 		: in std_logic; -- Set predefined value 
	show 		: in std_logic; -- Show predefined value 
	try 		: in std_logic; -- Evaluate guess 9 
	hex1 		: out std_logic_vector(6 downto 0); -- 7seg ones 
	hex10		: out std_logic_vector(6 downto 0)  -- 7-seg tens
);
end;

architecture guess_game_arch of guess_game is	
	signal s_cl		: std_logic_vector(1 downto 0);
	signal s_b2h1, s_b2h10	
						: std_logic_vector(6 downto 0);
	signal s_l, s_mux		
						: std_logic_vector(7 downto 0);
begin
	lat: entity mylatch(mylatch_arch)
	port map(set => set, input => input, secret_value => s_l);

	comp: entity compare_logic(compare_logic_arch)
	port map(secret_value => s_l, input => input, 
		try => try, compare => s_cl);
	
	sm: entity show_mux(show_mux_arch)
	port map(show => show, input => input, 
		secret_value => s_l, output => s_mux);
	
	b2h1: entity bin2hex(bin2hex_arch)
	port map(bin => s_mux(3 downto 0), seg => s_b2h1);
	
	b2h10: entity bin2hex(bin2hex_arch)
	port map(bin => s_mux(7 downto 4), seg => s_b2h10);
	
	tm: entity total_mux(total_mux_arch)
	port map(seg1 => s_b2h1, seg10 => s_b2h10, 
		compare => s_cl, hex1 => hex1, hex10 => hex10);	
end;