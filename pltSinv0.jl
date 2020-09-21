using Plots
gr()                   # pyplot()
x = LinRange(0,2π,100) # with 100 points in the interval.
plot(x, sin.(x))
savefig("figSin0.pdf")
