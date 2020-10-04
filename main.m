% FO4 = (gamma+1)*inv 
% inv = 3*tow
[d,C_out,Gate_type,No_inputs] = effort_delay('3-NAND-0 1-INV-4',3,2,20,1)
pd = Dynamic_Power(Gate_type,No_inputs,C_out,5,1000)
