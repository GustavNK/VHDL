library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shift_div is
	port (
		a : in std_logic_vector(7 downto 0);
		a_shl, a_shr, a_ror: out std_logic_vector(7 downto 0)
		);
end;

architecture shift_div_arch of shift_div is
signal a_shl_signal : std_logic_vector(8 downto 0);
signal a_shr_signal : std_logic_vector(9 downto 0);
begin
	a_shl_signal <= a & "0";
	a_shl <= a_shl_signal(7 downto 0);
	
	a_shr_signal <= "00" & a;
	a_shr <= a_shr_signal(9 downto 2);
	
	a_ror <= a(2 downto 0) & a(7 downto 3);
end;