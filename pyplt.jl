using Plots, LaTeXStrings
pyplot() # gr()
x = LinRange(0,2π,100) # with 100 the number of p
plot(x, sin.(x), c = :black)
savefig("figSin1py.pdf")
