module Aline 

using CSV
using DataFrames
using GLM

export lire
export encoder
export tout

include("lire.jl")
include("encode.jl")
include("tout.jl")
end
