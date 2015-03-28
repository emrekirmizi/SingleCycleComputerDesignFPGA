library ieee;
use ieee.std_logic_1164.all;
use work.B_input_logic.all;
use work.aritmetic_operations.all;

package aritmetic_unit is
	function	aritmetic_unit	
	(
		signal	S	:	in	std_logic_vector(1 to 0);
		signal	A, B	:	in	std_logic_vector;
		signal	Cin	:	in	std_logic
	)
	return	std_logic_vector;
	return	std_logic;
end aritmetic_unit;

package body aritmetic_unit is
	function	aritmetic_unit	
	(
		signal	S	:	in	std_logic_vector(1 to 0);
		signal	A, B	:	in	std_logic_vector;
		signal	Cin	:	in	std_logic;
		signal	Cout	:	out std_logic
	)
	return	std_logic_vector is
	variable G,	X, Y	:	std_logic_vector(A'range);
	begin
		X	:=	A;
		Y	:=	B_input_logic(S,B);
		G	:=	parallel_adder(X,Y,Cin,Cout);
		return G;
		return Cout;
	end aritmetic_unit;
end aritmetic_unit;