library ieee;
use ieee.std_logic_1164.all;

entity dark_spot is
	port(
		location : in std_logic_vector(1 DOWNTO 0);
		);
end dark_spot;

architecture rtl of dark_spot is
begin
	process(location)
	begin
		if location = "01" then		--Friend
			
		elsif location = "10" then	--Tunnel
			
		elsif location = "11" then	--Church
			
		end if;
end rtl;
