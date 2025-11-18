module Aline 

using CSV
using DataFrames

export lire
export encoder

include("lire.jl")
include("encode.jl")
end
