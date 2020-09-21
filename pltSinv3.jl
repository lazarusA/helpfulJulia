using Plots, LaTeXStrings
using PyCall
PyDict(pyimport("matplotlib")."rcParams")["text.usetex"] = [true]
pyplot()
default(titlefont=18, guidefont=18, tickfont=16, legendfont= 13,
      bg_legend = nothing, fg_legend= :black, framestyle = :semi, grid = true)
# ...............................................................#
x = LinRange(0,2π,100)
plot(x, sin.(x), c = :red,label = L"sin(x)", title = "Sine",
    yticks = ([-1,0,1], [L"-1", L"0", L"1"]), ylab = L"f(x)",
    xlab = L"x", xticks = ([0,π/2, π, 3π/2, 2π],
    [L"0", L"\pi/2", L"\pi", L"3\pi/2", L"2\pi"]))
savefig("figSin3.pdf")
