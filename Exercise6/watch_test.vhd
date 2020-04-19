library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity watch_test is
port(
	-- Input
	KEY 		: in std_logic_vector(3 downto 0);
	CLOCK_50	: in std_logic;
	--Output
	HEX2, HEX3, HEX4, HEX5, HEX6, HEX7 	
				: out std_logic_vector(6 downto 0);
	LEDR		: out std_logic_vector(0 downto 0)
);
end;

architecture arch of watch_test is
begin
	u1: watch(arch) port map(
	clk => CLOCK_50,
	speed => KEY(0),
	reset => KEY(3),
	sec_1 => HEX2,
	sec_10 => HEX3,
	min_1 => HEX4,
	min_10 => HEX5,
	hrs_1 => HEX6,
	hrs_10 => HEX7,
	tm => open
	);
end;