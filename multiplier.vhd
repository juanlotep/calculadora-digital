------------------multiplier--------------------

library	 ieee;
use ieee.std_logic_1164.all;

------------------------------------------------

ENTITY multiplier IS 
    port (
        xm	: in  std_logic_vector (7 downto 0);
		  ym	: in  std_logic_vector (7 downto 0);
        p	: out std_logic_vector (7 downto 0)
    );
END ENTITY multiplier;

ARCHITECTURE structural OF multiplier IS

    SIGNAL line1,line2,line3,line4 	: 	std_logic_vector(7 downto 0);
	 SIGNAL cm								: 	std_logic_vector(2 downto 0);
	 SIGNAL S1,S2,S3						:	std_logic_vector(7 downto 0);

begin
    line1 <= ('0','0','0','0',xm(3)and ym(0), xm(2)and ym(0), xm(1) and ym(0), xm(0) and ym(0));
    line2 <= ('0','0','0',xm(3)and ym(1), xm(2)and ym(1), xm(1) and ym(1), xm(0) and ym(1),'0');
    line3 <= ('0','0',xm(3)and ym(2), xm(2)and ym(2), xm(1) and ym(2), xm(0) and ym(2),'0','0');
	 line4 <= ('0',xm(3)and ym(3), xm(2)and ym(3), xm(1) and ym(3), xm(0) and ym(3),'0','0','0');
 
	A1: ENTITY work.adder PORT MAP (cin => '0',	x => line1,	y => line2,cout => cm(0),s => S1);
	A2: ENTITY work.adder PORT MAP (cin => cm(0),x => S1,		y => line3,cout => cm(1),s => S2);
	A3: ENTITY work.adder PORT MAP (cin => cm(1),x => S2,		y => line4,cout => cm(2),s => S3);

	p <= S3;

END ARCHITECTURE structural;