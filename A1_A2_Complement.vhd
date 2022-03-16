
-------------A1_A2_Complement------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

-----------------------------------------
 
ENTITY A1_A2_Complement IS

  PORT( number : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
        comp_A2: OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
		  
END ENTITY A1_A2_Complement;

ARCHITECTURE Structural OF A1_A2_Complement IS 

 SIGNAL comp_A1 : STD_LOGIC_VECTOR (7 DOWNTO 0);
 
 BEGIN 
   comp_A1 <= NOT (number);
	
	cA2 : ENTITY work.adder
	        PORT MAP ( cin => '0', 
			             x   => comp_A1,
			             y   => "00000001",
							 s   => comp_A2);
   
 END Structural;	