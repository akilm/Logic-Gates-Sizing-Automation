function [Cin_arr,Cout_arr] = Cin_tot(No_inputs,Gate_Type,Width,gamma,Cg,Cd)
    switch Gate_Type
        case 'INV'
            Cin_arr  = (gamma+1)*Width(i)*Cg
            Cout_arr = (gamma+1)*Width(i)*Cd 
        case 'NAND'
            Cin_arr = (gamma+No_inputs)*Width(i)*Cg
            Cout_arr = (No_inputs*gamma + No_inputs)*Cd
        case 'NOR'
            Cin_arr = (No_inputs*gamma+1)*Width(i)*Cg
            Cout_arr = (No_inputs*gamma + No_inputs)*Cd
    end
    
end