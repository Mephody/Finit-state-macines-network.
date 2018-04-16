package pack is
	constant n:natural:=4; --automat count
	type T_msi is (i, s, m);
	type T_rwe is (r, w, e);
	type T_msi_vector is array (1 to n) of T_msi;
end package; 
