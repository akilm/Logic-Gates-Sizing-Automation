function PSO(N,Population,logic_string,Cload,gamma,f,Target_um,FO_4,Vdd,Cg,Cd,pinv,Wpower,Wdelay,stages)
 w =  unifrnd(0.18,100*0.18,60,3);
 Power = zeros(1,Population);
 Delay = zeros(1,Population);
 Personal_best_width = w ;
 Personal_best_fitness = zeros(1,Population);
 fitness_prev = zeros(1,Population);
 fitness_current = zeros(1,Population);
 velocity = zeros(1,Population);
 Gbest = zeros(1,stages) ;
 for i = 1:N
    for j = 1:Population
        %%Compute Fitness values
        W = [w(j,1),w(j,2),w(j,3)]
        [Power(j),Delay(j)] = fitness(logic_string,Cload,gamma,f,Target_um,FO_4,Vdd,Cg,Cd,W,pinv);
        fitness_current(j) = (Wpower*exp(-Power(j))+Wdelay*Delay(j))/(sqrt(Wpower^2 + Wdelay^2));
        
        %%Update Personal best location and fitness value
        if(fitness_current(j)>Personal_best_fitness(j))
            for k = 1:stages
                Personal_best_width(j,k) = W(k)
                Personal_best_fitness(j) = fitness_current(j)
            end
        else
            %% Do nothing , Previous Values retained
        end 
    end
    
    %%Update global best location
    [minP,index] = min(Personal_best_fitness);
    for k = 1:stages
        Gbest(k) = Personal_best_width(index,k);
    end
        
    %%Velocity and position update
    for j = 1:Population
        r1 = unifrnd(0,1);
        r2 = unifrnd(0,1);
        for k = 1:stages

            velocity(j,k) = velocity(j,k) +   %%Memory
                            2*r1*(Personal_best_width(j,k) - w(j,k)) + %%Cognitive
                            2*r2*(Gbest(k) - w(j,k));   %%Social
            
            w(j,k) = w(j,k) + velocity(j,k);
                
        end  
 end
 