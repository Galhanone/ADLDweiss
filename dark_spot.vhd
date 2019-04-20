library ieee;
use ieee.std_logic_1164.all;

entity dark_spot is
	port(
		location 	: in  std_logic_vector(1 DOWNTO 0);
		right_vfar	: in  std_logic;
		done		: in  std_logic;
		go, play 	: out std_logic;
		right_left	: out std_logic);
end dark_spot;

architecture rtl of dark_spot is
begin
	process(location)
	begin
		if location = "01" then		--Friend
			go <= '0';
			play <= '1';
			wait until done = '1';
			play <= '0';
			go <= '1';
			right_left <= '0';
			--left wall-follow till out
		elsif location = "10" then	--Tunnel
			right_left <= '1';
			wait until right_vfar = '1';
			--go straight
		elsif location = "11" then	--Church
			go <= '0';
			play <= '1';
			wait until done = '1';
			play <= '0';
		end if;
	end process;
end rtl;
