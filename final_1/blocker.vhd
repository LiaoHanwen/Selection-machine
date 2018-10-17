--------------------------------------------------------------------------------
--blocker
--
--input enable btn
--		set lock=1 when enable=1 and btn=1
--
--output lock
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

entity blocker is
  port (
  	--in
	enable:in std_logic;
	btn:in std_logic;

	--out
	lock:out std_logic
  ) ;
end entity ; -- blocker

--entity
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--architecture

architecture arch of blocker is

begin

	----------------------------------------------------------------------------
	--processer

	processer : process( enable,btn )
	begin
		if enable='0' then
			lock<='0';
		elsif btn='1' then
			lock<='1';
		end if ;
	end process ; -- processer

	--processer
	----------------------------------------------------------------------------

end architecture ; -- arch

--architecture
--------------------------------------------------------------------------------