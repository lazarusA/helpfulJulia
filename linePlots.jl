using Plots, LaTeXStrings
pyplot()
# ..This just changes some defatuls for plots, everything works without also.. #
fontFamily = "Times"
default(size=(600,400), dpi=70, titlefont=(16, fontFamily),
    guidefont=(18, fontFamily), tickfont=(14, fontFamily),
    legendfont=(13, fontFamily), framestyle = :semi, grid = true)
# ...............................................................#
x= LinRange(0,2π,100)
plot(x, [sin.(x)], legend = :bottomleft, c = :black,
 label = L"sin(x)", xlab = L"x")
#save("pltSin.pdf")
