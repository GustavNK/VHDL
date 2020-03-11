library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity hex_mux is
port(
	bin 	: in std_logic_vector(11 downto 0);
	sel 	: in std_logic_vector(1 downto 0);
	tsseg	: out std_logic_vector(20 downto 0)
	);
end;

architecture hex_mux_arch of hex_mux is
signal   sseg	: std_logic_vector(20 downto 0);
constant On1	: std_logic_vector(20 downto 0)
	:= "111111110000000101011";
constant Err	: std_logic_vector(20 downto 0)
	:= "000011001011110101111";
constant dash	: std_logic_vector(20 downto 0)
	:= "011111101111110111111";

begin
	sseg1: entity bin2sevenseg (bin2sevenseg_arch) port map
	(bin => bin(3 downto 0), sseg => sseg(6 downto 0));
	sseg2: entity bin2sevenseg (bin2sevenseg_arch) port map
	(bin => bin(7 downto 4), sseg => sseg(13 downto 7));
	sseg3: entity bin2sevenseg (bin2sevenseg_arch) port map
	(bin => bin(11 downto 8), sseg => sseg(20 downto 14));
	
	tsseg <= On1 	when sel = "11" else
				Err 	when sel = "01" else
				sseg 	when sel = "10" else dash;
end;