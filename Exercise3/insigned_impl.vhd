library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity unsigned_impl is 
	port( 
	A 		: in std_logic_vector(3 downto 0);
	B 		: in std_logic_vector(3 downto 0);
	sum 	: in std_logic_vector(3 downto 0)
	);
end;	

architecture unsigned_impl_arch of unsigned_impl is
	signal unsignedSum : unsigned(3 downto 0);
begin	
	unsignedSum <= unsigned(A) + unsigned(B);
	sum <= std_logic_ector(unsingedSum);
end;