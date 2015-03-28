library ieee;
use ieee.std_logic_1164.all;

entity mux_nbit_2to1 is
	generic
	(
		bit_wide	:	integer	:=	4
	);
	port
	(
		S	:	in	std_logic;
		I0, I1	:	in	std_logic_vector(bit_wide downto 0);
		M	:	out std_logic_vector(bit_wide downto 0)
	);
end mux_nbit_2to1;

architecture Structure of mux_nbit_2to1 is
begin
	F:	for i	in 0 to bit_wide generate
			process(S)
			begin 
				case S is 
					when '0' => M(i)	<=	I0(i);
					when others => M(i)	<=	I1(i);
				end case;
			end process;
		end generate;
end Structure;