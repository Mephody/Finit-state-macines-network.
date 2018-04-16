library work;
use work.pack.all;

entity model is
	port(op: in T_rwe;
	     j: in natural;
	     clk: in bit;
	     state: out T_msi_vector);
end;

architecture beh of model is

signal next_state: T_msi_vector;
begin

gen: for jp in 1 to n generate
	p0: process (j, op)

				
	begin
	case op is
		when r =>
			if ((state(jp)=i) and (j=jp)) then next_state(jp)<=s;
			elsif ((state(jp)=m) and (j/=jp)) then next_state(jp)<=s;
			end if;
		when w =>
			if (j=jp) then next_state(jp)<=m;
			else next_state(jp)<=i;
			end if;
		when e =>
			if (j=jp) then next_state(jp)<=i;
			end if;
		end case;
	
	end process;	

end generate gen;

	p1: process(clk)
	begin
	if (clk'event and clk='1') then state<=next_state;
	end if;
	end process;


end;


