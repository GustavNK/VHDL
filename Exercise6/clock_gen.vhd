library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clock_gen is
generic(
	CLK_1_SEC : natural 50000000;
);

port(
	-- Input
	clk 		: in std_logic;
	speed 	: in std_logic;
	reset 	: in std_logic;
	--Output
	clk_out 	: out std_logic
);
end;

architecture arch of clock_gen is

begin
	clk 
end;