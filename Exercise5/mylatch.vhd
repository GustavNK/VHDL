library ieee;
use ieee.std_logic_1164.all;

entity mylatch is
port(
	input 	: in std_logic_vector(7 downto 0); 
	set 		: in std_logic;
	secret_value : out std_logic_vector(7 downto 0)
	);
end;

architecture mylatch_arch of mylatch is
begin
	mylatch: process(input, set)
	begin
		if(set = '0') then --active low
			secret_value <= input;
		end if;
	end process mylatch;
end;