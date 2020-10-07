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
Target_nm = input('\n Enter the target fabrication technology') 
FO_4 = input('\Enter the FO_4 delay in the target fabrication technology')
Vdd = input('\n Enter the Vdd Value in V')
pinv = input('\n Enter the Cg/Cd ratio')
lower_limit = Target_nm
higher_limit = Target_nm*1000
W =(higher_limit-lower_limit).*rand(N,1) + lower_limit;
%% Fitness Functions
[d,C_out,Gate_type,No_inputs] = effort_delay(logic_string,W,gamma,Cload,pinv) 
abs_delay = d*(FO_4)/5     %FO_4 delay is equal to 5 x time constants (tow)
pd = Dynamic_Power(Gate_type,No_inputs,C_out,Vdd,f)
