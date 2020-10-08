function LE = logic_effort(gate_type,No_inputs,gamma)
   switch gate_type
       case 'INV'
           LE = 1
       case 'NAND'
           LE = (No_inputs+gamma)/(1+gamma)
       case 'NOR'
           LE = (gamma*No_inputs+1)/(1+gamma)
   end
end


