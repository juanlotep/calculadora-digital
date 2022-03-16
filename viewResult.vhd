-----------------------------viewResult-----------------------------
LIBRARY IEEE;
USE ieee.std_logic_1164.all;
--------------------------------------------------------------------

ENTITY viewResult IS
	PORT(	binDA		:	IN 	STD_LOGIC_VECTOR(3 DOWNTO 0);
			binDB		:	IN		STD_LOGIC_VECTOR(3 DOWNTO 0);
			binSW		:	IN		STD_LOGIC_VECTOR(1 DOWNTO 0);
			ssegP		:	OUT	STD_LOGIC_VECTOR(1 DOWNTO 0);
			ssegA		:	OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
			ssegB		:	OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
			ssegC		:	OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
			ssegD		:	OUT	STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END ENTITY viewResult;

--------------------------------------------------------------------

ARCHITECTURE structural OF viewResult IS
	signal	ErrorComparator1	:	STD_LOGIC;
	signal	ErrorComparator2	:	STD_LOGIC;
	signal 	ErrorOut				: 	STD_LOGIC;
	signal	ssegA_temp			:	STD_LOGIC_VECTOR(6 DOWNTO 0);
	signal	ssegB_temp			:	STD_LOGIC_VECTOR(6 DOWNTO 0);
	signal	ssegC_temp			:	STD_LOGIC_VECTOR(6 DOWNTO 0);
	signal	ssegD_temp			:	STD_LOGIC_VECTOR(6 DOWNTO 0);
	signal 	neg_flag 			:	STD_LOGIC;
	signal 	ssegError			:	STD_LOGIC_VECTOR(6 DOWNTO 0);
	signal 	ssegNeg				:	STD_LOGIC_VECTOR(6 DOWNTO 0);
	signal 	binDA8bit			: 	STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal 	binDB8bit			: 	STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal 	result_add			: 	STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal 	result_sub			: 	STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal 	result_mult			: 	STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal 	result				: 	STD_LOGIC_VECTOR(7 DOWNTO 0);
	signal 	MSD					: 	STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal 	LSD					: 	STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
	
--------------------------------------------------------------------	
	
	ErrorOut 	<=		ErrorComparator1 OR  ErrorComparator2;
	ssegError	<= 	"0000110";
	ssegNeg		<= 	"0111111";
	binDA8bit	<=		"0000" & binDA;
	binDB8bit	<=		"0000" & binDB;
	ssegP			<= 	"00";

--------------------------------------------------------------------
	
	ssegA	<=	ssegA_temp when ErrorComparator1 = '0' else ssegError;
	
	ssegB	<=	ssegB_temp when ErrorComparator2 = '0' else ssegError;
	
	ssegC <= ssegError	when 	ErrorOut 	= '1' else
				ssegNeg	 	when 	neg_flag ='1' AND binSW="01" else
				ssegC_temp;
	
	ssegD <= ssegError	when 	ErrorOut = '1' else
				ssegD_temp;

--------------------------------------------------------------------	

	result <= 	result_add when binSW = "11" else
					result_sub when binSW = "01" else
					result_mult;
					
--------------------------------------------------------------------
	
	compDA		: 	ENTITY work.gtninecomparator
	PORT MAP(	d 		=>		binDA,
					comp	=>		ErrorComparator1);		
				
	compDB		: 	ENTITY work.gtninecomparator 
	PORT MAP(	d 		=>		binDB,
					comp	=>		ErrorComparator2);	
					
	gratercomp	:	ENTITY work.gratercomparator
	PORT MAP(	x	=>	binDA8bit,
					y	=>	binDB8bit,
					y_Grater_Than_x => neg_flag);
					
	add			:  ENTITY work.adder
	PORT MAP(	x 		=>	binDA8bit,
					y 		=>  binDB8bit,
					cin 	=> '0',
					s		=> result_add);
	
	subs			:	ENTITY work.substractor
	PORT MAP(	d_A 		=>	binDA8bit,
					d_B 		=>  binDB8bit,
					reslt_r 	=>	result_sub);
					
	mult			:	ENTITY work.multiplier
	PORT MAP(	xm 	=>	binDA8bit,
					ym 	=> binDB8bit,
					p 		=>	result_mult);
					
	bcd			:	ENTITY work.bcd_x_8
	PORT MAP(	num		=> result,
					dec_in	=> "00000000",
					uni		=>	LSD,
					dec_out	=>	MSD);
	
--------------------------------------------------------------------
	
	bintossegA	: 	ENTITY work.bin_to_sseg
	PORT MAP(	bin 		=>	 	binDA,
					sseg		=>		ssegA_temp);
					
	bintossegB	:  ENTITY work.bin_to_sseg
	PORT MAP(	bin 		=>	 	binDB,
					sseg		=>		ssegB_temp);
	
	bintossegC	: 	ENTITY work.bin_to_sseg
	PORT MAP(	bin 		=>	 	MSD,
					sseg		=>		ssegC_temp);
	
	bintossegD	: 	ENTITY work.bin_to_sseg
	PORT MAP(	bin 		=>	 	LSD,
					sseg		=>		ssegD_temp);
END ARCHITECTURE structural;