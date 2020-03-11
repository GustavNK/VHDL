library ieee;
use ieee.std_logic_1164.all;

entity bi_port is
	port(
	key3, key2	: in std_logic;
	led1, led0	: out std_logic;
	sw0			: in std_logic;
	gpio1, gpio0: inout std_logic
	);
end;

architecture bi_port_arch of bi_port is
begin
	with sw0 select
	led0 <= 	not key3 when '1',
				gpio0 when '0',
				'0' when others;
	gpio0 <= not key3 when sw0 = '1' else 'Z';
	
	with not sw0 select	led1 <= not key2 when '1',
				gpio1 when '0',
				'0' when others;
	gpio1 <= not key2 when not sw0 = '1' else 'Z';
	
end;