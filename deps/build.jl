using BinaryProvider
using Compat

basedir = Prefix(joinpath(@__DIR__, "usr"))
library_prefix = Prefix(joinpath(@__DIR__, "usr/clFFT-2.12.2-Linux-x64/"))

products = Product[
    LibraryProduct(library_prefix, "libclFFT.so", :libclfft),
]

if true
    try
        # Download and install binaries
        url = "https://github.com/clMathLibraries/clFFT/releases/download/v2.12.2/clFFT-2.12.2-Linux-x64.tar.gz"
        tarball_hash = "20c853aba91e725b2b946ea59d5e45791c163b096951e0812a5d1d72d9d6a7cb"
        println("MA dasdarroooooeeee")

        install(url, tarball_hash; prefix=basedir, force=true, verbose=true)
    catch e
        if typeof(e) <: ArgumentError
            error("Your platform $(Sys.MACHINE) is not supported by this package!")
        else
            rethrow(e)
        end
    end
    # Finally, write out a deps.jl file
    write_deps_file(joinpath(@__DIR__, "deps.jl"), products, verbose=true)
    println("MA rroooooeeee")
end
println("MA rroffffooooeeee")

libCLFFT = "oi"

