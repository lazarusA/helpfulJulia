x = LinRange(0,2,100)
plot(x, [x.^α for α in 0:0.2:10], c = :plasma, colorbar = true,
    linez = collect(0:0.2:10)', legend = false, ylim = (-0.1,10), 
    xlab = L"x", size = (600,300))
annotate!(0.5, 7.5, text(L"f(x) = x^\alpha", :purple))
annotate!(2.15, 10.2, text(L"\alpha", :purple)) 
# because colorbar_title is currently not implemented for GR
savefig("figpow.pdf")