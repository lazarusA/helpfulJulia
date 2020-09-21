clibrary(:colorcet)
plot(x, [sin.(x), cos.(x)], m = ([5 5], [:d :rect], stroke(1)), 
    c = [:fire :plasma], markerz =  x, linez = x,
    colorbar = false, ls = [:dash :dashdot], leg =:false, 
    ylim = (-1.5, 1.5), size = (600, 300))
plot!(x, fill(1.2,20), c = :viridis, markerz =  x, linez = x,
    m = ([10, 5, 4], [:d, :rect, :utriangle], stroke(0)))
plot!(x, fill(-1.2,20), c = :kdc, markerz = x, linez = x, ls = :dashdotdot,
    m = ([10,8,6,4],[:d,:rect,:utriangle,:circle],stroke(1)))
savefig("figmixmarkers.pdf")
# second plot
tronLegacy = ["#FF410DFF", "#6EE2FFFF", "#F7C530FF", "#95CC5EFF",
    "#D0DFE6FF", "#F79D1EFF", "#748AA6FF"]
plot(x, [sin.(x), cos.(x)], m = ([5 5], [:d :rect], stroke(1)), 
    c = [tronLegacy[1] tronLegacy[2]], ls = [:dash :dashdot],
    colorbar = false,  ylim = (-1.5, 1.5), leg =:false, bg=:black,
    size = (600, 400))
plot!(x, fill(1.2,20), m = ([10, 5, 4], [:d, :rect, :utriangle], stroke(0)),
    c = tronLegacy[3])
plot!(x, fill(-1.2,20), c = tronLegacy[5],ls = :dashdotdot,
    m = ([10, 8, 6, 4], [:d, :rect, :utriangle, :circle], stroke(1)))
savefig("figmixmarkerstron.pdf")