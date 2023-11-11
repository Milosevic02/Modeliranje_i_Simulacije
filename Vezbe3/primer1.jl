using DifferentialEquations
using Plots

function dif_jed!(y,param,t)
    α, λ = param
    dy = λ * exp(-α*t) *y
    return dy
end

function analiticko_resenje(t,y0,param)
    α, λ = param
    y = y0 * exp.(λ/α*(1 .- exp.(-α*t)))
    return y
end

y0 = 1.0
parametri = (1.0,1.0)
interval = (0.0,5.0)
problem = ODEProblem(dif_jed!,y0,interval,parametri)
num = solve(problem)

t1 = 0:0.01:5
analiticko = analiticko_resenje(t1,y0,parametri)

numericko = num(t1)

plot(t1, analiticko, xlabel="num.t", ylabel="num.u", label="analiticko")
plot!(t1, numericko, label="numericko")

