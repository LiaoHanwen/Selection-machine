--------------------------------------------------------------------------------
--disp_control
--
--input --input enable test lock
--		enable	0	dis
--				test	1	test signal
--						lock	1	keep signal
--								0	circulation
--  
--output disp[7 => 0]
--
--integration test 10.31
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--head

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

--head
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--entity

entity disp_control is
  port (
  	--in
	clock:in std_logic; 	--change with disp
	enable:in std_logic;
	test:in std_logic;
	lock:in std_logic;
	disp_in:in std_logic_vector(3 downto 0);

	--out
	disp:out std_logic_vector(3 downto 0)		--disp[7 => 0]
  ) ;
end entity ; -- disp_control

--entity
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--architecture

	architecture arch of disp_control is
	
		----------------------------------------------------------------------------
		--signal

		signal count:std_logic_vector(3 downto 0);	--for disp

		--signal
		----------------------------------------------------------------------------

	begin


		------------------------------------------------------------------------
		--processer

		processer : process( enable,test,lock,clock )
		begin
			if enable='0' then
				disp<="1110";
			else
				if test='1' then
					count<="1111";
				else
					if lock='0' then
						if clock'event and clock='1' then
							count<=disp_in;
						end if ;
					end if ;
				end if ;
				disp<=count;
			end if ;
		end process ; -- processer

		--processer
		------------------------------------------------------------------------

	end architecture ; -- arch

--architecture
--------------------------------------------------------------------------------