library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;


entity multi_counter_test is

port(
	-- Input
	KEY		: in std_logic_vector(3 downto 0);
	SW			: in std_logic_vector(17 downto 16);
	--Output
	HEX0 		: out std_logic_vector(6 downto 0);
	LEDR 		: out std_logic_vector(0 downto 0)
);
end;

architecture arch of multi_counter_test is
signal count_s : std_logic_vector(3 downto 0);
begin
	u1: multi_counter(arch) port map(
		clk => KEY(0), mode => SW(17 downto 16), reset => KEY(3), count => count_s
	);
	u2: bin2sevenseg(bin2sevenseg_arch) port map(
		bin => count_s, sseg => HEX0
	);
end;