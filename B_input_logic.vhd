library ieee;
use ieee.std_logic_1164.all;
use work.mux.all;

package B_input_logic is
	function	B_input_logic	
	(
		signal	S	:	in	std_logic_vector(1 downto 0);
		signal	B	:	in	std_logic_vector
	)
	return	std_logic_vector;
end B_input_logic;

package body B_input_logic is
	function	B_input_logic	
	(
		signal	S	:	in	std_logic_vector(1 downto 0);
		signal	B	:	in	std_logic_vector
	)
	return	std_logic_vector is
	variable M	:	std_logic_vector(B'range);
	begin
		for i	in B'range loop
			M(i)	:=	mux_nbit_2to1(S,B(i),not(B(i)));
		end loop;
		return M;
	end B_input_logic;
end B_input_logic;