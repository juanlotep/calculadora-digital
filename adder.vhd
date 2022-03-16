LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY adder IS 
			PORT (cin : IN STD_LOGIC;
			x,y : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			s : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			cout : OUT STD_LOGIC);
END adder;


------------------------------------------------
ARCHITECTURE structural OF adder IS 
		COMPONENT  fulladd IS PORT (cin,x,y : IN STD_LOGIC; s, Cout: OUT STD_LOGIC);
END COMPONENT;

SIGNAL c : STD_LOGIC_VECTOR(1 TO 7);

BEGIN 

--------------------------------------------------

fa0: ENTITY work.fulladd PORT MAP (cin => cin, 	 x => x(0), y => y(0), s => s(0), cout => c(1));
fa1: ENTITY work.fulladd PORT MAP (cin => c(1) , x => x(1), y => y(1), s => s(1), cout => c(2));
fa2: ENTITY work.fulladd PORT MAP (cin => c(2) , x => x(2), y => y(2), s => s(2), cout => c(3));
fa3: ENTITY work.fulladd PORT MAP (cin => c(3) , x => x(3), y => y(3), s => s(3), cout => c(4));
fa4: ENTITY work.fulladd PORT MAP (cin => c(4) , x => x(4), y => y(4), s => s(4), cout => c(5));
fa5: ENTITY work.fulladd PORT MAP (cin => c(5) , x => x(5), y => y(5), s => s(5), cout => c(6));
fa6: ENTITY work.fulladd PORT MAP (cin => c(6) , x => x(6), y => y(6), s => s(6), cout => c(7));
fa7: ENTITY work.fulladd PORT MAP (cin => c(7) , x => x(7), y => y(7), s => s(7), cout => cout);

END ARCHITECTURE structural;
