using DifferentialEquations
using Plots

function f(t)
    return sin(t)
end

function dif_jed!(dx,x,param,t)
    m,c1,c2,k = param;
    dx[1] = x[2];
    dx[2] = (1/m) * (f(t) - k*x[1] -(c1+c2)*x[2]);
end

tspan = (0.0,10.0)
param = [10,20,20,40]
initial_condition = [0,0]
problem = ODEProblem(dif_jed!,initial_condition,tspan,param)
sol = solve(problem)

plot(sol)