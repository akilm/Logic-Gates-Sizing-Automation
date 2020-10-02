function LE = logic_effort(gate_type,No_inputs)
   switch gate_type
       case 'INV'
           LE = 1
       case 'NAND'
           LE = (No_inputs+2)/3
       case 'NOR'
           LE = (2*No_inputs+1)/3
       case 'MUX'
           LE = 2
       case 'TRI'
           LE = 2
   end
end


