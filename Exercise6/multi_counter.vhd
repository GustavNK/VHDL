library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multi_counter is
generic(
	MIN_VAL : natural := 0;
	MAX_VAL : natural := 15
);
port(
	-- Input
	clk 		: in std_logic;
	reset 	: in std_logic;
	mode 		: in std_logic_vector(1 downto 0);
	--Output
	count 	: out std_logic_vector(3 downto 0);
	cout 		: out std_logic
);
end;

architecture arch of multi_counter is
--signals
signal clear : std_logic;
signal count_val : integer range MIN_VAL to MAX_VAL;

begin
	counter: process(clk, reset, clear)
		variable cnt : integer range MIN_VAL to MAX_VAL;
	begin
		if reset = '0' or clear = '1' then
			cnt := 0;
		elsif rising_edge(clk) then
			cnt := cnt + 1; 
		end if;
		
		count_val <= cnt;
		count <= std_logic_vector(to_unsigned(cnt, count'length));
	end process counter;
	
	mux: process(mode, count_val)
	begin
		if mode = "00" and count_val > 9 then
			clear <= '1';
		elsif mode = "01" and count_val > 5 then
			clear <= '1';
		elsif (mode = "10" or mode = "11") and count_val > 2 then
			clear <= '1';
		else
			clear <= '0';
		end if;
	end process mux;
	
	cout_proc: process(count_val)
	begin
		if count_val = 0 then
			cout <= '1';
		else
			cout <= '0';
		end if;
	end process cout_proc;
end;