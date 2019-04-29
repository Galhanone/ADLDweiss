--****** Song Rom  ADLD***
library IEEE;
use IEEE.std_logic_1164.all;

Entity Song_ROM is 
	port(Note_Num: 	in  STD_LOGIC_VECTOR (4 downto 0);
		 Octave: 	out  STD_LOGIC_VECTOR (1 downto 0);
		 Note: 		out STD_LOGIC_VECTOR (3 downto 0);
		 Duration: 	out  STD_LOGIC_VECTOR (2 downto 0));
End Song_ROM;

Architecture Structure of Song_ROM  is
	signal data: STD_LOGIC_VECTOR (8 downto 0);
Begin
		Octave <= data(8 downto 7);
		Note <= data(6 downto 3);
	    Duration <= data(2 downto 0);
	Process(Note_Num)
	Begin
		Case Note_Num is
-- How Great Thou Art

when "00000"  => data <=  "011000001";
when "00001"  => data <=  "011000001";
when "00010"  => data <=  "100001001";
when "00011"  => data <=  "100101011";
when "00100"  => data <=  "100011001";
when "00101"  => data <=  "100001001";
when "00110"  => data <=  "011100001";
when "00111"  => data <=  "100001001";
when "01000"  => data <=  "011010001";
when "01001"  => data <=  "011000100";
when "01010"  => data <=  "010000001";
           
when "01011"  => data <=  "100001001";
when "01100"  => data <=  "011100001";
when "01101"  => data <=  "100001001";
when "01110"  => data <=  "100011100";
when "01111"  => data <=  "010000001";
           
when "10000"  => data <=  "100101001";
when "10001"  => data <=  "100110010";
when "10010"  => data <=  "011100001";
when "10011"  => data <=  "100001101";
when "10100"  => data <=  "010000110";

when others   => data <=  "---------";
			
		End Case;
		
	End process;
End Structure;