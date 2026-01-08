using CSV
using DataFrames
using GLM

function entrainer(dataset::DataFrame)
    vars = Symbol.(names(dataset, Not(:SalePrice)))
    formula = Term(:SalePrice) ~ sum(Term.(vars))
    modele = lm(formula, dataset)
    return modele
end