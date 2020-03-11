library ieee;
use ieee.std_logic_1164.all;


entity truth_table is
port(
	a, b, c 	: in std_logic;
	x 			: out std_logic
	);
end;

architecture truth_table_arch of truth_table is

subtype table is std_logic_vector(2 downto 0);
type t_table is array (0 to 7) of table;
constant step_table : t_table := (
	"000", "001", "010", "011", 
	"100", "101", "110", "111" );
begin

end;
