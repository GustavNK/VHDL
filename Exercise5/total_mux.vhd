library ieee;
use ieee.std_logic_1164.all;

entity total_mux is
port(
	seg1	 	: in std_logic_vector(6 downto 0); 
	seg10		: in std_logic_vector(6 downto 0);
	compare 	: in std_logic_vector(1 downto 0);
	hex1		: out std_logic_vector(6 downto 0);
	hex10		: out std_logic_vector(6 downto 0)
);
end;

architecture total_mux_arch of total_mux is
	constant lo		: std_logic_vector(13 downto 0) 
		:= "10001110100011";
	constant hi		: std_logic_vector(13 downto 0) 
		:= "00010011101111";
	constant dash	: std_logic_vector(13 downto 0) 
		:= "01111110111111";
begin
	total_mux: process(compare, seg1, seg10)
	begin
		case(compare) is
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
				hex10 <= seg10(6 downto 0);
				hex1 	<= seg1(6 downto 0);
		end case;
	end process total_mux;
end;