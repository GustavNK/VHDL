library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity test_full_adder is
port( SW		: in std_logic_vector(2 downto 0);
		LEDR	: out std_logic_vector(1 downto 0));
end;

architecture structural of test_full_adder is
begin
	u1: entity full_adder (full_adder_arch) port map
	(a=>SW(0), b=>SW(1), c_in=>SW(2), sum=>LEDR(0), c_out=>LEDR(1));
end;