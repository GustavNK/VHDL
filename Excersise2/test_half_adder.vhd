library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity test_half_adder is
port( SW		: in std_logic_vector(5 downto 0);
		LEDR	: out std_logic_vector(5 downto 0));
end;

architecture structural of test_half_adder is
begin
	u1: entity half_adder (dataflow) port map
	(a=>SW(0), b=>SW(1), sum=>LEDR(0), carry=>LEDR(1));
	u2: entity half_adder_behavioural (behavioural) port map
	(a=>SW(2), b=>SW(3), sum=>LEDR(2), carry=>LEDR(3));
	u3: entity half_adder_struct(half_adder_struct_arch) port map
	(a=>SW(4), b=>SW(5), sum=>LEDR(4), carry=>LEDR(5));
end;