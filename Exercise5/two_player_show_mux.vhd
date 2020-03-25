library ieee;
use ieee.std_logic_1164.all;

entity two_player_show_mux is
port(
	show, set, try, player_input				: in std_logic;
	input												: in std_logic_vector(7 downto 0);
	show1, set1, try1, show0, set0, try0	: out std_logic;
	output0, output1								: out std_logic_vector(7 downto 0)
);
end;

architecture two_player_show_mux_arch of two_player_show_mux is
begin	
		input_mux: process(show,set,input,try, player_input)
	begin
		case(player_input) is
			when '1' => 	--Player 1
				show1 <= show;
				set1 	<= set;
				try1 <= try;
				output1 <= input;

				--Default værdi
				show0 <= '0';
				set0 	<= '0';
				try0 <= '0';
				output0 <= "00000000";

			when '0' => 	--Player 0
				show0 <= show;
				set0 	<= set;
				try0 <= try;
				output0 <= input;

				--Default værdi
				show1 <= '0';
				set1 	<= '0';
				try1 <= '0';
				output1 <= "00000000";
	
			when others => --Default to player 1
				show1 <= show;
				set1 	<= set;
				try1 <= try;
				output1 <= input;
		end case;
	end process input_mux;
end;