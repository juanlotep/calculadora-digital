-------------gorecomparator-------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

-----------------------------------------
 
ENTITY gorecomparator IS 
  PORT(  x               : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
         y               : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
			y_GraterOE_Than_x : OUT STD_LOGIC);
			
END ENTITY gorecomparator ;

ARCHITECTURE Structural OF gorecomparator IS 
    BEGIN
	     y_graterOE_Than_x   <= '1' WHEN y >= x ELSE '0';
		
END ARCHITECTURE Structural;