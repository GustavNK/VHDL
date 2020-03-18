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
	hex10		: out std_logic_vector(6 downto 0)  -- 7-seg ten
);
end;

architecture guess_game_arch of guess_game is
	constant lo		: std_logic_vector(13 downto 0) := "10001110100011";
	constant hi		: std_logic_vector(13 downto 0) := "00010011101111";
	constant dash	: std_logic_vector(13 downto 0) := "01111110111111";
	
	signal s_l		: std_logic_vector(7 downto 0);
	signal s_cl		: std_logic_vector(1 downto 0);
	signal s_mux	: std_logic_vector(7 downto 0);
	signal s_b2h	: std_logic_vector(13 downto 0);
begin
	latch: process(input, set)
	begin
		if(set = '0') then --active low
			s_l <= input;
		end if;
	end process latch;
	
	compare_logic: process(try, input, s_l)
	begin
		if (try = '0') then --active low
			if			(input = s_l) then
				s_cl <= "00";			--eqaul (--)
			elsif 	(input > s_l) then
				s_cl <= "10";			--higher than (Hi)
			elsif		(input < s_l) then
				s_cl <= "01";			--Lower than (Lo)
			end if;
		else
			s_cl <= "11";
		end if;
	end process compare_logic;
	
	show_mux: process(show, input, s_l)
	begin
		case(show) is
			when '0' => s_mux <= s_l;
			when others => s_mux <= input;
		end case;
	end process show_mux;
	
	b2h1: entity bin2hex(bin2hex_arch)
	port map(bin => s_mux(3 downto 0), seg => s_b2h(6 downto 0));
	
	b2h10: entity bin2hex(bin2hex_arch)
	port map(bin => s_mux(7 downto 4), seg => s_b2h(13 downto 7));
	
	total_mux: process(s_b2h)
	begin
		case(s_cl) is
			when "10" => 	--Hi Case
				hex10 <= hi(13 downto 7);
				hex1 	<= hi(6 downto 0);
			when "01" => 
				hex10 <= lo(13 downto 7);
				hex1 	<= lo(6 downto 0);
			when "00" =>
				hex10 <= dash(13 downto 7);
				hex1	<= dash(6 downto 0);
			when others =>
				hex10 <= s_b2h(13 downto 7);
				hex1 	<= s_b2h(6 downto 0);
		end case;
	end process total_mux;		
end;