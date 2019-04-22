library ieee;
use ieee.std_logic_1164.all;

entity dark_spot is
	port(
		location 	: in  std_logic_vector(1 DOWNTO 0);
		side_vfar	: in  std_logic;
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
			--left_fwd <= '1';
			--right_fwd <= '1';
			right_left <= '0';
			wait until side_vfar = '1';
			--wait until back_far = '1';
			--left_fwd <= '0';
			--wait until side_far = '0';
			--left_fwd <= '1';
			--wait until front_close = '1';
		elsif location = "10" then	--Tunnel
			go <= '1';
			--left_fwd <= '1';
			--right_fwd <= '1';
			right_left <= '1';
			wait until side_vfar = '1';
			--wait until back_far = '1';
			--right_fwd <= '0';
			--wait until side_far = '0';
			--right_fwd <= '1';
		elsif location = "11" then	--Church
			go <= '0';
			play <= '1';
			wait until done = '1';
			play <= '0';
		end if;
	end process;
end rtl;
