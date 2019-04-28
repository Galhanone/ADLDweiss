library ieee;
use ieee.std_logic_1164.all;

entity dark_spot is
	port(
		location 	: in  std_logic_vector(2 DOWNTO 0);
		done		: in  std_logic;
		reset_music	: out std_logic;
		dark_go		: out std_logic;
		right_left	: out std_logic);
end dark_spot;

architecture rtl of dark_spot is
begin
	process(location, done)
	begin
		if done = '1' AND location = "001" then
			reset_music <= '1';
			dark_go <= '1';
			right_left <= '0';
		elsif location = "001" then	--Friend In
			dark_go <= '0';
			reset_music <= '0';
		--elsif location = "010" then	--Friend Out
			
		elsif location = "011" then	--Tunnel In
			dark_go <= '1';
			right_left <= '1';
		--elsif location = "100" then	--Tunnel Out
			
		elsif done = '1' AND location >= "101" then
			reset_music <= '1';
		elsif location >= "101" then	--Church In
			dark_go <= '0';
			reset_music <= '0';
		else
			right_left <= '0';
			dark_go <= '1';
		end if;
	end process;
end rtl;
