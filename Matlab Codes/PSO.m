function [Power_g,Delay_g,Gbest] = PSO(N,Population,logic_string,Cload,gamma,f,Target_um,FO_4,Vdd,Cg,Cd,pinv,Wpower,Wdelay,stages)
 w =  unifrnd(0.18,500*0.18,Population,stages);
 Power = zeros(1,Population);
 Delay = zeros(1,Population);
 Personal_best_width = w ;
 Personal_best_fitness = zeros(1,Population);
 fitness_current = zeros(1,Population);
 velocity = unifrnd(0,30,Population,stages);
 Gbest = zeros(N,stages) ;
 for i = 1:N
    for j = 1:Population
        %%Compute Fitness values
        for k=1:stages
            W(k) = w(j,k)
        end
        [Power(j),Delay(j)] = fitness(logic_string,Cload,gamma,f,Target_um,FO_4,Vdd,Cg,Cd,W,pinv);
        fitness_current(j) = (Wpower*exp(-Power(j)/1000)) + (Wdelay*exp(-Delay(j)/1000)/(sqrt(Wpower^2 + Wdelay^2)));
        fprintf("fitness %f",fitness_current(j))
        %%Update Personal best location and fitness value
        if(fitness_current(j)>Personal_best_fitness(j))
            for k = 1:stages
                Personal_best_width(j,k) = w(j,k);
                Personal_best_fitness(j) = fitness_current(j);
            end
        else
            %% Do nothing , Previous Values retained
        end 
    end
    
    %%Update global best location
    [minP,index] = max(Personal_best_fitness);
    for k = 1:stages
        Gbest(i,k) = Personal_best_width(index,k);
    end
        
    %%Velocity and position update
    for j = 1:Population
        r1 = unifrnd(0,1);
        r2 = unifrnd(0,1);
        for k = 1:stages
            velocity(j,k) = velocity(j,k) + 2*r1*(Personal_best_width(j,k) - w(j,k)) + 2*r2*(Gbest(k) - w(j,k));   
            w(j,k) = w(j,k) + velocity(j,k);
            if(w(j,k)<0)
                w(j,k)=-1*w(j,k);
            end
        end  
    end
   [Power_g(i),Delay_g(i)] = fitness(logic_string,Cload,gamma,f,Target_um,FO_4,Vdd,Cg,Cd,Gbest,pinv);
 end
 