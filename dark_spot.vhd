library ieee;
use ieee.std_logic_1164.all;

entity dark_spot is
	port(
		location 	: in  std_logic_vector(1 DOWNTO 0);
		done		: in  std_logic;
		reset_music	: out std_logic;
		play_music	: out std_logic;
		dark_go		: out std_logic;
		right_left	: out std_logic);
end dark_spot;

architecture rtl of dark_spot is
begin
	process(location, done)
	begin
		if done = '1' then
			play_music <= '0';
			dark_go <= '0';
		elsif location = "01" then	--Tunnel In
			right_left <= '0';
		elsif location >= "11" then	--Church In
			dark_go <= '0';
			reset_music <= '0';
			play_music <= '1';
		else
			dark_go <= '1';
			play_music <= '0';
			reset_music <= '1';
			right_left <= '0';
		end if;
	end process;
end rtl;
