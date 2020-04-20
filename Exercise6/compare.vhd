library ieee;
use ieee.std_logic_1164.all;

entity compare is
port(
	-- Input
	tm_watch, tm_alarm
				: in std_logic_vector(15 downto 0);
	--Output
	alarm 	: out std_logic
);
end;

architecture arch of compare is
begin
	process(tm_watch, tm_alarm)
	begin
		if tm_watch = tm_alarm then
			alarm <= '1';
		else
			alarm <= '0';
		end if;
	end process;
end;