library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity unsigned_impl is 
	port( 
	A, B 		: in std_logic_vector(3 downto 0);
	sum 		: out std_logic_vector(3 downto 0)
	);
end unsigned_impl;	

architecture unsigned_impl_arch of unsigned_impl is
begin	
	sum <= std_logic_vector(unsigned(A) + unsigned(B));
end;

architecture signed_impl_arch of unsigned_impl is
begin	
	sum <= std_logic_vector(signed(A) + signed(B));
end;