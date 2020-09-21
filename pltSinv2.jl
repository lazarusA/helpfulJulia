using Plots, LaTeXStrings
gr()
fontFamily = "Times"
default(titlefont=(18, fontFamily), guidefont=(18, fontFamily),
      tickfont=(16, fontFamily),legendfont=(13, fontFamily),
      bg_legend = nothing,framestyle = :semi, grid = true)
      # another helpful keyword is:  size= (600, 400)
# ...............................................................#
x = LinRange(0,2π,100)
plot(x, sin.(x), c = :red,label = L"sin(x)", title = "Sine",
    yticks = ([-1,0,1], [L"-1", L"0", L"1"]), ylab = L"f(x)",
    xlab = L"x", xticks = ([0,π/2, π, 3π/2, 2π],
    [L"0", L"\pi/2", L"\pi", L"3\pi/2", L"2\pi"]))
savefig("figSin2.pdf")
