library ieee;
use ieee.std_logic_1164.all;
use work.mux.all;

package logic_unit is
	function	logic_unit	
	(
		signal	S	:	in	std_logic_vector(1 downto 0);
		signal	A, B	:	in	std_logic_vector
	)
	return	std_logic_vector;
end logic_unit;

package body logic_unit is
	function	logic_unit	
	(
		signal	S	:	in	std_logic_vector(1 downto 0);
		signal	A, B	:	in	std_logic_vector
	)
	return	std_logic_vector is
	variable G	:	std_logic_vector(A'range);
	begin
		G	:=	mux_nbit_4to1(S,(A and B),(A or B),(A xor B),not(A));
		return G;
	end logic_unit;
end logic_unit;