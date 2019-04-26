library ieee;
use ieee.std_logic_1164.all;

entity dark_spot is
	port(
		location 	: in  std_logic_vector(1 DOWNTO 0);
		done		: in  std_logic;
		reset_music	: out std_logic;
		dark_go		: out std_logic;
		right_left	: out std_logic);
end dark_spot;

architecture rtl of dark_spot is
begin
	process(location)
	begin
		if location = "01" then		--Friend
			reset_music <= '1';
			dark_go <= '0';
			reset_music <= '0';
			while done = '0' loop
			end loop;
			reset_music <= '1';
			dark_go <= '1';
			right_left <= '0';
		elsif location = "10" then	--Tunnel
			dark_go <= '1';
			right_left <= '1';
		elsif location = "11" then	--Church
			reset_music <= '1';
			dark_go <= '0';
			reset_music <= '0';
			while done = '0' loop
			end loop;
			reset_music <= '1';
		else
			right_left <= '0';
			dark_go <= '1';
		end if;
	end process;
end rtl;
