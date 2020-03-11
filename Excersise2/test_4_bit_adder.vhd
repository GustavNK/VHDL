library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity test_4_bit_adder is
port( SW		: in std_logic_vector(8 downto 0);
		LEDR	: out std_logic_vector(4 downto 0));
end;

architecture structural of test_4_bit_adder is
begin
	fb1: entity four_bit_adder (four_bit_adder_arch) port map
	(c_in=>SW(0), a(0)=>SW(1), a(1)=>SW(2), a(2)=>SW(3), a(3)=>SW(4), 
	b(0)=>SW(5), b(1)=>SW(6), b(2)=>SW(7), b(3)=>SW(8), 
	sum(0)=>LEDR(0), sum(1)=>LEDR(1), sum(2)=>LEDR(2), sum(3)=>LEDR(3), c_out=>LEDR(4));
end;