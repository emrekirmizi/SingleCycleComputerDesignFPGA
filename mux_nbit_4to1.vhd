library ieee;
use ieee.std_logic_1164.all;

entity mux_nbit_4to1 is
	generic
	(
		bit_wide	:	integer	:=	4
	);
	port
	(
		S	:	in	std_logic_vector(1 downto 0);
		I0, I1, I2, I3	:	in	std_logic_vector(bit_wide downto 0);
		M	:	out std_logic_vector(bit_wide downto 0)
	);
end mux_nbit_4to1;

architecture Structure of mux_nbit_4to1 is
begin
	F:	for i	in 0 to bit_wide generate
			process(S)
			begin 
				case S is 
					when "00" => M(i)	<=	I0(i);
					when "01" => M(i)	<=	I1(i);
					when "10" => M(i)	<=	I2(i);
					when others => M(i)	<=I3(i);
				end case;
			end process;
		end generate;
end Structure;