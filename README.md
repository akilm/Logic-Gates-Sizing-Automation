# Analog-Design-Sizing-Automation

### **Project still under progress** ###
## Abstract :   
Determining the sizing of transistors using heuristic algorithms and logical effort to obtain optimal delay and power 

## Description:
Increasing the width of the MOS transistors (Indirectly W/L ratio) decrease the propagation delay across them since, increased W increases the Drive current for the same voltage level and the signal transistions occur faster. At the same time, Increasing the width of the MOS transistors increases the Diffusion and Parasitic Capacitances which increase the power consumption and delay to some extent. Thus, The sizing of Transistors requires both the factors ->Power Dissipation and Delay to be minimized at the same time. The theory of Logical Effort gives a Linear delay model of the Logic circuit and Power Dissipation equations are very well theorised for Dynamic as well as Static Dissipation. There are many computational techniques that use these equations to optimise the sizing of the transistors. Our approach is to use Heuristic Algorithms to compute the optimum size of the transistors.

## Tools:
Matlab : For running the equations and algorithms ; The optimum size of the transistors for each stage are theoretically found using Matlab and stored in a text file  

NGSpice: The Computed sizes are verified for optimum performance using NGSpice.

## Team:
* Akil M
* Hariharan OJ
* Tamil Selvan
