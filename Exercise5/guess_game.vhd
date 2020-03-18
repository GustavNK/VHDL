library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity guess_game is
port(
	input 	: in std_logic_vector(7 downto 0); 
	set 		: in std_logic; -- Set predefined value 
	show 		: in std_logic; -- Show predefined value 
	try 		: in std_logic; -- Evaluate guess 9 
	hex1 		: out std_logic_vector(6 downto 0); -- 7seg ones 
	hex10		: out std_logic_vector(6 downto 0) -- 7-seg ten
);
end;

architecture guess_game_arch of guess_game is
	signal sl	: std_logic_vector(7 downto 0);
	
begin
	latch: process(input, set)
	begin
		if(set = '0') then
			sl <= input;
		end if;
	end process latch;
end;