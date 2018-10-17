--------------------------------------------------------------------------------
--matrix_display
--
--input	clock & content
--content:	all	1111000
--			dis	0000000
--			A-F 0001000-1101000
--
--output matrix
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

entity matrix_display is
  port (
	--in
	clock:in std_logic;		--clock 0.005s 200Hz
	content:in std_logic_vector(6 downto 0);	--content
	--out
	--row	low level effective
	row:out std_logic_vector(7 downto 0);	--up downto down
											--pin1 to pin8
	--col 	high level effective
	col:out std_logic_vector(7 downto 0)	--left downto right
											--pin22 to pin11
  ) ;
end entity ; -- matrix_display

--entity
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--architecture

architecture arch of matrix_display is

	----------------------------------------------------------------------------
	--signal

	--matrix  all downto dis
	type table_type is array (127 downto 0) of std_logic_vector(7 downto 0);
	constant table : table_type := 
	(
		x"FF",	x"FF",	x"FF",	x"FF",	x"FF",	x"FF",	x"FF",	x"FF",	--all
		x"00",	x"00",	x"00",	x"00",	x"00",	x"00",	x"00",	x"00",	--empty
		x"00",	x"00",	x"00",	x"00",	x"00",	x"00",	x"00",	x"00",	--empty
		x"7E",	x"7E",	x"60",	x"7E",	x"7E",	x"60",	x"60",	x"60",	--F
		x"00",	x"00",	x"00",	x"00",	x"00",	x"00",	x"00",	x"00",	--empty
		x"7E",	x"7E",	x"60",	x"7E",	x"7E",	x"60",	x"7E",	x"7E",	--E
		x"00",	x"00",	x"00",	x"00",	x"00",	x"00",	x"00",	x"00",	--empty
		x"FC",	x"FE",	x"C6",	x"C3",	x"C3",	x"C6",	x"FE",	x"FC",	--D
		x"00",	x"00",	x"00",	x"00",	x"00",	x"00",	x"00",	x"00",	--empty
		x"1E",	x"3E",	x"70",	x"60",	x"60",	x"70",	x"3E",	x"1E",	--C
		x"00",	x"00",	x"00",	x"00",	x"00",	x"00",	x"00",	x"00",	--empty
		x"7C",	x"66",	x"66",	x"7C",	x"7C",	x"66",	x"66",	x"7C",	--B
		x"00",	x"00",	x"00",	x"00",	x"00",	x"00",	x"00",	x"00",	--empty
		x"18",	x"3C",	x"66",	x"66",	x"7E",	x"FF",	x"C3",	x"C3",	--A
		x"00",	x"00",	x"00",	x"00",	x"00",	x"00",	x"00",	x"00",	--empty
		x"00",	x"00",	x"00",	x"00",	x"00",	x"00",	x"00",	x"00"	--dis
	); 

	--counter for row
	signal count:integer range 0 to 7;	--down to up

	--signal
	----------------------------------------------------------------------------

begin

	----------------------------------------------------------------------------
	--counter

	counter : process( clock )
	begin
		if clock'event and clock='1' then
			if count=0 then
				count<=7;
			else
				count<=count-1;
			end if ;
		end if ;
	end process ; -- counter

	--counter
	----------------------------------------------------------------------------

	----------------------------------------------------------------------------
	--display_col

	display_col : process( clock )
	begin

		if clock'event and clock='1' then
			col<=table(conv_integer(conv_integer(count+conv_integer(content))));
			case (count) is
				when 7 => row<="01111111";
				when 6 => row<="10111111";
				when 5 => row<="11011111";
				when 4 => row<="11101111";
				when 3 => row<="11110111";
				when 2 => row<="11111011";
				when 1 => row<="11111101";
				when 0 => row<="11111110";
					
				when others => row<="11111111";
			end case;
		end if ;
	end process ; -- display_col

	--display_col
	----------------------------------------------------------------------------

end architecture ; -- arch

--architecture
--------------------------------------------------------------------------------