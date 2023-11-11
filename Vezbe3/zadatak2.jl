using DifferentialEquations
using Plots

function dif_jed!(dx,x,param,t)
    A,B,C = param
    dx[1] = x[2]
    dx[2] = -3*x[2] - C*(x[2]-x[4]) - B*(x[1]-x[3])
    dx[3] = x[4]
    dx[4] = (C*(x[2]-x[4]) -A*x[3] + B*(x[1]-x[3]) +F(t))/2
end

function F(t)
    tp = rem(t,3)
    F =  4*tp * (tp <1) + 4 * ((tp >=1) & (tp<2)) + 0 * ((tp>=2) & (tp <= 3))
end

x0xy0y = [1.0,1.0,1.0,1.0]
A,B,C = (12.0,8.0,4.0)
interval = (0.0,9.0)
parametri = (A,B,C)
prob = ODEProblem(dif_jed!,x0xy0y,interval,parametri)
sol = solve(prob)
plot(sol, xlabel="sol.t", ylabel="sol.u", label = ["x1" "x2" "x3 x4"])
