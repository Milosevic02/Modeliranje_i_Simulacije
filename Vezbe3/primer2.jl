using DifferentialEquations
using Plots

function dif_jedn!(dx, x, param, t)
    A, B = param
    dx[1] = u(t) + A*x[3]
    dx[2] = x[3]
    dx[3] = -B*x[1] + x[2]
end

function u(t)
    tp = rem(t, 5)
    u = 3*tp * (tp < 1) + 3 * ((tp >= 1) & (tp < 3)) +
    (-tp * 3/2 + 15/2) * ((tp >= 3) & (tp <= 5))
end

x0y0 = [-1.0, 1.0, 0.5]
    interval = (0.0, 15.0)
    A, B = (2.0, 1.0)
    parametri = (A, B)
    prob = ODEProblem(dif_jedn!, x0y0, interval, parametri)
    sol = solve(prob)
    plot(sol, xlabel="sol.t", ylabel="sol.u", label = ["x1" "x2" "x3"])
