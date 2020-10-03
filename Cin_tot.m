function C_Table = Cin_tot(No_inputs,Gate_Type,Width,gamma)
    switch Gate_Type
        case 'INV'
            C_Table = (gamma+1)*Width
        case 'NAND'
            C_Table = (gamma+No_inputs)*Width
        case 'NOR'
            C_Table = (No_inputs*gamma+1)*Width
    end
end