using DifferentialEquations
using Plots

function dif_jedn!(du, u, param, t)
    α, β, γ = param
    x,y,z = u
    du[1] = α * (y - x)
    du[2] = x * (β - z) - y
    du[3] = x * y - γ * z
end

interval = (0.0, 30.0)
α, β, γ = (10.0, 27.0, 8/3)
parametri = (α, β, γ)
uv0_1 = [1.0, 0.0, 0.0]
uv0_2 = [1.0, 0.01, 0.01]
prob_1 = ODEProblem(dif_jedn!, uv0_1, interval, parametri)
sol_1 = solve(prob_1)
prob_2 = ODEProblem(dif_jedn!,uv0_2,interval,parametri)
sol_2 = solve(prob_2)


plot(sol_1, label=["x" "y" "z"], xlabel="t", ylabel="Rešenje")
plot!(sol_2, label=["x" "y" "z"])