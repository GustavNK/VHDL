library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity alarm_watch is
generic(
	b2s_zero : std_logic_vector(6 downto 0) := "0000000"
);
port(
	-- Input
	switch			: in std_logic_vector(15 downto 0);
	sel, clock, key0, key3				
						: in std_logic;
	--Output
	display
						: out std_logic_vector(41 downto 0);
	led				: out std_logic
);
end;

architecture arch of alarm_watch is
signal bin : std_logic_vector(15 downto 0);
signal alarm_s, watch_s	: std_logic_vector(41 downto 0);
signal tm_s : std_logic_vector(15 downto 0);
begin
	input: input_limiter(arch) port map(
		bin_min1 => switch(3 downto 0),
		bin_min10 => switch(7 downto 4),
		bin_hrs1 => switch(11 downto 8),
		bin_hrs10 => switch(15 downto 12),
		time_alarm => bin
	);
	
	--b2s for the alarm
	alarm_s(6 downto 0) <= b2s_zero;
	alarm_s(13 downto 7) <= b2s_zero;
	b2s_m1: bin2sevenseg(bin2sevenseg_arch) port map(
		bin => bin(3 downto 0),
		sseg => alarm_s(20 downto 14)
	);
	b2s_m10: bin2sevenseg(bin2sevenseg_arch) port map(
		bin => bin(7 downto 4),
		sseg => alarm_s(27 downto 21)
	);
	b2s_h1: bin2sevenseg(bin2sevenseg_arch) port map(
		bin => bin(11 downto 8),
		sseg => alarm_s(34 downto 28)
	);
	b2s_h10: bin2sevenseg(bin2sevenseg_arch) port map(
		bin => bin(15 downto 12),
		sseg => alarm_s(41 downto 35)
	);
	--Watch setup
	w1: watch(arch) port map(
		clk => clock,
		speed => key0,
		reset => key3,
		sec_1 => watch_s(6 downto 0),
		sec_10 => watch_s(13 downto 7),
		min_1 => watch_s(20 downto 14),
		min_10 => watch_s(27 downto 21),
		hrs_1 => watch_s(34 downto 28),
		hrs_10 => watch_s(41 downto 35),
		tm => tm_s
	);
	
	--Compare logic
	comp: compare(arch) port map(
		tm_watch => tm_s,
		tm_alarm => bin,
		alarm => led
	);
	
	--MUX
	with sel select
		display <= 	watch_s when '1',
						alarm_s when '0';
end;