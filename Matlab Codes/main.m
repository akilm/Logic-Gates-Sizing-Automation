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
logic_string = '1-INV-0 2-NAND-0'% 3-NOR-0' %input('\n Enter the input stage logic in the specified format')
N = length(split(logic_string))
Cload = 500 %input('\n Enter the Load Capacitance on the final Stage in fF')
gamma = 2.3 %input('\n Enter the gamma value (Pmos/Nmos width ratio in an inverter for equal Conductance)')
f = 50000 %input('\n Enter the Operating Frequency')
Target_um = 0.18 %input('\n Enter the target fabrication technology') 
FO_4 = 60 %input('\Enter the FO_4 delay in the target fabrication technology')
Vdd = 1.8 %input('\n Enter the Vdd Value in V')
Cg = 2.2 %input('\n Enter Cgs Ff/um for the process');
Cd = 2.2 %input('\n Enter Cgd Ff/um for the process');
lower_limit = Target_um;
higher_limit = (Target_um)*5;
W = (higher_limit-lower_limit).*rand(N,1) + lower_limit;
pinv = Cd/Cg ;
iterations = 50;
Population = 50;
Wpower = 1
Wdelay = 1
stages = N
%% Fitness Functions 
%%[P,D] = fitness(logic_string,Cload,gamma,f,Target_um,FO_4,Vdd,Cg,Cd,W,pinv)
%fprintf("\n power in pW is %f",P);
%fprintf("\n delay in ps is %f",D);

%% Particle Swarm Optimisation
 [Power_g,Delay_g,Gbest,fit_avg,f_max,Delay] = PSO(iterations,Population,logic_string,Cload,gamma,f,Target_um,FO_4,Vdd,Cg,Cd,pinv,Wpower,Wdelay,stages)


%% Genetic Algorithm
%% [Power_g,Delay_g,Gbest,fit_avg,f_max] = GA(iterations,Population,logic_string,Cload,gamma,f,Target_um,FO_4,Vdd,Cg,Cd,pinv,Wpower,Wdelay,stages)

x = 1:iterations;
tiledlayout(5,1)
nexttile
plot(x,Power_g)
title('Power vs Iterations')

nexttile
plot(x,Delay_g)
title('delay vs Iterations')


nexttile
plot(x,fit_avg)
title('Average fitness vs Iterations')

nexttile
plot(x,f_max)
title('maximum fitness vs Iterations')
nexttile

for i=1:iterations
        x = Gbest(i,1)/1000
        y = Gbest(i,2)/1000
end
scatter(x,y)
title('W1 W2')
