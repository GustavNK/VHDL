library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity UART_tester is
port(
	--input
	KEY		: in std_logic_vector(2 downto 0);
	SW			: in std_logic_vector(7 downto 0);
	CLOCK_50	: in std_logic;
	--output
	LEDR		: out std_logic_vector(9 downto 0)
);
end;

architecture arch of UART_tester is 
begin
	u1: entity UART(arch) port map (
	reset => KEY(0), rxd => KEY(1), txvalid => KEY(2),
	txdata => SW,
	clk => CLOCK_50,
	rxdata => LEDR(7 downto 0), rxvalid => LEDR(8), txd => LEDR(9)
	);
end;
