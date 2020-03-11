library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity full_adder is
port(	a, b, c_in	: in std_logic;
		sum, c_out	: out std_logic);
end full_adder;

architecture full_adder_arch of full_adder is
	signal s1, c1, c2: std_logic;
begin
	h1: entity half_adder_struct (half_adder_struct_arch) port map
	(a=>a, b=>b, carry=>c1, sum=>s1);
	h2: entity half_adder_struct (half_adder_struct_arch) port map
	(a=>s1, b=>c_in, sum=>sum, carry=>c2);
	c_out <= c1 or c2;
end;


