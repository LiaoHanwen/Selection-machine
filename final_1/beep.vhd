--------------------------------------------------------------------------------
--beep
--
--input clock control keep button
--output beep
--play music or button music
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

entity beep is
  port (
  	--in
  	clock : in std_logic;
	control :in std_logic;
    key: in integer range 0 to 2047;
    button:in std_logic;

    --out
    beep : out std_logic
  );
end beep;

--entity
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--architecture

architecture behave of beep is
	signal st2: std_logic;
	signal key_tmp:integer range 0 to 2047;
begin
	p1:process(clock,key)
		variable count1: integer range 0 to 2047;	
	begin
		if control='1' then
			if button='1' then
				key_tmp<=214;
			else
				key_tmp<=key;
			end if ;
			if clock'event and clock='1' then
				if count1<key_tmp then
					count1:= count1+1;
					st2 <= '1'; 
				else 
					count1:=0;
					st2<='0';
				end if;
			end if;
		else
			st2<='0';
		end if;
	end process p1;
	
	
	p2: process(st2)
		variable count2:std_logic:= '0';
	begin
		if control='1' then
			if st2'event and st2 = '1' then
				count2 := not count2;
				if count2 = '1'then
					beep<='1';
				else
					beep<='0';
				end if;
			end if;
		else
			beep<='0';
		end if;
	end process p2;
end behave;

--architecture
--------------------------------------------------------------------------------