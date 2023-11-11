using DifferentialEquations
using Plots

function sistem!(dx, x, p, t)
m1, m2, c, k1, k2, k3, g = p
dx[1] = x[2]
dx[2] = 1 / m1 * (m1 * g + k2 * x[3] - (k1 + k2) * x[1])
dx[3] = x[4]
dx[4] = 1 / m2 * (k2 * x[1] - m2 * g - c * x[4] - (k2 + k3) * x[3])
end
t = (0.0, 20.0)
p = (5.0, 8.0, 10.0, 20.0, 20.0, 20.0, 9.81)
x0 = [2.0, 0.0, 0.0, 0.0]
prob = ODEProblem(sistem!, x0, t, p)
sol = solve(prob)
