--------------------------------------------------------------------------------
--matrix_control
--
--input enable test lock
--		enable	0	dis
--				test	1	test signal
--						lock	1	keep signal
--								0	circulation
--
--output content
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

entity matrix_control is
  port (
  	--in
	clock:in std_logic;		--clock 0.5s 2Hz
	enable:in std_logic;
	test:in std_logic;
	lock:in std_logic;

	--out
	content:out std_logic_vector(6 downto 0);
	lock_signal:out std_logic 	--lock_feedback
  ) ;
end entity ; -- matrix_control

--entity
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--architecture

	architecture arch of matrix_control is
		
		------------------------------------------------------------------------
		--signal

		--counter
		signal count:integer range 0 to 127;	--for content
		
		--signal
		------------------------------------------------------------------------

	begin

		------------------------------------------------------------------------
		--processer

		processer : process( enable,test,lock,clock )
		begin
			if enable='0' then
				content<="0000000";
				lock_signal<='0';
			else
				if test='1' then
					count<=120;
				else
					if lock='0' then
						if count=120 then
							count<=8;
						elsif count=104 then
							count<=8;
						elsif clock'event and clock='1' then
							count<=count+1;
						end if ;
					elsif count rem 16=0 then
						lock_signal<='1';
					end if ;
				end if ;
				content<=conv_std_logic_vector(count,7);
			end if ;
		end process ; -- processer

		--processer
		------------------------------------------------------------------------
	
	end architecture ; -- arch

--architecture
--------------------------------------------------------------------------------