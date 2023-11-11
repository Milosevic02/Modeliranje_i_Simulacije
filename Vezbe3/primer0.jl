 using DifferentialEquations
 using Plots

 f(u,p,t) = sin(t)

 u0 = 0.0
tspan = (0.0,10.0)

prob = ODEProblem(f,u0,tspan)

sol = solve(prob)

plot(sol)


function van_der_pol!(dx,x,p,t)
    u = p

    dx[1] = x[2]
    dx[2] = u *(1-x[1]^2)*x[2] - x[1]
end

x0 = [0.25,0.25]
interval = (0.0,30.0)

u = 1.0
parametri = u

prob = ODEProblem(van_der_pol!,x0,interval,parametri)
sol = solve(prob)

plot(sol,xlabel = "sol.t",ylabel = "sol.u",label = ["x1" "x2"])