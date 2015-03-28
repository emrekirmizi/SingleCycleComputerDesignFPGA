library ieee;
use ieee.std_logic_1164.all;

package aritmetic_operations is
	function	full_adder	
	(
		signal	A, B, Cin	:	in	std_logic;
		signal	Cout			:	out std_logic
	)
	return	std_logic;
	
		function	full_subtractor	
	(
		signal	A, B, Bin	:	in	std_logic;
		signal	Bout			:	out std_logic
	)
	return	std_logic;
	
	function parallel_adder
	(
		signal	X,Y	:	in	std_logic_vector;
		signal	Cin	:	in	std_logic;
		signal	Cout	:	out std_logic
	)
	return	std_logic_vector;
end aritmetic_operations;

package body aritmetic_operations is
	function	full_adder	
	(
		signal	A, B, Cin	:	in	std_logic;
		signal	Cout			:	out std_logic
	)
	return	std_logic is
	variable Sum	:	std_logic;
	begin
		Sum	:=	(A xor B) xor Cin;
		Cout	:=	((A xor B) and Cin) or (not(A xor B) and B);
		return Sum;
	end full_adder;
	
	function	full_subtractor	
	(
		signal	A, B, Bin	:	in	std_logic;
		signal	Bout			:	out std_logic
	)
	return	std_logic is
	variable Dif	:	std_logic;
	begin
		Dif	:=	(A xor B) xor Bin;
		Bout	:=	(not(A) and B) or (not(A) and Bin) or (B and Bin);
		return Dif;
	end full_subtractor;
		
	function parallel_adder
	(
		signal	X, Y	:	in	std_logic_vector;
		signal	Cin	:	in	std_logic;
		signal	Cout	:	out std_logic
	)
	return	std_logic_vector is
	variable Sum,	C:	std_logic_vector(X'range);
	begin
			C(0)	:=	Cin;
		for i in X'range loop
			Sum(i)	:=	full_adder(X,Y,C(i),C(i+1));
			Cout	:=	C(i+1);
		end loop;
		return Sum;
	end parallel_adder;
	
	function parallel_subtractor
	(
		signal	X, Y	:	in	std_logic_vector;
		signal	Bin	:	in	std_logic;
		signal	Bout	:	out std_logic
	)
	return	std_logic_vector is
	variable Dif,	B:	std_logic_vector(X'range);
	begin
			C(0)	:=	Bin;
		for i in X'range loop
			Dif(i)	:=	full_subtractor(X,Y,B(i),B(i+1));
			Bout	:=	B(i+1);
		end loop;
		return Dif;
	end parallel_subtractor;
end aritmetic_operations;