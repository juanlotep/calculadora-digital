-------------------BCD(x8)-------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

-----------------------------------------
ENTITY bcd_x_8 IS 
  PORT( num     : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
        dec_in  : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
		  uni     : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
		  dec_out : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));

END ENTITY bcd_x_8;

ARCHITECTURE Structural OF bcd_x_8 IS 
  SIGNAL uni_00     : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL uni_01     : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL uni_02     : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL uni_03     : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL uni_04     : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL uni_05     : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL uni_06     : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL uni_07     : STD_LOGIC_VECTOR (7 DOWNTO 0);
  
  SIGNAL dec_out_00 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL dec_out_01 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL dec_out_02 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL dec_out_03 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL dec_out_04 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL dec_out_05 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL dec_out_06 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL dec_out_07 : STD_LOGIC_VECTOR (7 DOWNTO 0);
  
  BEGIN
    bcd_00 : ENTITY work.bcd
               PORT MAP( num     => num,
				             dec_in  => dec_in,
							    uni     => uni_00,
								 dec_out => dec_out_00);

    bcd_01 : ENTITY work.bcd
               PORT MAP( num     => uni_00,
				             dec_in  => dec_out_00,
							    uni     => uni_01,
								 dec_out => dec_out_01);

    bcd_02 : ENTITY work.bcd
               PORT MAP( num     => uni_01,
				             dec_in  => dec_out_01,
							    uni     => uni_02,
								 dec_out => dec_out_02);

    bcd_03 : ENTITY work.bcd
               PORT MAP( num     => uni_02,
				             dec_in  => dec_out_02,
							    uni     => uni_03,
								 dec_out => dec_out_03);
 
    bcd_04 : ENTITY work.bcd
               PORT MAP( num     => uni_03,
				             dec_in  => dec_out_03,
							    uni     => uni_04,
								 dec_out => dec_out_04);
 
    bcd_05 : ENTITY work.bcd
               PORT MAP( num     => uni_04,
				             dec_in  => dec_out_04,
							    uni     => uni_05,
								 dec_out => dec_out_05);
 
    bcd_06 : ENTITY work.bcd
               PORT MAP( num     => uni_05,
				             dec_in  => dec_out_05,
							    uni     => uni_06,
								 dec_out => dec_out_06);
 
    bcd_07 : ENTITY work.bcd
               PORT MAP( num     => uni_06,
				             dec_in  => dec_out_06,
							    uni     => uni_07,
								 dec_out => dec_out_07);
								 
    uni     <= uni_07(3 DOWNTO 0);
	 dec_out <= dec_out_07(3 DOWNTO 0);
	 
	 END Structural;