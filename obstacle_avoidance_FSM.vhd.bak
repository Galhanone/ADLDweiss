library ieee;
use ieee.std_logic_1164.all;

entity obstacle_avoidance_FSM is
	port(
		clk, go_stop	: in	std_logic; 
		right_left 		: in	std_logic;
		side_close		: in	std_logic;
		side_far		: in	std_logic;
		side_vfar		: in	std_logic;
		front_close		: in	std_logic;
		back_far		: in	std_logic;
		l_go, r_go	 	: out	std_logic;
		l_fwd, r_fwd  	: out	std_logic;
		current_state	: out	std_logic_vector(2 DOWNTO 0));
end obstacle_avoidance_FSM;

architecture rtl of obstacle_avoidance_FSM is
	type state_type is (s0, s1, s2, s3, s4, s5, s6);
	signal state   : state_type;
begin
	process (clk, go_stop)
	begin
		if go_stop = '0' then
			state <= s0;
		elsif (rising_edge(clk)) then
			case state is
				when s0=>	--Reset
					if go_stop = '1' then
						state <= s1;
					else
						state <= s0;
					end if;
				when s1=>	--Straight
					if side_vfar = '1' then
						state <= s2;
					elsif front_close = '1' then
						state <= s5;
					elsif side_close = '1' then
						state <= s3;
					elsif side_far = '1' then
						state <= s4;
					else
						state <= s1;
					end if;
				when s2=>	--Watch
					if back_far = '1' then
						state <= s6;
					else
						state <= s2;
					end if;
				when s3=>	--Correct Away
					if side_close = '0' then
						state <= s1;
					else
						state <= s3;
					end if;
				when s4=>	--Correct Toward
					if side_vfar = '1' then
						state <= s2;
					elsif side_far = '0' then
						state <= s1;
					else
						state <= s4;
					end if;
				when s5=>	--Spin Away
					if front_close = '0' then
						state <= s1;
					else
						state <= s5;
					end if;
				when s6=>	--Spin Toward
					if side_far = '0' then
						state <= s1;
					else
						state <= s6;
					end if;
			end case;
		end if;
	end process;
	
	-- Output depends solely on the current state
	process (state)
	begin
		case state is
			when s0 =>		--Reset
				current_state	<= "000";
				l_go  			<= '0';
				r_go 			<= '0';
			when s1 =>		--Straight
				current_state	<= "001";
				l_go			<= '1';
				l_fwd 			<= '1';
				r_go 			<= '1';
				r_fwd			<= '1';
			when s2 =>		--Watch
				current_state	<= "010";
				l_go  			<= '1';
				l_fwd 			<= '1';
				r_go		 	<= '1';
				r_fwd			<= '1';
			when s3 =>		--Correct Away
				current_state	<= "011";
				l_go  			<= not(right_left);
				l_fwd 			<= '1';
				r_go			<= right_left;
				r_fwd			<= '1';
			when s4 => 		--Correct Toward
				current_state	<= "100";
				l_go  			<= right_left;
				l_fwd 			<= '1';
				r_go			<= not(right_left);
				r_fwd			<= '1';
			when s5 =>		--Spin Away
				current_state	<= "101";
				l_go  			<= '1';
				l_fwd 			<= not(right_left);
				r_go	 		<= '1';
				r_fwd			<= right_left;
			when s6 =>		--Spin Toward
				current_state	<= "110";
				l_go			<= '1';
				l_fwd 			<= right_left;
				r_go 			<= '1';
				r_fwd			<= not(right_left);
		end case;
	end process;
end rtl;
