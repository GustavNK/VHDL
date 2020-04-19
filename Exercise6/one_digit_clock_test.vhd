library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity one_digit_clock_test is
port(
	-- Input
	CLOCK_50 : in std_logic;
	KEY		: in std_logic_vector(3 downto 0);
	SW 		: in std_logic_vector(17 downto 16);
	--Output
	HEX0		: out std_logic_vector(6 downto 0);
	LEDR		: out std_logic_vector(0 downto 0)
);
end;

architecture arch of one_digit_clock_test is
--signals
signal clk_s 		: std_logic;
signal count_s 	: std_logic_vector(3 downto 0);

begin
	u1: clock_gen(arch) port map(
		clk => CLOCK_50, 
		speed => KEY(0), 
		reset => KEY(3), 
		clk_out =>clk_s
	);
	
	u2: multi_counter(arch) port map(
		clk => clk_s,
		mode => SW,
		reset => KEY(3),
		count => count_s,
		cout => LEDR(0)
	);
	
	u3: bin2sevenseg(bin2sevenseg_arch) port map(
		bin => count_s,
		sseg => HEX0
	);
end;