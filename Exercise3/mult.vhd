library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mult is
	port (
		A, B : in std_logic_vector(127 downto 0);
		Prod : out std_logic_vector(255 downto 0)
		);
end;

architecture mult_arch of mult is
begin
	prod <= std_logic_vector(unsigned(A) * unsigned(B));
end;