getcolors(g::ColorGradient) = [g[z] for z = LinRange(0,1,6)]
mapcolors = cgrad(:plasma) |> getcolors
pltscmap = plot(xlab =L"x", legend =:bottom, 
    legendfont=(9,), size = (600, 300))
for (indx, i) in enumerate(0:0.25:1)
    plot!(x, i .- cos.(x), c = mapcolors[indx],
    m = (markers[indx], 4, :white, stroke(1,mapcolors[indx])), 
    ls = :dashdot, label = ":$(markers[indx])")
end
pltscmap
savefig("figcmarkers.pdf")