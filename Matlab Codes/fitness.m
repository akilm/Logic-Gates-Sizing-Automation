function [P,D] = fitness(logic_string,Cload,gamma,f,Target_um,FO_4,Vdd,Cg,Cd,W,pinv)
[d,C_out_temp,C_out,C_in,Gate_type,No_inputs,No_Branches] = effort_delay(logic_string,W,gamma,Cload,pinv,Cg,Cd) 
D = d*3*(FO_4)/5     %FO_4 delay is equal to 5 x time constants (tow) picoseconds
P = (Dynamic_Power(Gate_type,No_inputs,C_out,C_in,Vdd,f))*10^12
disp(P);
end