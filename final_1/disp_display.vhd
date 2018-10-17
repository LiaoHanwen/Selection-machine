--------------------------------------------------------------------------------
--disp_display
--
--input clock disp[7]
--disp:	all	1111
--		dis	1110
--		9	1001
--		.	.
--		.	.
--		0	0000
--
--output disp cat
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

entity disp_display is
  port (
  	--in
	clock:in std_logic;		--0.005s  200Hz
	disp7:in std_logic_vector(3 downto 0);	--disp
	disp6:in std_logic_vector(3 downto 0);	--disp
	disp5:in std_logic_vector(3 downto 0);	--disp
	disp4:in std_logic_vector(3 downto 0);	--disp
	disp3:in std_logic_vector(3 downto 0);	--disp
	disp2:in std_logic_vector(3 downto 0);	--disp
	disp1:in std_logic_vector(3 downto 0);	--disp
	disp0:in std_logic_vector(3 downto 0);	--disp

	--out
	disp:out std_logic_vector(6 downto 0);  --a downto g
	--cat low level effective
	cat:out std_logic_vector(7 downto 0)	--cat7 downto cat0
  ) ;
end entity ; -- disp_display

--entity
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- architecture

	architecture arch of disp_display is
		
		------------------------------------------------------------------------
		--signal

		--table  all downto 0
		type table_type is array(15 downto 0) of std_logic_vector(6 downto 0);
		constant table : table_type := 
		(
			"1111111",	--all	1111
			"0000000",	--dis 	1110
			"0000000",	--dis 	1101
			"0000000",	--dis 	1100
			"0000000",	--dis 	1011
			"0000000",	--dis 	1010
			"1111011",	--9 	1001
			"1111111",	--8 	1000
			"1110000",	--7 	0111
			"1011111",	--6		0110
			"1011011",	--5		0101
			"0110011",	--4		0100
			"1111001",	--3		0011
			"1101101",	--2		0010
			"0110000",	--1		0001
			"1111110"	--0		0000
		); 

		--counter for cat
		signal count:integer range 0 to 7;

		--signal
		------------------------------------------------------------------------
	
	begin

		------------------------------------------------------------------------
		--counter

		counter : process( clock )
		begin
			if clock'event and clock='1' then
				if count=7 then
					count<=0;
				else
					count<=count+1;
				end if ;
			end if ;
		end process ; -- counter

		--counter
		------------------------------------------------------------------------

		------------------------------------------------------------------------
		--disp_display

		disp_display : process( clock )
		begin
			
			if clock'event and clock='1' then
				case (count) is
					when 0 => cat<="11111110"; disp<=table(conv_integer(disp0));
					when 1 => cat<="11111101"; disp<=table(conv_integer(disp1));
					when 2 => cat<="11111011"; disp<=table(conv_integer(disp2));
					when 3 => cat<="11110111"; disp<=table(conv_integer(disp3));
					when 4 => cat<="11101111"; disp<=table(conv_integer(disp4));
					when 5 => cat<="11011111"; disp<=table(conv_integer(disp5));
					when 6 => cat<="10111111"; disp<=table(conv_integer(disp6));
					when 7 => cat<="01111111"; disp<=table(conv_integer(disp7));
						
					when others => cat<="11111111";
				end case;
			end if ;

		end process ; -- disp_display

		--disp_display
		------------------------------------------------------------------------
		
		
	
	end architecture ; -- arch

--architecture
--------------------------------------------------------------------------------
