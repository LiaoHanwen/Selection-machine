--------------------------------------------------------------------------------
--frequency devider
--
--input	50MHz
--
--output T=	0.0005s
--			0.05s
--			0.08s
--			0.1s
--			0.2s
--			0.3s
--			0.5s
--
--integration test 10.31
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--head

library ieee;
use ieee.std_logic_1164.all;

--head
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--entity

entity frequency_devider is
  port (
	--in
	clock:in std_logic;		--clock  50MHz
	reset:in std_logic;		--sw79

	--out
	
	clock0000002:out std_logic; --0.000002s 0.5MHz
	clock00005:out std_logic;	--0.0005s  2000Hz
	clock005:out std_logic;		--0.05s  20Hz
	clock008:out std_logic;		--0.08s  12.5Hz
	clock01:out std_logic;		--0.1s  10Hz
	clock02:out std_logic;		--0.2s  5Hz
	clock03:out std_logic;		--0.3s  3.3Hz
	clock025:out std_logic		--0.25s	4Hz
  ) ;
end entity ; -- frequency_devider

--entity
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--architecture

architecture arch of frequency_devider is

	----------------------------------------------------------------------------
	--signal
	
	--0.000002s  0.5MHz
	signal counter0000002:integer range 0 to 49;
	signal clk0000002:std_logic;
	--0.0005s  2000Hz
	signal counter00005:integer range 0 to 12499;
	signal clk00005:std_logic;
	--0.05s  20Hz
	signal counter005:integer range 0 to 49;
	signal clk005:std_logic;
	--0.08s  12.5Hz
	signal counter008:integer range 0 to 79;
	signal clk008:std_logic;
	--0.1s  10Hz
	signal counter01:integer range 0 to 99;
	signal clk01:std_logic;
	--0.2s  5Hz
	signal counter02:integer range 0 to 199;
	signal clk02:std_logic;
	--0.25s  4Hz
	signal counter025:integer range 0 to 249;
	signal clk025:std_logic;
	--0.3s  3.3Hz
	signal counter03:integer range 0 to 299;
	signal clk03:std_logic;

	--signal
	----------------------------------------------------------------------------

begin

	--frequency devider 0.000002s 0.5MHz
	devider000002 : process( reset,clock )
	begin
		if reset='0' then
			counter0000002<=0;
		elsif clock'event and clock='1' then
			if counter0000002=49 then
				counter0000002<=0;
				clk0000002<=not clk0000002;
			else
				counter0000002<=counter0000002+1;		
			end if ;
		end if ;
		clock0000002<=clk0000002;
	end process ; -- devider000002


	--frequency devider 0.0005s 2000Hz
	devider0005 : process( reset,clock )
	begin
		--if reset='0' then
			--counter00005<=0;
		if clock'event and clock='1' then
			if counter00005=12499 then
				counter00005<=0;
				clk00005<=not clk00005;
			else
				counter00005<=counter00005+1;		
			end if ;
		end if ;
		clock00005<=clk00005;
	end process ; -- devider0005

	--frequency devider 0.05 20Hz
	devider005 : process( reset,clk00005 )
	begin
		if reset='0' then
			counter005<=0;
		elsif clk00005'event and clk00005='1' then
			if counter005=49 then
				counter005<=0;
				clk005<=not clk005;
			else
				counter005<=counter005+1;		
			end if ;
		end if ;
		clock005<=clk005;
	end process ; -- devider005

	--frequency devider 0.08 12.5Hz
	divider008 : process( reset,clk00005 )
	begin
		if reset='0' then
			counter008<=0;
		elsif clk00005'event and clk00005='1' then
			if counter008=79 then
				counter008<=0;
				clk008<=not clk008;
			else
				counter008<=counter008+1;		
			end if ;
		end if ;
		clock008<=clk008;
	end process ; -- devider008

	--frequency devider 0.1s  10Hz
	divider01 : process( reset,clk00005 )
	begin
		if reset='0' then
			counter01<=0;
		elsif clk00005'event and clk00005='1' then
			if counter01=99 then
				counter01<=0;
				clk01<=not clk01;
			else
				counter01<=counter01+1;		
			end if ;
		end if ;
		clock01<=clk01;
	end process ; -- devider01

	--frequency devider 0.2s  5Hz
	divider02 : process( reset,clk00005 )
	begin
		if reset='0' then
			counter02<=0;
		elsif clk00005'event and clk00005='1' then
			if counter02=199 then
				counter02<=0;
				clk02<=not clk02;
			else
				counter02<=counter02+1;		
			end if ;
		end if ;
		clock02<=clk02;
	end process ; -- devider02

	--frequency devider 0.25s  4Hz
	divider025 : process( reset,clk00005 )
	begin
		if reset='0' then
			counter025<=0;
		elsif clk00005'event and clk00005='1' then
			if counter025=199 then
				counter025<=0;
				clk025<=not clk025;
			else
				counter025<=counter025+1;		
			end if ;
		end if ;
		clock025<=clk025;
	end process ; -- devider025

	--frequency devider 0.3s  3.3Hz
	divider03 : process( reset,clk00005 )
	begin
		if reset='0' then
			counter03<=0;
		elsif clk00005'event and clk00005='1' then
			if counter03=299 then
				counter03<=0;
				clk03<=not clk03;
			else
				counter03<=counter03+1;		
			end if ;
		end if ;
		clock03<=clk03;
	end process ; -- devider03

end architecture arch;

--architecture
--------------------------------------------------------------------------------