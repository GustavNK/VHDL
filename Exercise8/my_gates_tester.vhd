library ieee;
use ieee.std_logic_1164.all;
use work.my_gates.all;


entity my_gates_tester is
port(
	--input
	SW 	: in std_logic_vector(1 downto 0);
	--output
	LEDR	: out std_logic_vector(2 downto 0)
);
end;

architecture arch of my_gates_tester is 
begin
	LEDR(0) <= my_xor(SW(0),SW(1));
	my_and_or(SW(0),SW(1),LEDR(1),LEDR(2));
end;
