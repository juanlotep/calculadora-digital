LIBRARY ieee;
USE ieee.std_logic_1164.all;
-----------------------------------------------------
ENTITY gtninecomparator IS 
	PORT(	d 		: IN	 	STD_LOGIC_VECTOR(3 DOWNTO 0);
			comp	: OUT 	STD_LOGIC);
END ENTITY gtninecomparator;
-----------------------------------------------------
ARCHITECTURE structural OF gtninecomparator IS
BEGIN
	comp <= '1' when d > "1001" else '0';
end ARCHITECTURE structural;