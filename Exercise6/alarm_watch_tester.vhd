library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity alarm_watch_tester is
port(
	-- Input
	KEY 		: in std_logic_vector(3 downto 0);
	CLOCK_50	: in std_logic;
	SW			: in std_logic_vector(15 downto 0);
	--Output
	HEX2, HEX3, HEX4, HEX5, HEX6, HEX7 	
				: out std_logic_vector(6 downto 0);
	LEDR		: out std_logic_vector(0 downto 0)
);
end;

architecture arch of alarm_watch_tester is
begin
	u1: alarm_watch(arch) port map(
		clock => CLOCK_50,
		switch => SW,
		key0 => KEY(0),
		sel => KEY(2),
		key3 => KEY(3),
		led => LEDR(0),
		display(6 downto 0) => HEX2,
		display(13 downto 7) => HEX3,
		display(20 downto 14) => HEX4,
		display(27 downto 21) => HEX5,
		display(34 downto 28) => HEX6,
		display(41 downto 35) => HEX7
	);
end;