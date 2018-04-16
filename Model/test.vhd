library work;
use work.pack.all;

library IEEE;						
use IEEE.std_logic_1164.all;				
use STD.TEXTIO.all;					
use IEEE.std_logic_TEXTIO.all; 			
use ieee.numeric_std.all;

entity test is
end;

architecture atest of test is
signal op: T_rwe;
signal j: natural;
signal clk: bit;
signal state: T_msi_vector;
signal errors: integer:=0;

component model is
	port(op: in T_rwe;
	     j: in natural;
	     clk: in bit;
	     state: out T_msi_vector);
end component;

--psl  default clock is rising_edge(clk);     
--psl  property prop1 is always {state(1)=i; state(1)=m};
--psl  as1: assert prop1;
    


begin

m1: model port map (op=>op, j=>j, clk=>clk, state=>state);

clk<= not clk after 50 ns;
--j<=1,
--   2 after 100 ns,
--   3 after 200 ns,
--   4 after 300 ns;

--op<=r,
--    w after 100 ns,
--    e after 200 ns,
--    r after 300 ns,
--    w after 400 ns;


process							
file INFILE,OUTFILE, AWAIT_REACTION : text;	
variable PTR,POKE, PREA :line;			
variable DATA_IN: std_logic_vector(0 to 3);
variable DATA_IN1,DATA_IN2: std_logic_vector(0 to 1);



variable AWAIT_DATA_OUT, DATA_OUT:std_logic_vector (0 to 7);
variable await_data_transformed: T_msi_vector;

begin								
file_open(INFILE,"in_t01.dat",read_mode);		
file_open(AWAIT_REACTION,"out_t01.dat",read_mode);

file_open(OUTFILE,"out_mt.txt",write_mode);		
    while not (endfile(INFILE)) loop		
    wait for 20 ns;					
	readline(INFILE,PTR);				
	read(PTR,DATA_IN);

	data_in1:=data_in(0 to 1);
	data_in2:=data_in(2 to 3);
	
	case data_in1 is
		when "00" => op<=r;
		when "01" => op<=w;
		when "10" => op<=e;
		when others => null;
	end case;
	
	case data_in2 is
		when "00" => j<=1;
		when "01" => j<=2;
		when "10" => j<=3;
		when "11" => j<=4;
		when others => null;
	end case;


	
					
        readline(AWAIT_REACTION,PREA);		
	read(PREA,AWAIT_DATA_OUT);

	
		case await_data_out(0 to 1) is
			when "00" => await_data_transformed(1):=m;
			when "01" => await_data_transformed(1):=s;
			when "10" => await_data_transformed(1):=i;
			when others => null;
		end case;
		case await_data_out(2 to 3) is
			when "00" => await_data_transformed(2):=m;
			when "01" => await_data_transformed(2):=s;
			when "10" => await_data_transformed(2):=i;
			when others => null;
		end case;
		case await_data_out(4 to 5) is
			when "00" => await_data_transformed(3):=m;
			when "01" => await_data_transformed(3):=s;
			when "10" => await_data_transformed(3):=i;
			when others => null;
		end case;
		case await_data_out(6 to 7) is
			when "00" => await_data_transformed(4):=m;
			when "01" => await_data_transformed(4):=s;
			when "10" => await_data_transformed(4):=i;
			when others => null;
		end case;


	wait for 80 ns;
		
	case state(1) is
		when m => DATA_OUT(0 to 1):="00";
		when s => DATA_OUT(0 to 1):="01";
		when i => DATA_OUT(0 to 1):="10";
		when others => null;
	end case;
	case state(2) is
		when m => DATA_OUT(2 to 3):="00";
		when s => DATA_OUT(2 to 3):="01";
		when i => DATA_OUT(2 to 3):="10";
		when others => null;
	end case;
	case state(3) is
		when m => DATA_OUT(4 to 5):="00";
		when s => DATA_OUT(4 to 5):="01";
		when i => DATA_OUT(4 to 5):="10";
		when others => null;
	end case;
	case state(4) is
		when m => DATA_OUT(6 to 7):="00";
		when s => DATA_OUT(6 to 7):="01";
		when i => DATA_OUT(6 to 7):="10";
		when others => null;
	end case;
	

			
	
   						
 					
	write(POKE,DATA_OUT);				
	writeline(OUTFILE,POKE);			
    if (await_data_transformed = state) then null;	
    else errors <= errors + 1; 					
    end if;							
end loop;							
file_close(OUTFILE);					
file_close(INFILE);					
file_close(AWAIT_REACTION);				
if (errors = 0) then 						
assert(FALSE) report "Done!" severity WARNING;	
else 								
assert(FALSE) report "ERROR!" severity FAILURE;	
end if;							
wait;								
end process;		



end;
