function Pd = Dynamic_Power(C_out,f,Vdd)
    Pd = 0
    alpha = 0.1
    for i = 1:length(C_out)
        Pd = Pd + alpha*C_out*Vdd*Vdd*f
    end
end