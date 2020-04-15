library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;


entity watch is

port(
	-- Input
	clk 		: in std_logic;
	speed		: in std_logic;
	reset		: in std_logic;
	--Output
	sec_1, sec_10, min_1, min_10, hrs_1, hrs_10
				: out std_logic_vector(6 downto 0);
	tm 		: out std_logic_vector(15 downto 0)
);
end;

architecture arch of watch is
signal clk_s 	: std_logic;
signal cout_s_1, cout_s_10, cout_m_1, cout_m_10, cout_h_1,cout_h_10
					: std_logic;
signal count_s_1,count_s_10, count_m_1, count_m_10, count_h_1, count_h_10
					: std_logic_vector(3 downto 0);
begin
	clk1: clock_gen(arch) port map(
		clk => clk, 
		speed => speed, 
		reset => reset, 
		clk_out =>clk_s
	);
	
	--Multi counter
	s1: multi_counter(arch) port map(
		clk => clk_s,
		mode => "00",
		reset => reset,
		count => count_s_1,
		cout => cout_s_1
	);
	s10: multi_counter(arch) port map(
		clk => cout_s_1,
		mode => "01",
		reset => reset,
		count => count_s_10,
		cout => cout_s_10
	);
	m1: multi_counter(arch) port map(
		clk => cout_s_10,
		mode => "00",
		reset => reset,
		count => count_m_1,
		cout => cout_m_1
	);
	m10: multi_counter(arch) port map(
		clk => cout_m_1,
		mode => "01",
		reset => reset,
		count => count_m_10,
		cout => cout_m_10
	);
	h1: multi_counter(arch) port map(
		clk => cout_m_10,
		mode => "00",
		reset => reset,
		count => count_h_1,
		cout => cout_h_1
	);
	h10: multi_counter(arch) port map(
		clk => cout_h_1,
		mode => "11",
		reset => reset,
		count => count_h_10,
		cout => open
	);
	
	-- Binary to seven segment
	b2s_s1: bin2sevenseg(bin2sevenseg_arch) port map(
		bin => count_s_1,
		sseg => sec_1
	);
	b2s_s10: bin2sevenseg(bin2sevenseg_arch) port map(
		bin => count_s_10,
		sseg => sec_10
	);
	b2s_m1: bin2sevenseg(bin2sevenseg_arch) port map(
		bin => count_m_1,
		sseg => min_1
	);
	b2s_m10: bin2sevenseg(bin2sevenseg_arch) port map(
		bin => count_m_10,
		sseg => min_10
	);
	b2s_h1: bin2sevenseg(bin2sevenseg_arch) port map(
		bin => count_h_1,
		sseg => hrs_1
	);
	u3: bin2sevenseg(bin2sevenseg_arch) port map(
		bin => count_h_10,
		sseg => hrs_10
	);
end;