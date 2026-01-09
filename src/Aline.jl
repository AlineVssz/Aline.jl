module Aline 

using CSV
using DataFrames
using GLM

export lire
export encoder
export tout
export entrainer
export predire
export coeff
export top5_variables
export prediction_interface
#export coeffs5_interface
export entrainer_interface

include("lire.jl")
include("encode.jl")
include("tout.jl")
include("modele.jl")
include("modele_interface.jl")
include("predire.jl")
include("coeff.jl")
include("var_facile_interface.jl")


end
