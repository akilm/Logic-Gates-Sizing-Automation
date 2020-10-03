function Cin_arr = Cin_tot(No_inputs,Gate_Type,Width,gamma)
    switch Gate_Type
        case 'INV'
            Cin_arr = (gamma+1)*Width
        case 'NAND'
            Cin_arr = (gamma+No_inputs)*Width
        case 'NOR'
            Cin_arr = (No_inputs*gamma+1)*Width
    end
    
end