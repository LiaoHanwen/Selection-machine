--------------------------------------------------------------------------------
--blocker2
--
--input enable btn
--		set lock=1 when enable=1 and btn=1
--		keep lock=1 when enable=1 and lock_signal=1
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

entity blocker2 is
  port (
  	--in
	enable:in std_logic;
	btn:in std_logic;
	lock_signal:in std_logic;

	--out
	lock:out std_logic
  ) ;
end entity ; -- blocker2

--entity
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--architecture

architecture arch of blocker2 is

	----------------------------------------------------------------------------
	--signal

	signal lock_flag:std_logic;
	
	--signal
	----------------------------------------------------------------------------

begin

	----------------------------------------------------------------------------
	--processer

	processer : process( enable,btn,lock_signal )
	begin
		if enable='0' then
			lock<='0';
			lock_flag<='0';
		elsif lock_signal='1' then
			lock<='1';
			lock_flag<='1';
		elsif lock_flag='1' then
			lock<='1';
		elsif btn='1' then
			lock<='1';
		else
			lock<='0';
		end if ;
	end process ; -- processer

	--processer
	----------------------------------------------------------------------------

end architecture ; -- arch

--architecture
--------------------------------------------------------------------------------