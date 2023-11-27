using DifferentialEquations
using Plots

function sistem!(dx, x, p, t)
    m1, m2, c, k1, k2, R, g = p
    f = sin(t)
    J = 1 / 2 * m1 * Rˆ2
    dx[1] = x[2]
    dx[2] = (1 / J) * (k2 * (x[3] - R * x[1]) * R - k1 * x[1] - c * x[2])
    dx[3] = x[4]
    dx[4] = (1 / m2) * (f + m2 * g - k2 * (x[3] - R * x[1]))
end

t = (0.0,20.0)
p = (10.0, 5.0, 10.0, 15.0, 10.0, 1.0, 9.81)
x0 = [0.0,0.0,2.0,0.0]

prob = ODEProblem(sistem!,x0,t,p)
sol = solve(prob)

θ = [x[1] for x in sol.u]
ω = [x[2] for x in sol.u]
α = diff(ω) ./ diff(sol.t)
plot(sol.t, [θ, ω], lw=2, label=["θ(t)" "ω(t)"])
plot!(sol.t[1:end-1], α, lw=2, label="α(t)")