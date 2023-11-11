using DifferentialEquations
using Plots

function f(t)
    tp = rem.(t,5)
    y = (4*tp) * (tp<1) + 4*((tp >= 1) & (tp.<2)) + (-2 * tp + 8) * ((tp>=2)&(tp<3)) 
    + 2*((tp>=3)&(tp<4)) + (-2 * tp + 10) * (tp >=4)
end

function dif_jed!(dx,x,p,t)
    m1,m2,c1,c2,c3,k1,k2 = p
    dx[1] = x[2];
    dx[2] = (1/m1) * (f(t) + c1*(x[4]-x[2]) - k1*x[1])
    dx[3] = x[4]
    #−1m2(c1(x4 − x2) + (c2 + c3)x4 + k2x3)
    dx[4] = -(1/m2)*(c1*(x[4]-x[2]+(c2+c3)*x[4] + k2*x[3]))
end

t = (0.0, 10.0)
p = (10.0, 15.0, 20.0, 20.0, 20.0, 40.0, 40.0)
x0 = [0.0, 0.0, 0.0, 0.0]
prob = ODEProblem(dif_jed!, x0, t, p)
sol = solve(prob)

poz1 = [x[1] for x in sol.u]
poz2 = [x[3] for x in sol.u]

~,index1 = findmax(abs.(poz1))
~,index2 = findmax(abs.(poz2))
plot(sol.t, [poz1, poz2], lw=2, xticks=0:10, label=["x1(t)" "x2(t)"])
plot!([sol.t[index1]], [poz1[index1]], markershape=:o, label="max_poz1")
plot!([sol.t[index2]], [poz2[index2]], markershape=:o, label="max_poz2")

distance1 = sum(abs.(diff(poz1)))
distance2 = sum(abs.(diff(poz2)))
println("Distance traveled by the first body is: ", distance1)
println("Distance traveled by the second body is: ", distance2)


