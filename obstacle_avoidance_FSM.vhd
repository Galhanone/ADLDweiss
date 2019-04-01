library ieee;
use ieee.std_logic_1164.all;

entity obstacle_avoidance_FSM is
	port(
		clk, reset		 : in	std_logic; 
		right_left 		 : in	std_logic;
		go, front_close  : in	std_logic;
		r_close, r_far	 : in	std_logic;
		l_close, l_far	 : in	std_logic;
		r_vfar, l_vfar	 : in	std_logic;
		rb_far, rb_close : in	std_logic;
		l_go, r_go	 	 : out	std_logic;
		l_fwd, r_fwd  	 : out	std_logic;
		current_state	 : out	std_logic_vector(2 DOWNTO 0));
end obstacle_avoidance_FSM;

architecture rtl of obstacle_avoidance_FSM is
	type state_type is (s0, s1, s2, s3, s4, s5, s6, s7);
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
					if right_left = '1' then
						if front_close = '1' then
							state <= s2; --Spin Right
						elsif side_vfar = '1' then
							state <= s7; --Left Watch
						elsif side_far = '1' then
							state <= s3; --Turn Right
						elsif side_close = '1' then
							state <= s4; --Turn Left
						else
							state <= s1;
						end if;
					else
						if front_close = '1' then
							state <= s5; --Spin Left
						elsif side_vfar = '1' then
							state <= s6; --Right Watch
						elsif side_far = '1' then
							state <= s4; --Turn Left
						elsif side_close = '1' then
							state <= s3; --Turn Right
						else
							state <= s1;
						end if;
					end if;
				when s2=>	--Spin Right
					if side_far = '1' then
						state <= s1;
					else
						state <= s2;
					end if;
				when s3=>	--Turn Right
					if right_left = '1' then
						if side_far = '0' then
							state <= s1;
						else
							state <= s3;
						end if;
					else
						if side_close = '0' then
							state <= s1;
						else
							state <= s3;
						end if;
					end if;
				when s4=>	--Turn Left
					if right_left = '1' then
						if side_close = '0' then
							state <= s1;
						else
							state <= s4;
						end if;
					else
						if side_far = '0' then
							state <= s1;
						else
							state <= s4;
						end if;
					end if;
				when s5=>	--Spin Left
					if side_far = '1' then
						state <= s1;
					else
						state <= s5;
					end if;
				when s6=>	--Right Watch
					if back_far = '1' then
						state <= s3; --Turn Right
					else
						state <= s6;
					end if;
				when s7=>	--Left Watch
					if back_far = '1' then
						state <= s4; --Turn Left
					else
						state <= s7;
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
				left_go  		<= '0';
				right_go 		<= '0';
			when s1 =>		--Straight
				current_state	<= "001";
				left_go			<= '1';
				left_fwd 		<= '1';
				right_go 		<= '1';
				right_fwd		<= '1';
			when s2 =>		--Spin Right
				current_state	<= "010";
				left_go  		<= '1';
				left_fwd 		<= '0';
				right_go	 	<= '1';
				right_fwd		<= '1';
			when s3 =>		--Turn Right
				current_state	<= "011";
				left_go  		<= '1';
				left_fwd 		<= '1';
				right_go		<= '0';
			when s4 => 		--Turn Left
				current_state	<= "100";
				left_go  		<= '0';
				right_go		<= '1';
				right_fwd		<= '1';
			when s5 =>		--Spin Left
				current_state	<= "101";
				left_go  		<= '1';
				left_fwd 		<= '1';
				right_go	 	<= '1';
				right_fwd		<= '0';
			when s6 =>	--Right Watch
				current_state	<= "110";
				left_go			<= '1';
				left_fwd 		<= '1';
				right_go 		<= '1';
				right_fwd		<= '1';
			when s7 =>	--Left Watch
				current_state	<= "111";
				left_go			<= '1';
				left_fwd 		<= '1';
				right_go 		<= '1';
				right_fwd		<= '1';
		end case;
	end process;
end rtl;
