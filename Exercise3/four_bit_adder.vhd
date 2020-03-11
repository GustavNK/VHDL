library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity four_bit_adder is 
	port( 
	A,B 		: in std_logic_vector(3 downto 0);
	c_in		: in std_logic;
	sum 		: out std_logic_vector(3 downto 0);
	c_out		: out std_logic
	);
end;

architecture unsigned_impl of four_bit_adder is
signal c1 : std_logic_vector(4 downto 0);
begin
	c1 <= std_logic_vector(resize(unsigned(A),5) + resize(unsigned(B),5) + ("0000" & c_in));
	c_out <= c1(4);
	sum <= c1(3 downto 0);
end;

architecture signed_impl of four_bit_adder is
signal c2 : std_logic_vector(4 downto 0);
begin
	c2 <= std_logic_vector(resize(signed(A),5) + resize(signed(B),5) + ("0000" & c_in));
	c_out <= c2(4);
	sum <= c2(3 downto 0);
end;