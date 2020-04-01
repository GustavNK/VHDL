library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clock_gen is
generic(
	CLK_1_SEC 	: natural := (50000000/2);
	CLK_5_MSEC	: natural := (250000/2);
	MIN_CLK_VAL	: natural := 0;
	MAX_CLK_VAL	: natural := 50000000
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
signal clk_signal : integer range MIN_CLK_VAL to MAX_CLK_VAL;
signal clear		: std_logic;
begin
	counting : process(clk, reset)
	variable clk_counter : integer range MIN_CLK_VAL to MAX_CLK_VAL;
	begin
		if reset = '0' or clear = '1' then
			clk_counter := 0;
		elsif rising_edge(clk) then
			clk_counter := clk_counter + 1;
		end if;
	
		clk_signal <= clk_counter;
	end process counting;
	
	choice : process(speed, clk_signal)
	variable clk_out_signal : std_logic;
	begin
		if speed = '1' and clk_signal = CLK_1_SEC then
			clk_out_signal := clk_out_signal xor '1';
			clear <= '1';
		elsif speed = '0' and clk_signal = CLK_5_MSEC then
			clk_out_signal := clk_out_signal xor '1';
			clear <= '1';
		else
			clear <= '0';
		end if;
		clk_out <= clk_out_signal;
	end process choice;
	
end;