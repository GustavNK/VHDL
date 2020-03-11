library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity four_bit_adder is
port(	c_in		: in std_logic;
		a,b		: in std_logic_vector(3 downto 0);
		sum		: out std_logic_vector(3 downto 0);
		c_out	: out std_logic);
end four_bit_adder;

architecture four_bit_adder_arch of four_bit_adder is
	signal c0, c1, c2: std_logic;
begin
	h1: entity full_adder (full_adder_arch) port map
	(c_in=>c_in, a=>a(0), b=>b(0), c_out=>c0, sum=>sum(0));
	h2: entity full_adder(full_adder_arch) port map
	(c_in=>c0, a=>a(1), b=>b(1), c_out=>c1, sum=>sum(1));
	h3: entity full_adder(full_adder_arch) port map
	(c_in=>c1, a=>a(2), b=>b(2), c_out=>c2, sum=>sum(2));
	h4: entity full_adder(full_adder_arch) port map
	(c_in=>c2, a=>a(3), b=>b(3), c_out=>c_out, sum=>sum(3));
end;


