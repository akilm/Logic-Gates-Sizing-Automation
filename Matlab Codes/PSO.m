function PSO(N,Population,logic_string,Cload,gamma,f,Target_um,FO_4,Vdd,Cg,Cd,pinv)
 w =  unifrnd(0.18,100*0.18,60,3);
 Power = zeros(1,Population);
 Delay = zeros(1,Population);
 Personal_best = w ;
 for i = 1:N
    for j = 1:Population
        %%Compute Fitness values
        W = [w(j,1),w(j,2),w(j,3)]
        [Power(j),Delay(j)] = fitness(logic_string,Cload,gamma,f,Target_um,FO_4,Vdd,Cg,Cd,W,pinv);
        
        
    end
 end
 