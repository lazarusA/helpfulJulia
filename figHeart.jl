t = -3.1:0.01:3.1
u = 16*sin.(t).^3
v = 13*cos.(t) .- 5*cos.(2t) .- 2*cos.(3t) .- cos.(4t)
plot(u, v, c = :black, leg=false, fill=(0, 0.8,:black),
    xlab = L"u", ylab = L"v", xlim = (-20,20), ylim = (-20,15),
    size = (400, 400))
savefig("figheart.pdf")