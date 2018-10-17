--------------------------------------------------------------------------------
--test_control
--
--input sw7 btn7
--
--output test enable
--
--sw7 for switch
--btn7 for reset
--complete for finish twinkle
--
--test: test=1 & send 3 pulses enable
--then keep enable=1
--
--complete:send 3 pulses enable
--
--integration test 10.31
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--head

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

--head
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--entity

	entity test_control is
	  port (
	  	--in
		clock:in std_logic;		--0.25s  4Hz
		sw7:in std_logic;		--switch
		btn7:in std_logic;		--reset
		complete:in std_logic;	--connect to the lase lock

		--out
		enable:out std_logic;
		test:out std_logic;		--test enable
		sw:out std_logic
	  ) ;
	end entity ; -- test_control

--entity
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--architecture

	architecture arch of test_control is
		
		------------------------------------------------------------------------
		--signal
		signal btn7_re:std_logic;
		signal self_test_re:std_logic;

		--counter
		signal count:integer range 0 to 12;
		signal count_for_complete:integer range 0 to 6;
		
		--complete_re
		signal complete_re:std_logic;
		
		--signal
		------------------------------------------------------------------------

	begin

		------------------------------------------------------------------------
		--processer

		processer : process( complete,clock,btn7,sw7 )
		begin
			if sw7='0' then
				enable<='0';
				count<=0;
				count_for_complete<=0;
				test<='0';
				btn7_re<='0';
				self_test_re<='0';
				sw<='0';
			elsif btn7='1' then
				enable<='0';
				count_for_complete<=0;
				btn7_re<='1';
				sw<='0';
			elsif clock'event and clock='1' then
				if self_test_re='0' then
					case (count) is
						when 0 => count<=1; enable<='1'; test<='1';
						when 1 => count<=2; enable<='1';
						when 2 => count<=3; enable<='0';
						when 3 => count<=4; enable<='0';
						when 4 => count<=5; enable<='1';
						when 5 => count<=6; enable<='1';
						when 6 => count<=7; enable<='0';
						when 7 => count<=8; enable<='0';
						when 8 => count<=9; enable<='1';
						when 9 => count<=10; enable<='1';
						when 10 => count<=11; enable<='0';
						when 11 => count<=12; enable<='0';test<='0';
						when others => self_test_re<='1'; sw<='1';
					end case;
				elsif btn7_re='0' then
					enable<='0';
				elsif complete='1' then
					case (count_for_complete) is
						when 0 => count_for_complete<=1; enable<='1';
						when 1 => count_for_complete<=2; enable<='0';
						when 2 => count_for_complete<=3; enable<='1';
						when 3 => count_for_complete<=4; enable<='0';
						when 4 => count_for_complete<=5; enable<='1';
						when 5 => count_for_complete<=6; enable<='0';
						when others => enable<='1';
					end case;
				else
					enable<='1';
					sw<='1';
				end if ;
			end if ;
		end process ; -- processer

		--processer
		------------------------------------------------------------------------


	end architecture ; -- arch

--architecture
--------------------------------------------------------------------------------
