using Plots, LaTeXStrings
gr()
fontFamily = "Times"
default(titlefont=(16, fontFamily), guidefont=(16, fontFamily),
      tickfont=(10, fontFamily),legendfont=(13, fontFamily),
      bg_legend = nothing, framestyle = :semi, grid = true)
x = LinRange(0,2π,20)
markers = [:d, :o, :rect, :h, :s]
colores = [:orangered, :dodgerblue, :black, :orange, :purple]
pltscater = plot(xlab =L"x", legend =:bottom, fg_legend = :grey,
    legendfont=(9,), size = (600, 300))
for (indx, i) in enumerate(0:0.25:1)
    plot!(x, i .- cos.(x), c = colores[indx],
    m = (markers[indx], 4, :white, stroke(1,colores[indx])),
    label = ":$(markers[indx])")
end
pltscater
savefig("figsmarkers.pdf")