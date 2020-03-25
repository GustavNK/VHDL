library ieee;
use ieee.std_logic_1164.all;

entity show_mux is
port(
	show 				: in std_logic;
	secret_value 	: in std_logic_vector(7 downto 0);
	input				: in std_logic_vector(7 downto 0);
	output			: out std_logic_vector(7 downto 0)
);
end;

architecture show_mux_arch of show_mux is
begin
	show_mux: process(show, input, secret_value)
	begin
		case(show) is
			when '0' => output <= secret_value;
			when others => output <= input;
		end case;
	end process show_mux;
end;