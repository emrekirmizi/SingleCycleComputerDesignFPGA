library ieee;
use ieee.std_logic_1164.all;

package mux is
	function	mux_nbit_2to1	
	(
		signal	S	:	in	std_logic;
		signal	I0, I1	:	in	std_logic_vector
	)
	return	std_logic_vector
	
	function	mux_nbit_4to1	
	(
		signal	S	:	in	std_logic_vector(1 downto 0);
		signal	I0, I1, I2, I3	:	in	std_logic_vector
	)
	return	std_logic_vector
end mux;

package body mux is
	function	mux_nbit_2to1	
	(
		signal	S	:	in	std_logic;
		signal	I0, I1	:	in	std_logic_vector
	)
	return	std_logic_vector is
	variable M	:	std_logic_vector(I0'range);
	begin
		for i	in I0'range loop
			process(S)
			begin 
				case S is 
					when "0" => M(i)	<=	I0(i);
					when others => M(i)	<=	I1(i);
				end case;
			end process;
		end loop;
		return M;
	end mux_nbit_2to1;
	
	function	mux_nbit_4to1	
	(
		signal	S	:	in	std_logic_vector(1 downto 0);
		signal	I0, I1, I2, I3	:	in	std_logic_vector
	)
	return	std_logic_vector is
	variable M	:	std_logic_vector(I0'range);
	begin
		for i	in I0'range loop
			process(S)
			begin 
				case S is 
					when "00" => M(i)	<=	I0(i);
					when "01" => M(i)	<=	I1(i);
					when "10" => M(i)	<=	I2(i);
					when others => M(i)	<=I3(i);
				end case;
			end process;
		end loop;
		return M;
	end mux_nbit_4to1;
end mux;