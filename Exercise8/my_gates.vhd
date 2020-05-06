library ieee;
use ieee.std_logic_1164.all;

package my_gates is
	signal a,b	: std_logic;
	signal and_out, or_out, xor_out	: std_logic;
	function my_xor(a, b	: std_logic) return std_logic;
	procedure my_and_or(a, b : in std_logic; signal and_out, or_out	: out std_logic);
end my_gates;

--entity my_gates is
--port(
--	a,b	: in std_logic;
--	and_out, or_out, xor_out	: out std_logic
--);
--end;

package body my_gates is
function my_xor(a, b	: std_logic) return std_logic is
variable result	: std_logic := '1';
begin
	result := a xor b;
	return result;
end my_xor;

procedure my_and_or(a, b : in std_logic; signal and_out, or_out	: out std_logic) is
begin
	and_out <= a and b;
	or_out <= a or b;
end my_and_or;

--begin
--	xor_out <= my_xor(a,b);
--	my_and_or(a, b, and_out, or_out);
end my_gates;
