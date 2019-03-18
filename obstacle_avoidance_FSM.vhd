library ieee;
use ieee.std_logic_1164.all;

entity obstacle_avoidance_FSM is
	port(
		clk		 	 		 : in	std_logic;
		go, front_close	 	 : in	std_logic;
		reset, done_turning	 : in	std_logic;
		left_out, right_out	 : out	std_logic);
end obstacle_avoidance_FSM;

architecture rtl of obstacle_avoidance_FSM is
	type state_type is (s0, s1, s2);
	signal state   : state_type;
begin
	process (clk, reset)
	begin
		if reset = '1' then
			state <= s0;
		elsif (rising_edge(clk)) then
			case state is
				when s0=>	--Reset
					if go = '1' then
						state <= s1;
					else
						state <= s0;
					end if;
				when s1=>	--Straight
					if front_close = '1' then
						state <= s2;
					else
						state <= s1;
					end if;
				when s2=>	--Spin
					if done_turning = '1' then
						state <= s1;
					else
						state <= s2;
					end if;
			end case;
		end if;
	end process;
	
	-- Output depends solely on the current state
	process (state)
	begin
		case state is
			when s0 =>
				left_out  <= '0';
				right_out <= '0';
			when s1 =>
				left_out  <= '1';
				right_out <= '1';
			when s2 =>
				left_out  <= '1';
				right_out <= '0';
		end case;
	end process;
end rtl;
