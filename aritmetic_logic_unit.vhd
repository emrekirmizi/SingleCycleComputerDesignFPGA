library ieee;
use ieee.std_logic_1164.all;
use work.mux.all;

package aritmetic_logic_unit is
	function	aritmetic_logic_unit	
	(
		signal	S	:	in	std_logic_vector(3 downto 0);
		signal	A, B	:	in	std_logic_vector;
		signal	Cout	:	in	std_logic
	)
	return	std_logic_vector;
end aritmetic_logic_unit;

package body aritmetic_logic_unit is
	function	aritmetic_logic_unit	
	(
		signal	S	:	in	std_logic_vector(3 downto 0);
		signal	A, B	:	in	std_logic_vector;
		signal	Cout	:	in	std_logic
	)
	return	std_logic_vector is
	variable G	:	std_logic_vector(A'range);
	variable Cin	:	std_logic;
	begin
		Cin	:=	S(0);
		G	:=	mux_nbit_2to1(S(3),aritmetic_unit(S(2 downto 1),A,B,Cin,Cout),logic_unit(S(1 downto 0),A,B));
		return G;
	end aritmetic_logic_unit;
end aritmetic_logic_unit;