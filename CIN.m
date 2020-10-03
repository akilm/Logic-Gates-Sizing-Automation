function C_in = CIN(LOGIC_String,Width,gamma)
    stage = split(LOGIC_String)
    C_in = zeros(1,length(stage))
    for i = 1:length(stage)
       str = split(stage(i),'-')
       No_inputs = cell2mat(str(1))
       Gate_Type = string(str(2))
       No_Branches = str(3)
       C_in(i) =  Cin_tot(No_inputs,Gate_Type,Width,gamma)
    end
end