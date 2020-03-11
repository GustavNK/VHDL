library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity bi_port_test is 
port(
	KEY    : in    std_logic_vector(3 downto 2);
	SW     : in    std_logic_vector(0 downto 0);
	LEDR   : out   std_logic_vector(1 downto 0);
	GPIO_1 : inout std_logic_vector(1 downto 0)
	);
end;

architecture bi_port_test_arch of bi_port_test is
begin
u1 : entity bi_port (bi_port_arch)
port map(
	key3 => KEY(3),
	key2 => KEY(2),
	sw0	=> SW(0),
	led0	=> LEDR(0),
	led1	=> LEDR(1),
	gpio0	=> GPIO_1(0),
	gpio1	=> GPIO_1(1)
);
end;