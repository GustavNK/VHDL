library ieee;
use ieee.std_logic_1164.all;

entity reset_logic is
port(
	-- Input
	reset_in 	: in std_logic;
	hrs_bin1		: in std_logic;
	hrs_bin10	: in std_logic;
	--Output
	reset_out 	: out std_logic
);
end;

architecture arch of reset_logic is
begin
	process(reset_in, hrs_bin1, hrs_bin10)
	begin
		if reset_in = '0' OR (hrs_bin1 = '1' AND hrs_bin10 = '1') then	
			reset_out <= '0';
		else
			reset_out <= '1';
		end if;
	end process;
end;