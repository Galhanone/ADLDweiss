library ieee;
use ieee.std_logic_1164.all;

entity dark_spot is
	port(
		location 	: in  std_logic_vector(2 DOWNTO 0);
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
		if done = '1' AND location = "001" then
			play_music <= '0';
			dark_go <= '1';
			right_left <= '0';
		elsif location = "001" then	--Friend In
			dark_go <= '0';
			reset_music <= '0';
			play_music <= '1';
		elsif location = "011" then	--Tunnel In
			dark_go <= '1';
			right_left <= '1';
			play_music <= '0';
		elsif done = '1' AND location >= "101" then
			reset_music <= '1';
			play_music <= '0';
		elsif location >= "101" then	--Church In
			dark_go <= '0';
			reset_music <= '0';
			play_music <= '1';
		else
			dark_go <= '1';
			play_music <= '0';
			reset_music <= '1';
		end if;
	end process;
end rtl;
