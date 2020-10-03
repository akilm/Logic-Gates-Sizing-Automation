LOGIC_String = input('Enter the LOGIC String \nSpecified Format: <No_Inputs>-<Gate_Type>-<No_Branches> <No_Inputs>-<Gate_Type>-<No_Branches>  \nSample Formats : 4-NAND-3 1-INV-2 5-NOR-3 \n ')
gamma = input('Enter the Gamma Value')
Cout = input('enter the Load Capacitance in pf')
Cin = CIN(LOGIC_String,Width,gamma,Cout)

end
