
function coeff(modele)
    variables= coefnames(modele)
    coefficients= coef(modele)
    return DataFrame(variables= variables, coefficients= coefficients)
end

function top5_variables(modele, n::Int=5)
    donnees= coeff(modele)
    nvdonnees= donnees[donnees.variables .!= "(Intercept)", :]
    nvdonnees.abscoef= abs.(nvdonnees.coefficients)
    sort!(nvdonnees, :abscoef, rev=true)
    return nvdonnees[1:n, [:variables, :coefficients]]
end