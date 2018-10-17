--------------------------------------------------------------------------------
--disp_control2
--
--for disp[7 => 5]
--
----input --input enable test lock
--		enable	0	dis
--				test	1	test signal
--						0	dis
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

entity disp_control2 is
  port (
	--in
	enable:in std_logic;
	test:in std_logic;

	--out
	disp:out std_logic_vector(3 downto 0)		--disp[7 => 0]
  ) ;
end entity ; -- disp_control2

--entity
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--architecture

architecture arch of disp_control2 is

begin
	
	----------------------------------------------------------------------------
	--processer

	processer : process( enable,test )
	begin
		if enable='0' then
			disp<="1110";
		else
			if test='1' then
				disp<="1111";
			else
				disp<="1110";
			end if ;
		end if ;
	end process ; -- processer

	--processer
	----------------------------------------------------------------------------


end architecture ; -- arch

--architecture
--------------------------------------------------------------------------------