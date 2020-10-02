function P = parasitic(gate_type,No_inputs,Pinv)
   switch gate_type
       case 'INV'
           P = Pinv
       case 'NAND'
           P = No_inputs*Pinv
       case 'NOR'
           P = No_inputs*Pinv
       case 'MUX'
           P = 2*No_inputs*Pinv
       case 'TRI'
           P = 2*No_inputs*Pinv
   end
end