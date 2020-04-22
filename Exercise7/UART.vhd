library ieee;
use ieee.std_logic_1164.all;

entity UART is
port(
	--input
	reset, clk, rxd, txvalid	: in std_logic;
	txdata							: in std_logic_vector(7 downto 0);
	txd, rxvalid					: out std_logic;
	rxdata							: out std_logic_vector(7 downto 0)
);
end;