library ieee;
use ieee.std_logic_1164.all;

entity dark_spot is
	port(
		location 	: in  std_logic_vector(1 DOWNTO 0);
		done		: in  std_logic;
		play		: out std_logic;
		dark_go		: out std_logic;
		right_left	: out std_logic);
end dark_spot;

architecture rtl of dark_spot is
begin
	process(location)
	begin
		if location = "01" then		--Friend
			dark_go <= '0';
			play <= '1';
			wait until done = '1';
			play <= '0';
			dark_go <= '1';
			right_left <= '0';
		elsif location = "10" then	--Tunnel
			dark_go <= '1';
			right_left <= '1';
		elsif location = "11" then	--Church
			dark_go <= '0';
			play <= '1';
			wait until done = '1';
			play <= '0';
		end if;
	end process;
end rtl;
