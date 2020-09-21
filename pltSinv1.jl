using Plots
gr()
x = LinRange(0,2π,100)
plot(x, sin.(x), c = :black, legend =:bottomleft, label ="sin(x)",
    fg_legend = :red, bg_legend = nothing,xlab ="x",ylab ="f(x)",
    title = "Sine", guidefont=(18,"Times"),tickfont=(14, "Times"),
    legendfont=(13, "Times"), titlefont=(18, "Times"))
savefig("figSin1.pdf")
