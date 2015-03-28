library ieee;
use ieee.std_logic_1164.all;

entity shifter is
	generic
	(
		bit_wide	:	integer	:=	4
	);
	port
	(
		S	:	in	std_logic_vector(1 downto 0);
		B	:	in	std_logic_vector(bit_wide downto 0);
		H	:	out	std_logic_vector(bit_wide downto 0)
	);
end shifter;

architecture Structure of shifter is
	signal Ir, Il,	:	std_logic;
begin
	Ir	<=	'0';
	Il	<=	'0';
	F:	for i	in 0 to bit_wide generate
			process(i)
			begin 
				case i is 
					when '0' => H(i)	<=	mux_nbit_4to1(S,B(i),B(i+1),Il,B(i));
					when B'range => H(i)	<=	mux_nbit_4to1(S,B(i),Ir,B(i-1),B(i));
					when others => H(i)	<=	mux_nbit_4to1(S,B(i),B(i+1),B(i-1),B(i));
				end case;
			end process;
		end generate;
end Structure;