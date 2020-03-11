library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity four_bit_adder_simple is 
	port( 
	A, B 		: in std_logic_vector(3 downto 0);
	sum 		: out std_logic_vector(3 downto 0)
	);
end;

architecture unsigned_impl of four_bit_adder_simple is
begin	
	sum <= std_logic_vector(unsigned(A) + unsigned(B));
end;

architecture signed_impl of four_bit_adder_simple is
begin	
	sum <= std_logic_vector(signed(A) + signed(B));
end;