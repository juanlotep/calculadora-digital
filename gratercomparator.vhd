------------GRATERCOMPARATOR-------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

-----------------------------------------
 
ENTITY gratercomparator IS 
  PORT(  x               : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
         y               : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
			y_Grater_Than_x : OUT STD_LOGIC);
			
END ENTITY gratercomparator ;

ARCHITECTURE Structural OF gratercomparator IS 
    BEGIN
	     y_grater_Than_x   <= '1' WHEN y > x ELSE '0';
		
END ARCHITECTURE Structural;