library ieee;
use ieee.std_logic_1164.all;

entity nand8_name is
port(
	a	: in std_logic_vector(7 downto 0);
	y	: out std_logic
);
end;

architecture nand8_name_arch of nand8_name is
begin
	nanda: process(a)
	variable y_p	: std_logic;
	begin
		y_p := '0';
		for index in 7 downto 0 loop
			y_p := y_p NAND a(index);
		end loop;
		y <= y_p;
	end process nanda;
end;