--------------SUBSTRACTOR----------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

-----------------------------------------

ENTITY substractor IS 

  PORT( d_A      : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
        d_B      : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
	  	  reslt_r  : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
		 
END ENTITY substractor;

ARCHITECTURE Structural OF substractor IS
 
  SIGNAL switch_d : STD_LOGIC;
  SIGNAL mux_A    : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL mux_B    : STD_LOGIC_VECTOR (7 DOWNTO 0);
  SIGNAL c_A2     : STD_LOGIC_VECTOR (7 DOWNTO 0);
   
  BEGIN 
	
  Compar_A_B : ENTITY work.gratercomparator 
                 PORT MAP( x						=> d_A,
					            y						=> d_B,
									y_Grater_Than_x 	=> switch_d);
								 
  mux_A <= d_B WHEN switch_d = '1' ELSE d_A;
  mux_B <= d_A WHEN switch_d = '1' ELSE d_B;

  Complem_A1_A2 : ENTITY work.A1_A2_Complement
                    PORT MAP( number  => mux_B,
						            comp_A2 => c_A2);
							
  add : ENTITY work.adder
          PORT MAP ( cin => '0',
			            x   => mux_A,
			            y   => c_A2,
							s   => reslt_r);
							
  END Structural;