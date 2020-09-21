
using HDF5, JLD, Test, ProgressMeter, Pkg

include("pkgversions.jl");

pkgsVersion()

arr1 = rand(1000,1000)
arr2 = rand(10,25)

h5write("testfile.h5", "arr1", arr1) 
# @write "testfile.h5" arr1 
# h5write("testfile.h5", "arr1", arr1, "arr2", arr2) for several datasets at the same time 
# the first option is more specific (you can tell the name of the dataset to be saved), so I liked more. 

arr_load = h5read("testfile.h5", "arr1")

farr = h5open("testfile.h5", "r")

dump(farr)

names(farr)

readmmap(farr["arr1"])

close(farr)

@time arr_load = h5read("testfile.h5", "arr1");

@time data = h5read("testfile.h5", "arr1", (2:15, 2:15))

h5write("testfile.h5", "arr2", arr2) 

farr2 = h5open("testfile.h5", "r")

names(farr2)

read(farr2["arr2"])

close(farr2)

function szprint(szfile)
    if szfile <= 10^6
        println("File size = $(szfile/10^3) KB")
    elseif 10^6 < szfile <= 10^9
        println("File size = $(szfile/10^6) MB")
    elseif 10^9 < szfile <= 10^12
        println("File size = $(szfile/10^9) GB")
    elseif 10^12 < szfile <= 10^15
        println("File size = $(szfile/10^12) TB")
    else
        println("File size is really big. Petabytes or more!")
    end
end

szprint(700001000)

f = h5open("incrementalFilev1.h5", "w")
dset_A = d_create(f,"arr1",datatype(Float64), dataspace(10^6,1))
for i in 1:10^4:10^6
    dset_A[i:i + 10^4 - 1,1] = rand(10^4)
    szfile = filesize("incrementalFilev1.h5")
    szprint(szfile)
    sleep(.1)
    IJulia.clear_output(true)
end
flush(f)
close(f)

function szprintp(szfile)
    if szfile <= 10^6
        return (szfile/10^3, "KB") 
    elseif 10^6 < szfile <= 10^9
        return (szfile/10^6, "MB")
    elseif 10^9 < szfile <= 10^12
        return (szfile/10^9, "GB")
    elseif 10^12 < szfile <= 10^15
        return(szfile/10^12, "TB")
    else
        return ("=> Petabytes")
    end
end

szprintp(1000)

h5open("incrementalFilev2.h5", "w") do file
    dset = d_create(file, "arr1k", datatype(Float64), dataspace(10^6,1))
    p = Progress(100, dt=0.1, desc="Saving...", color=:blue)
    for iter in 1:10^4:10^6
        dset[iter:iter + 10^4 - 1,1] = rand(10^4)
        szfile = filesize("incrementalFilev2.h5")        
        ProgressMeter.next!(p; showvalues = [(:Filesize, szprintp(szfile))])
        sleep(0.1)
        IJulia.clear_output(true)
    end
    end;

f1 = h5open("incrementalFilev1.h5","r")

names(f1)

A_mmaped = readmmap(f1["arr1"])

#rand(100,100)

fm = h5open("MatrixFile.h5", "w")
dset_fm = d_create(fm,"arraym",datatype(Float64), dataspace(100,100,100)) #, "chunk", (100,100,1))
p = Progress(100, dt=0.1, desc="Saving...", color=:blue)
for i in 1:100
    dset_fm[:, :, i] = rand(100,100)
    szfilem = filesize("MatrixFile.h5")
    ProgressMeter.next!(p; showvalues = [(:File_Size, szprintp(szfilem))])
    sleep(0.1)
    IJulia.clear_output(true)
end
flush(fm)
close(fm)

fmatrix = h5open("MatrixFile.h5", "r")

names(fmatrix)

close(fmatrix)

h5read("MatrixFile.h5", "arraym", (:, :, 1))

save("testfile.jld", "arr1", arr1)
#@save "testfile.jld" arr1
# again, I prefer the first option, just for control. 

openfile = jldopen("testfile.jld","r", mmaparrays=true)
#load("testfile.jld", "arr1")
#@load "testfile.jld" arr1
# eval(:arr1)
# these last options are also valid, but for big files the first option is better. 

@time read(openfile["arr1"])[1:15, 2:5]

@load "testfile.jld"

names(openfile)

close(openfile)
