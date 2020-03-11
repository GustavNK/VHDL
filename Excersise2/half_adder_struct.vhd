library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity half_adder_struct is
port(a, b 	: in std_logic;
		sum, carry	: out std_logic);
end half_adder_struct;

architecture half_adder_struct_arch of half_adder_struct is
begin
	u1: entity xor_2 (xor2_arch) port map
	(a=>a, b=>b,c=>sum);
	u2: entity and_2 (and2_arch) port map
	(a=>a, b=>b, c=>carry);
end;