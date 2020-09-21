using Plots; gr()
markers = filter((m->begin m in Plots.supported_markers() end),
    Plots._shape_keys)
styles = filter((s->begin s in Plots.supported_styles() end), 
    [:solid, :dash, :dot, :dashdot, :dashdotdot])
pltm = plot(st =:scatter,leg = false, grid = false, axis = false,
    xlim = (0.92,2.7))
for i in 1:2, j in 1:11
    c = i==1 ? 0 : 11 
    plot!([i], [j], marker = (6, markers[c+j]))
    annotate!(i + 0.12, j, text(":$(markers[c+j])", 9, :left))
end
pltls = plot([1:5], st =:hline, line = (5, styles), grid=false,
    c = [:orangered, :dodgerblue, :black, :orange, :purple], 
    axis = false, leg = false, ylim = (0.5,5) )
for i in 1:5
    annotate!(-0.85, i-0.3, text("linestyle = :$(styles[i])", 9, :left))
end
plot(pltm, pltls, size = (500,250))
#savefig("markerlinestyles.pdf")