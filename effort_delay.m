function C_in,g,h = CIN(LOGIC_String,Width,gamma,C_L)
    stage = split(LOGIC_String)
    C_in = zeros(1,length(stage))
    C_out = zeros(1,length(stage))
    g = zeros(1,length(stage))
    h = zeros(1,length(stage))
    for i = 1:length(stage)
       str = split(stage(i),'-')
       No_inputs = cell2mat(str(1))
       Gate_Type = string(str(2))
       No_Branches(i) = cell2mat(str(3))
       C_in(i) =  Cin_tot(No_inputs,Gate_Type,Width(i),gamma)
       g(i) = logic_effort(Gate_Type,No_inputs)
    end
    for i = 1:length(stage)
        if i != length(stage)
            C_out(i) = C_in(i+1)*No_Branches(i+1)
        else
            C_out(i) = C_L
    for i = 1:length(stage)
        h(i) = C_out(i)/C_in(i)
end