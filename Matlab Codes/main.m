%% Parameters of the circuit 

% Logic string format :
%    '<No of inputs>-<Gate type>-<No of symmetrical branches>'
% Example : '1-INV-0'
% Note:
% Gate types supported : NAND NOR INV
% all branches are considered to be identical to the present stage
% For multi-stage:
% enter in the same format leaving a space in between
% Example :-'1-INV-0 2-NAND-0 3-NOR-0' 
logic_string = input('\n Enter the input stage logic in the specified format')
N = length(split(logic_string))
Cload = input('\n Enter the Load Capacitance on the final Stage in pF')
gamma = input('\n Enter the gamma value (Pmos/Nmos width ratio in an inverter for equal Conductance)')
f = input('\n Enter the Operating Frequency')
Target_um = input('\n Enter the target fabrication technology') 
FO_4 = input('\Enter the FO_4 delay in the target fabrication technology')
Vdd = input('\n Enter the Vdd Value in V')
Cg = input('\n Enter Cgs Ff/um for the process');
Cd = input('\n Enter Cgd Ff/um for the process');
lower_limit = Target_um;
higher_limit = (Target_um)*5;
W = (higher_limit-lower_limit).*rand(N,1) + lower_limit;
pinv = Cd/Cg ;
%% Fitness Functions ss
[d,C_out_temp,C_out,C_in,Gate_type,No_inputs,No_Branches] = effort_delay(logic_string,W,gamma,Cload,pinv,Cg,Cd) 
abs_delay = d*3*(FO_4)/5     %FO_4 delay is equal to 5 x time constants (tow) picoseconds
pd = Dynamic_Power(Gate_type,No_inputs,C_out,C_in,Vdd,f) 
