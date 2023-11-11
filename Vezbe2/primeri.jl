using Pkg
Pkg.add("Plots")
using Plots

t = 1:10
y = rand(10)
plot(t,y,xticks = 1:10)

t = 0:10
y = sin.(t)
plot(t,y,x_ticks=0:10)

t = 0:0.1:10
y = sin.(t)
plot(t, y, title="Primer 3", label="sin(t)", lw=3, color=:red, xticks=0:10)
xlabel!("x-osa")
ylabel!("y-osa")

t1 = 0:0.01:10
t2 = 0:0.01:15
y1 = sin.(t1)
y2 = cos.(t2)
plot(t1, y1, title="Dva signala", label="sin(t)", xticks=0:10)
plot!(t2, y2, label="cos(t)", xticks=0:15)
xlabel!("t")
ylabel!("y")

t = 0:0.1:2
y = 5 * t .* (t .< 1 ) + (-5 * t .+ 10) .* ((t .>= 1) .& (t .<= 2));
plot(t, y, title="Trougao")
xlabel!("t")
ylabel!("y")

t = 0:0.1:4
tp = rem.(t,2)
y = 5 * tp .* (tp .< 1) + (-5 * tp .+ 10) .* ((tp .>=1) .& (tp .<=2))
plot(t, y, title="Periodicni signal 1")
xlabel!("t")
ylabel!("y")

t = 0:0.1:10
tp = rem.(t,2)
y = 5 * tp .* (tp .< 1) + (-5 * tp .+ 10) .* ((tp .>= 1) .& (tp .<= 2));
plot(t, y, title="Periodicni signal 2", xticks=0:10)
xlabel!("t")
ylabel!("y")

t = 0:0.1:6
ys = abs.(sin.(pi/3 *t))
y = min.(ys,0.75)
scatter(t, ys, markershape=:o, markerstrokecolor=:green, color=:yellow)
plot!(t, y, lw=2, xlabel="t", ylabel="|sin|", color=:blue)

t = 0:0.1:6
ys = abs.(sin.(pi/3 *t))
p = 1/6 *t
y = min.(ys,p)
scatter(t, ys, markershape=:o, markerstrokecolor=:green, color=:yellow, label = "ys")
plot!(t, y, lw=2, xlabel="t", ylabel="|sin|", color=:blue, label = "y")

t = 0:0.1:6
ys = abs.(sin.(pi/3 *t))
tp = rem.(t,3)
p = 1/3 * tp
y = min.(ys,p)
scatter(t, ys, markershape=:o, markerstrokecolor=:green, color=:yellow, label = "ys")
plot!(t, y, lw=2, xlabel="t", ylabel="|sin|", color=:blue, label = "y")

plot(rand(100, 4), layout=4)

plot(rand(100, 4), layout=(4, 1))

t = 0:0.1:4*pi;
y1 = sin.(t);
y2 = cos.(t);
y3 = tan.(t);
y4 = cot.(t);
p1 = plot(t, y1, label="sin(t)", xticks=0:4*pi);
p2 = plot(t, y2, label="cos(t)", xticks=0:4*pi);
p3 = plot(t, y3, label="tg(t)", xticks=0:4*pi);
p4 = plot(t, y4, label="ctg(t)", xticks=0:4*pi);
plot(p1, p2, p3, p4, layout=(4, 1))


