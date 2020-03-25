library ieee;
use ieee.std_logic_1164.all;

entity two_player_show_mux is
port(
	show, set, try, player_input				: in std_logic;
	input 											: in std_logic_vector(6 downto 0);
	show1, set1, try1, show0, set0, try0	: out std_logic;
	output											: out std_logic_vector(6 downto 0)
);
end;

architecture two_player_show_mux_arch of two_player_show_mux is
begin	
		input_mux: process(show,set,input,try)
	begin
		case(player_input) is
			when '1' => 	--Player 1
				show1 <= show;
				set1 	<= set;
				try1 <= try;
				output <= input;
			when '0' => 	--Player 0
				show0 <= show;
				set0 	<= set;
				try0 <= try;
				output <= input;
			when others => --Default to player 1
				show1 <= show;
				set1 	<= set;
				try1 <= try;
		end case;
	end process input_mux;

	
	
	
	
	
	
end;