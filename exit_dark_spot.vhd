library ieee;
use ieee.std_logic_1164.all;

entity exit_dark_spot is
	port(
		location 	: in  std_logic;
		exit_dark	: in  std_logic;
		side_vfar	: in  std_logic;
		front_close	: in  std_logic;
		left_go		: out std_logic;
		right_go	: out std_logic;
		right_left	: out std_logic);
end exit_dark_spot;

architecture rtl of exit_dark_spot is
begin
	process(exit_dark)
	begin
		if location = '1' then		--Exiting Friend
			right_left <= '0';
			right_go <= '1';
			left_go <= '0';
			while side_vfar = '1' loop
			end loop;
			right_go <= '1';
			left_go <= '1';
			while front_close = '0' loop
			end loop;
		elsif location = '0' then	--Exiting Tunnel
			right_go <= '1';
			left_go <= '1';
			while front_close = '0' loop
			end loop;
			right_left <= '1';
		end if;
	end process;
end rtl;