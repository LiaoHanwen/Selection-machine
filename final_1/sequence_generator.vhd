--------------------------------------------------------------------------------
--m sequence generator
--decoder
--
--input clock
--output random disp
--
--disp:	all	1111
--		dis	1110
--		9	1001
--		.	.
--		.	.
--		0	0000
--
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

---------------------------------------------------------------------------------
--entity

entity sequence_generator is
  port (
	clock:in std_logic;	--50M
	reset:in std_logic;

	--debug
	seq_output:out std_logic;

	disp:out std_logic_vector(3 downto 0)

  ) ;
end entity ; -- sequence_generator

--entity
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--architecture

architecture arch of sequence_generator is

	----------------------------------------------------------------------------
	--signal

	--m sequence
	signal seq:std_logic_vector(8 downto 0);

	--sequence output signal
	signal seq_out:std_logic;

	--disp_re
	signal disp_re:std_logic_vector(3 downto 0);

	--signal
	----------------------------------------------------------------------------

begin
	
	----------------------------------------------------------------------------
	--m sequence generator

	m_sequence_generator : process( clock )
	begin
		if reset='0' then
			seq<="000000001";
		elsif clock'event and clock='1' then
			seq(0)<=seq(3) xor seq(8);
			seq(1)<=seq(0);
			seq(2)<=seq(1);
			seq(3)<=seq(2);
			seq(4)<=seq(3);
			seq(5)<=seq(4);
			seq(6)<=seq(5);
			seq(7)<=seq(6);
			seq(8)<=seq(7);
		end if ;
		seq_out<=seq(8);
		seq_output<=seq_out;
	end process ; -- m_sequence_generator

	--m sequence generator
	----------------------------------------------------------------------------

	----------------------------------------------------------------------------
	--decoder

	decoder : process( seq_out )
	begin
		if seq_out'event and seq_out='1' then
			case (disp_re) is
				when "0000" => disp_re<="0001";
				when "0001" => disp_re<="0010";
				when "0010" => disp_re<="0011";
				when "0011" => disp_re<="0100";
				when "0100" => disp_re<="0101";
				when "0101" => disp_re<="0110";
				when "0110" => disp_re<="0111";
				when "0111" => disp_re<="1000";
				when "1000" => disp_re<="1001";
				when "1001" => disp_re<="0000";
				when others => disp_re<="0000";
			end case;
		end if ;
		disp<=disp_re;
	end process ; -- decoder

	--decoder
	----------------------------------------------------------------------------

end architecture ; -- arch
	
--architecture
--------------------------------------------------------------------------------