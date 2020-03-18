library ieee;
use ieee.std_logic_1164.all;

entity bin2hex is
port(
	bin	: in std_logic_vector(3 downto 0);
	seg	: out std_logic_vector(6 downto 0)
);
end;

architecture bin2hex_arch of bin2hex is
begin
	bin <= '1';
end;