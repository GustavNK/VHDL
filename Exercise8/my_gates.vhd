library ieee;
use ieee.std_logic_1164.all;

package my_gates is
	--Function declaration
	function my_xor(
		a, b		: std_logic) 
		return std_logic;
	--Procedure declaration
	procedure my_and_or(
		a, b 		: in std_logic; 
		signal and_out, or_out	
					: out std_logic);
end my_gates;

package body my_gates is
function my_xor(
	a, b	: std_logic) return std_logic is
variable result : std_logic := '1';
begin
	result := a xor b;
	return result;
end my_xor;

procedure my_and_or(
	a, b 	: in std_logic; 
	signal and_out, or_out	
			: out std_logic) is
begin
	and_out <= a and b;
	or_out <= a or b;
end my_and_or;

end my_gates;
