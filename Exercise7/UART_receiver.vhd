library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity UART_receiver is
port(
	--input
	reset, rxd, clk_baud	: in std_logic;
	--output
	rxdata					: out std_logic_vector(7 downto 0);
	rxvalid					: out std_logic
);
end;

architecture arch of UART_receiver is
type state is (idle, reading, stopping, latch_data);
signal next_state, present_state
				: state;
begin
	state_reg: process(clk_baud, reset)
	begin
		if reset = '0' then
			present_state <= idle;
		elsif rising_edge(clk_baud) then
			present_state <= next_state;
		end if;
	end process;
	
	nxt_state: process(present_state, rxd)
	variable bit_cnt	: integer range 0 to 8;
	begin
	next_state <= present_state; --default
	case present_state is
		when idle => 
			if rxd = '0' then
				next_state <= reading;
				bit_cnt := 0;
			end if;
		when reading =>
			bit_cnt := bit_cnt + 1;
			if bit_cnt > 7 then
				next_state <= stopping;
			end if;
		when stopping =>
			if rxd = '1' then
				next_state <= latch_data;
			else
				next_state <= idle;
			end if;
		when latch_data =>
			next_state <= idle;
		when others =>
			null;
	end case;
	end process;
	
--	moore_out: process(present_state)
--	variable latch	: std_logic_vector(7 downto 0);
--	begin
--	case present_state is
--		when reading =>
--			latch := rxd & latch(7 downto 1);
--		when latch_data =>
--			rxdata <= latch;
--			rxvalid <= '1';
--		when idle =>
--			rxvalid <= '0';
--		when others =>
--			null;
--	end case;
--	end process;
end;
