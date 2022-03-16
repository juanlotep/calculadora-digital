-------------------BCD-------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

-----------------------------------------

ENTITY bcd IS 
  PORT( num     : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
        dec_in  : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
		  uni     : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		  dec_out : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
		  
END ENTITY bcd;

ARCHITECTURE Structural OF bcd IS 

SIGNAL num_GOET_ten : STD_LOGIC;
SIGNAL n_m_ten        : STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL dec_pls_one  : STD_LOGIC_VECTOR (7 DOWNTO 0);


  BEGIN 
  
    --dec_aux <= "00000000";
	 
    Comp_GE_Ten  : ENTITY work.gorecomparator
	                  PORT MAP( x                 => "00001010",
		                         y                 => num, 
					                y_GraterOE_Than_x => num_GOET_ten);
    
    Rest_ten     : ENTITY work.substractor
	                  PORT MAP( d_A     => num,
	                            d_B     => "00001010",
					                reslt_r => n_m_ten);

    add_dec_one  : ENTITY work.adder
	                  PORT MAP( cin => '0',
		                         x   => dec_in,
					                y   => "00000001",
					                s   => dec_pls_one);

    dec_out <= dec_pls_one WHEN num_GOET_ten = '1' ELSE dec_in;
	 uni     <= n_m_ten     WHEN num_GOET_ten = '1' ELSE num;
	 
END Structural;