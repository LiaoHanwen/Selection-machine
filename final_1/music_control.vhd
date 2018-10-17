--------------------------------------------------------------------------------
--music control
--
--input clock enable
--output control
--keep control=1 when play music
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

entity music_control is
  port (
	--in
	clock:in std_logic;	--2Hz
	enable:in std_logic;

	--out
	control:out std_logic:='0'
  ) ;
end entity ; -- music_control

--entity
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--architecture

architecture behave of music_control is                       
begin

	----------------------------------------------------------------------------
	--processer

	processer : process( clock,enable )
	variable counter: integer range 0 to 63:=0;
	begin
		if enable = '1' then
			if clock'event and clock='1' then
				counter :=counter +1;
				if counter < 64 then
					control <= '1';
				else
				    control <='0';
				end if;
			end if;
		end if;
	end process ; -- processer

	--processer
	----------------------------------------------------------------------------
	end behave;

--architecture
--------------------------------------------------------------------------------